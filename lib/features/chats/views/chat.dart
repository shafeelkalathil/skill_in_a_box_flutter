
import 'dart:async';
import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/utils/formatters/date_formatter.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/features/chats/model/chat_model/chat_model.dart';
import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_params.dart';
import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_state.dart';
import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_view_model.dart';
import 'package:skill_in_a_box_flutter/features/chats/widgets/bubble_file.dart';
import 'package:skill_in_a_box_flutter/features/chats/widgets/bubble_images.dart';
import 'package:skill_in_a_box_flutter/features/chats/widgets/bubble_textmessage.dart';
import 'package:skill_in_a_box_flutter/features/chats/widgets/datechip_message.dart';
import 'package:skill_in_a_box_flutter/features/chats/widgets/voice_message.dart';
import 'package:skill_in_a_box_flutter/features/chats/widgets/voice_recorder.dart';
import 'package:skill_in_a_box_flutter/features/my_courses/widgets/custom_alert_box.dart';
import 'package:skill_in_a_box_flutter/features/onboarding/views/onboarding_view.dart';
import 'package:skill_in_a_box_flutter/features/shared/view_model/file_upload/file_upload_states.dart';
import 'package:skill_in_a_box_flutter/features/shared/view_model/file_upload/file_upload_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';


@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    required this.roomName,
    required this.roomProfile,
    required this.roomId,
    super.key,
  });
  
  final String roomName;
  final String roomProfile;
  final String roomId;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {

  final TextEditingController messageController = TextEditingController();

  bool isEdit = false;
  String messageId = '';
  int _recordDuration = 0;

  final record = AudioRecorder();
  Timer? _timer;
  // Timer? _ampTimer;
  final _audioRecorder = AudioRecorder();
  bool isMicClick = false;
  late ap.AudioSource audioSource;
  ap.AudioPlayer audioPlayer = ap.AudioPlayer();

  ChatModel? chatData ;

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        final image = File(pickedFile.path);

        final file = PlatformFile(
          path: image.path,
          name: basename(image.path),
          size: await image.length(),
        );

        await ref.read(fileUploadViewModelProvider.notifier)
            .uploadFile(file).then((value) async {
              final uploadState = ref.watch(fileUploadViewModelProvider);
              if(uploadState is FileUploadedSuccess){
                final paramsData = SendMessageParams(
                  roomId: widget.roomId,
                  content: uploadState.fileUploadModel.url ?? '',
                  messageType: MessageType.image.name,
                );
                await ref.read(chatViewModelNotifier.notifier)
                    .sendMessage(params: paramsData);
              }
            },);

      } else {
      }
    } catch (e) {}
  }

  Future<void> pickFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final file = File(result.files.single.path!);
        final pickedFile = PlatformFile(
          path: file.path,
          name: basename(file.path), // Extract file name
          size: await file.length(), // Get file size
        );

        await ref.read(fileUploadViewModelProvider.notifier)
            .uploadFile(pickedFile).then((value) async {
          final uploadState = ref.watch(fileUploadViewModelProvider);
          if(uploadState is FileUploadedSuccess){
            final paramsData = SendMessageParams(
              roomId: widget.roomId,
              content: uploadState.fileUploadModel.url ?? '',
              messageType: MessageType.file.name,
            );
            await ref.read(chatViewModelNotifier.notifier)
                .sendMessage(params: paramsData);
          }
        },);

      }
    } catch (e) {}
  }

  void showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.image, color: Colors.green),
                title: const Text('Image Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(context, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.orange),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file, color: Colors.blue),
                title: const Text('File'),
                onTap: () {
                  Navigator.pop(context);
                  pickFile(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildRecordStopControl({
    required bool dark,
    required BuildContext context,
  }) {
    // Define the icon based on the recording state
    IconButton icon;
    if (isMicClick) {
      icon = IconButton(
          onPressed: () {
            _stop(context);
          },
          icon: Icon(
            Icons.stop_rounded,
            size: 32,
            color: orange.shade500,
          ),);
    } else {
      icon = IconButton(
          onPressed: _start,
          icon: SvgPicture.asset(
            'assets/icons/chat_mic.svg',
            color: dark ? Colors.white : Colors.black,
          ),);
    }

    return icon;
  }

  Future<void> _start() async {
    try {

      // Ensure the app has permissions
      if (await _audioRecorder.hasPermission()) {
        // Get the directory path
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a'; // Unique file name

        // Ensure the directory exists
        final dir = Directory(directory.path);
        if (!dir.existsSync()) {
          await dir.create(recursive: true);
        }

        // Start recording
        await _audioRecorder.start(
          const RecordConfig(),
          path: filePath,
        );

        setState(() {
          isMicClick = true;
          _recordDuration = 0;
          audioPlayer.stop();
        });

        // Start timer for UI updates
        _startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop(BuildContext context) async {
    _timer?.cancel();
    // _ampTimer?.cancel();

    // Stop the audio recorder
    final path = await _audioRecorder.stop();

    if (path == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to record audio.')),
      );
      return;
    }

    // Check if the file exists
    final audio = File(path);
    if (!audio.existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Recorded file does not exist.')),
      );
      return;
    }

    // Convert file to PlatformFile
    final platformFile = PlatformFile(
      name: audio.uri.pathSegments.last,
      path: audio.path,
      size: await audio.length(),
    );

    // Show a loading indicator
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Uploading audio...')),
    );

    // Upload the file
    try {
      await ref.read(fileUploadViewModelProvider.notifier).uploadFile(platformFile).then((value) async {
        final uploadState = ref.watch(fileUploadViewModelProvider);
        if (uploadState is FileUploadedSuccess) {
          final paramsData = SendMessageParams(
            roomId: widget.roomId,
            content: uploadState.fileUploadModel.url ?? '',
            messageType: MessageType.audio.name,
          );
          await ref.read(chatViewModelNotifier.notifier)
              .sendMessage(params: paramsData);
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }

    // Reset recording states
    setState(() {
      isMicClick = false ;
    });
  }

  void _startTimer() {
    _timer?.cancel();
    // _ampTimer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 10)).then((value) {
      updateSeenByField();
    },);
    super.initState();
  }


  Future<void> updateSeenByField() async {

    final db = FirebaseFirestore.instance;
    final collection = db.collection('chat_rooms')
        .doc(widget.roomId).collection('messages');

    final snapshot = await collection.get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    for (final doc in documents) {
      final data = doc.data()! as Map<String, dynamic>;

      final seenByList = (data['seenBy'] as List<dynamic>?) ?? [];

      if (!seenByList.contains(ref.read(userIdProvider))) {
        seenByList.add(ref.read(userIdProvider));
        await doc.reference.update({
          'seenBy': seenByList,
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final userId = ref.watch(userIdProvider);
    return Scaffold(
      appBar: CustomAppBar(title:widget.roomName,),
      body: SafeArea(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final chatData = ref.watch(chatStreamProvider(widget.roomId));

                return chatData.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return const Expanded(
                        child: Center(child: Text('No messages found.')),
                      );
                    }

                    /// Sort messages first by date
                    data.sort((a, b) {
                      /// Convert sentAt timestamps to DateTime
                      final dateTimeA = DateTime.fromMillisecondsSinceEpoch(a.sentAt! * 1000);
                      final dateTimeB = DateTime.fromMillisecondsSinceEpoch(b.sentAt! * 1000);

                      /// Extract only the date part for comparison
                      final dateA = DateTime(dateTimeA.year, dateTimeA.month, dateTimeA.day);
                      final dateB = DateTime(dateTimeB.year, dateTimeB.month, dateTimeB.day);

                      /// Compare dates in descending order
                      final dateComparison = dateB.compareTo(dateA);
                      if (dateComparison != 0) {
                        return dateComparison;
                      }

                      /// If dates are the same, compare times in ascending order
                      return dateTimeA.compareTo(dateTimeB);
                    });


                    /// Group messages by today, yesterday, or older dates
                    final groupedMessages = <List<Message>>[];
                    DateTime? lastDate;

                    for (final message in data) {
                      final timestamp = message.sentAt!;
                      final dateTime = DateTime
                          .fromMillisecondsSinceEpoch(timestamp * 1000);

                      if (lastDate == null || !isSameDay(lastDate, dateTime)) {
                        groupedMessages.add([]);
                      }

                      groupedMessages.last.add(message);
                      lastDate = dateTime;
                    }

                    return Expanded(
                      child: ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: groupedMessages.length,
                        itemBuilder: (context, groupIndex) {
                          final messageGroup = groupedMessages[groupIndex];


                          final firstMessage = messageGroup.first;
                          final firstMessageTime = DateTime
                              .fromMillisecondsSinceEpoch
                            (firstMessage.sentAt! * 1000);
                          var formattedDate = '';

                          if (isSameDay(firstMessageTime, DateTime.now())) {
                            formattedDate = 'Today';
                          } else if (isSameDay(firstMessageTime, DateTime.now()
                              .subtract(const Duration(days: 1)),)) {
                            formattedDate = 'Yesterday';
                          } else {
                            formattedDate = DateFormatter.getFormattedDate
                              (firstMessageTime, format: 'dd MMMM yyyy');
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              DateChipMessage(
                                  date: formattedDate,
                                ),
                              ...messageGroup.map((message) {
                                final timestamp = message.sentAt!;
                                final dateTime = DateTime
                                    .fromMillisecondsSinceEpoch
                                  (timestamp * 1000);
                                final formattedTime = DateFormat('hh:mm a').format(dateTime);


                                return message.messageType ==
                                    MessageType.text.name
                                    ? BubbleTextMessage(
                                  text: message.content ?? '',
                                  isSender: message.sentBy?.id == userId,
                                  senderName: message.sentBy?.name ?? '',
                                  senderRole: message.sentBy?.userType ?? '',
                                  profilePic: message.sentBy?.profilePic ?? '',
                                  sendTime: formattedTime,
                                  editOnTap: () {
                                    messageController.text = message.content
                                        ?? '';
                                    setState(() {
                                      isEdit = true;
                                      messageId = message.messageId ?? '';
                                    });
                                  },
                                  deleteOnTap: () async {
                                    final params = DeleteMessageParams(
                                      roomId: widget.roomId,
                                      messageId: message.messageId ?? '',
                                    );
                                    await ref
                                        .read(chatViewModelNotifier.notifier)
                                        .deleteMessage(params: params)
                                        .then((value) {
                                      final deleteState =
                                      ref.watch(chatViewModelNotifier);
                                      if (deleteState is
                                      DeleteMessageStateSuccess) {
                                        // Successfully deleted
                                      } else {
                                        const CustomAlertBox();
                                      }
                                    });
                                  },
                                )
                                    : message.messageType ==
                                    MessageType.image.name
                                    ? BubbleImagesMessage(
                                  imageUrl: message.content ?? '',
                                  isSender: message.sentBy?.id == userId,
                                  senderName: message.sentBy?.name ?? '',
                                  senderRole: message.sentBy?.userType ?? '',
                                  profilePic: message.sentBy?.profilePic ?? '',
                                  sendTime: formattedTime,
                                  deleteOnTap: () async {
                                    final params = DeleteMessageParams(
                                      roomId: widget.roomId,
                                      messageId: message.messageId ?? '',
                                    );
                                    await ref
                                        .read(chatViewModelNotifier.notifier)
                                        .deleteMessage(params: params)
                                        .then((value) {
                                      final deleteState =
                                      ref.watch(chatViewModelNotifier);
                                      if (deleteState is
                                      DeleteMessageStateSuccess) {
                                        // Successfully deleted
                                      } else {
                                        const CustomAlertBox();
                                      }
                                    });
                                  },
                                )
                                    : message.messageType ==
                                    MessageType.file.name
                                    ? BubbleFileMessage(
                                  fileUrl: message.content ?? '',
                                  isSender: message.sentBy?.id == userId,
                                  senderName: message.sentBy?.name ?? '',
                                  senderRole: message.sentBy?.userType ?? '',
                                  profilePic: message.sentBy?.profilePic ?? '',
                                  sendTime: formattedTime,
                                  deleteOnTap: () async {
                                    final params = DeleteMessageParams(
                                      roomId: widget.roomId,
                                      messageId: message.messageId ?? '',
                                    );
                                    await ref
                                        .read(chatViewModelNotifier.notifier)
                                        .deleteMessage(params: params)
                                        .then((value) {
                                      final deleteState =
                                      ref.watch(chatViewModelNotifier);
                                      if (deleteState is
                                      DeleteMessageStateSuccess) {
                                        // Successfully deleted
                                      } else {
                                        const CustomAlertBox();
                                      }
                                    });
                                  },
                                )
                                    : message.messageType ==
                                    MessageType.audio.name
                                    ? VoiceMessage(
                                    isSender: message.sentBy?.id == userId,
                                    audioUrl: message.content ?? '',
                                    sendTime: formattedTime,
                                    senderName: message.sentBy?.name ?? '',
                                  senderRole: message.sentBy?.userType ?? '',
                                  profilePic: message.sentBy?.profilePic ?? '',
                                    deleteOnTap: () async {
                                    final params = DeleteMessageParams(
                                      roomId: widget.roomId,
                                      messageId: message.messageId ?? '',
                                    );
                                    await ref
                                        .read(chatViewModelNotifier.notifier)
                                        .deleteMessage(params: params)
                                        .then((value) {
                                      final deleteState =
                                      ref.watch(chatViewModelNotifier);
                                      if (deleteState is
                                      DeleteMessageStateSuccess) {
                                        // Successfully deleted
                                      } else {
                                        const CustomAlertBox();
                                      }
                                    });
                                  },
                                )
                                    : const SizedBox();
                              }),
                            ],
                          );
                        },
                      ),
                    );

                  },
                  error: (error, stackTrace) {
                    return Center(
                        child: Text('Failed to load messages: $error'),);
                  },
                  loading: () {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                );
              },
            ),
            Container(
              color: dark
                  ? const Color(0xff2C2C2E):silverChalice.shade50,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  if(!isMicClick)IconButton(
                    icon: SvgPicture.asset(Assets.icons.attch,
                      color: dark ? Colors.white :null,),
                    onPressed: () => showAttachmentOptions(context),
                  ),
                  if(!isMicClick)Expanded(
                    child: SizedBox(
                      height: 44,
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          filled: true,
                          fillColor: dark
                              ? const Color(0xff222223):Colors.white,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  if(isMicClick)VoiceRecorder(recordDuration: _recordDuration,onPressed: () {
                    setState(() {
                      isMicClick = false;
                      _timer?.cancel();
                      // _ampTimer?.cancel();
                    });
                    Navigator.of(context).pop();
                  },),

                  if (messageController.text.isEmpty)
                    _buildRecordStopControl(dark: dark,context: context)
                  else IconButton(
                        icon: SvgPicture.asset(Assets.icons.send),
                        onPressed: () async {
                          if (isEdit) {
                            final params = EditMessageParams(
                              roomId: widget.roomId,
                              messageId: messageId,
                              content: messageController.text,
                              messageType: MessageType.text.name,
                            );
                            await ref.read(chatViewModelNotifier.notifier).editMessage(params: params).then(
                                  (value) {
                                final editState = ref.watch(chatViewModelNotifier);
                                if (editState is EditMessageStateSuccess) {
                                  // Handle success
                                } else {
                                  const CustomAlertBox();
                                }
                              },
                            );
                            setState(() {
                              isEdit = false;
                            });
                          }
                          else {
                            final paramsData = SendMessageParams(
                              roomId: widget.roomId,
                              content: messageController.text,
                              messageType: MessageType.text.name,
                            );
                            await ref.read(chatViewModelNotifier.notifier).sendMessage(params: paramsData).then(
                                  (value) {
                                final state = ref.watch(chatViewModelNotifier);
                                if (state is SendMessageStateSuccess) {}
                                else {}
                              },
                            );
                          }
                          messageController.clear();
                        },
                      ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
