import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

class BubbleFileMessage extends ConsumerStatefulWidget {

  const BubbleFileMessage({
    required this.fileUrl,
    required this.senderName,
    required this.sendTime,
    required this.senderRole,
    required this.profilePic,
    required this.deleteOnTap,
    required this.isSender, super.key,
    this.bubbleRadius = 20,
    this.delivered = false,
    this.seen = false,
  });
  final double bubbleRadius;
  final bool isSender;
  final String fileUrl;
  final String senderName;
  final String sendTime;
  final String senderRole;
  final String profilePic;
  final bool delivered;
  final bool seen;
  final void Function() deleteOnTap;

  @override
  ConsumerState<BubbleFileMessage> createState() => _BubbleFileMessageState();
}

class _BubbleFileMessageState extends ConsumerState<BubbleFileMessage> {
  bool loading = false;
  bool isDownloaded = false;
  String? downloadedFilePath;

  Future<void> downloadFile(String url, String fileName) async {
    try {
      if (!loading) {
        setState(() {
          loading = true;
        });

        final hasPermission = await requestPermissions();
        if (!hasPermission) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage permission not granted.')),
          );
          setState(() {
            loading = false;
          });
          return;
        }

        Directory? downloadsDirectory;
        if (Platform.isAndroid) {
          downloadsDirectory = Directory('/storage/emulated/0/Download');
        } else if (Platform.isIOS) {
          downloadsDirectory = await getApplicationDocumentsDirectory();
        }

        if (downloadsDirectory == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to get downloads directory.')),
          );
          setState(() {
            loading = false;
          });
          return;
        }

        final filePath = '${downloadsDirectory.path}/$fileName';
        final response = await Dio().download(url, filePath);
        if (response.statusCode == 200) {
          setState(() {
            isDownloaded = true;
            downloadedFilePath = filePath;
            loading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File downloaded to $filePath')),
          );
        } else {
          setState(() {
            loading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to download file.')),
          );
        }
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download file: $e')),
      );
    }
  }

  Future<bool> requestPermissions() async {
    if (Platform.isIOS) {
      final status = await Permission.photos.status;
      if (status.isGranted) {
        return true;
      } else if (status.isDenied ) {
        final result = await Permission.photos.request();
        return result.isGranted;
      }
    }
    else {
      print('else');
      final status = await Permission.storage.status;
      if (status.isGranted) {
        return true;
      } else if (status.isDenied || status.isRestricted) {
        final result = await Permission.storage.request();
        return result.isGranted;
      } else if (status.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Storage permission is permanently denied.'
                ' Please enable it in the settings.'),
            action: SnackBarAction(
              label: 'Settings',
              onPressed: openAppSettings,
            ),
          ),
        );
        return false;
      }
    }
    return false;
  }

  Future<void> openFile(String filePath) async {
    final result = await OpenFile.open(filePath);
    if (result.type != ResultType.done) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to open file.')),
      );
    }
  }

  Future<void> openAppSettings() async {
    final opened = await openAppSettings();
    // if (!opened) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Unable to open app settings. Please open manually.')),
    //   );
    // }
  }


  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    final userDetailsState = ref.watch(basicDetailsViewModelProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: widget.isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment:
          widget.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.isSender) CircleAvatar(
              radius: 15,
              backgroundImage: (widget.profilePic != null)
                  ? NetworkImage(widget.profilePic,)
                  : null,
              backgroundColor: silverChalice.shade100,
            ),
            if (!widget.isSender) const SizedBox(width: 8),

            Column(
              crossAxisAlignment: widget.isSender
                  ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.isSender ? 'You ' : '${widget.senderName} ' ,
                      style: heading4.copyWith(color: dark
                          ? const Color(0xffD3D3D3): silverChalice.shade900,),
                    ),
                    if(!widget.isSender)Text(
                      '${widget.senderRole} ',
                      style: heading4.copyWith(color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade500,),
                    ),
                    Text(
                      widget.sendTime,
                      style: heading4.copyWith(color: dark
                          ? const Color(0xffD3D3D3):silverChalice.shade500,),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Message bubble
                Row(
                  children: [
                    if(widget.isSender)moreVert(
                      dark: dark,
                      deleteOnTap: widget.deleteOnTap,),
                    // if(isSender)const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {
                        if (isDownloaded && downloadedFilePath != null) {
                          openFile(downloadedFilePath!);
                        }
                      },
                      child: Container(
                        width: context.screenWidth * .6,
                        height: context.screenWidth * .15,
                        constraints: BoxConstraints(
                          maxWidth: context.screenWidth * .7,),
                        decoration: BoxDecoration(
                          color: widget.isSender
                              ? orange.shade500
                              : dark
                              ? const Color(0xff2C2C2E)
                              :silverChalice.shade100,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.isSender
                                ? widget.bubbleRadius : 0,),
                            topRight: Radius.circular(!widget.isSender
                                ? widget.bubbleRadius : 0,),
                            bottomLeft: Radius.circular(widget.bubbleRadius),
                            bottomRight: Radius.circular(widget.bubbleRadius),
                          ),
                        ),
                        child: Padding(
                          padding:const EdgeInsets.symmetric(vertical: 6,
                            horizontal: 12,),
                          child: Center(
                            child: Row(
                              children: [
                                const Icon(Icons.insert_drive_file, size: 30, color: Colors.white),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    widget.fileUrl,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                if (loading)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        loading =false;
                                      });
                                    },
                                      child: const CircularProgressIndicator(color: Colors.white))
                                else if (!isDownloaded)
                                  IconButton(
                                    icon: const Icon(Icons.download, color: Colors.white),
                                    onPressed: () => downloadFile(widget.fileUrl,widget.fileUrl),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                if(widget.seen && widget.isSender)Text('seen',style: heading4.copyWith(
                  color: dark
                      ? const Color(0xffD3D3D3):silverChalice.shade500,),),
                if(widget.delivered && widget.isSender)Text('Delivered',
                  style: heading4.copyWith(color: dark
                      ? const Color(0xffD3D3D3):silverChalice.shade500,),),

              ],
            ),
            if (widget.isSender) const SizedBox(width: 8),
            if (widget.isSender) CircleAvatar(
              radius: 15,
              backgroundImage: (userDetailsState
                  .userDetails?.student?.profilePic != null)
                  ? NetworkImage(userDetailsState
                  .userDetails!.student!.profilePic!,)
                  : null,
              backgroundColor: silverChalice.shade100,
            ),
          ],
        ),
      ),
    );
  }

  Widget moreVert({
    required bool dark,
    required void Function() deleteOnTap,}){
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'Delete') {
          deleteOnTap();
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'Delete',
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
            ),
          ),
        ];
      },
      icon: SvgPicture.asset(Assets.icons.more,
        color: dark ? Colors.white :null,),
    );
  }
}
