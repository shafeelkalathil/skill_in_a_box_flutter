import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/constants/enums.dart';
import 'package:skill_in_a_box_flutter/core/routes/route.dart';
import 'package:skill_in_a_box_flutter/core/utils/extension/size_extension.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/features/chats/view_model/chat_view_model.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/app_bar.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/data_not_found.dart';
import 'package:skill_in_a_box_flutter/features/shared/widgets/textform_field.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

@RoutePage()
class ChatRoomScreen extends ConsumerStatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  ConsumerState<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends ConsumerState<ChatRoomScreen> {


  TextEditingController searchController = TextEditingController();
  bool isFilter = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dark = AppHelpers.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: 'Messages'),
      body: SafeArea(
        child: Container(
             decoration: BoxDecoration(
            color: dark ? const Color(0xff2C2C2E) :Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(context.screenWidth * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            prefixIcon: SvgPicture.asset(Assets.icons.search),
                            hintText: 'Search...',
                            controller: searchController,
                            onChanged: (value) {
                              setState(() {
                                // _searchQuery = value.toLowerCase();
                                searchController.text = value.toLowerCase();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 15,),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFilter = !isFilter ;
                            });
                          },
                            child: SvgPicture.asset(Assets.icons.filter,
                            color: isFilter ? orange.shade500 : null,),),
                      ],
                    ),
                  ),
                  Divider(color: dark
                      ? const Color(0xff222223) : silverChalice.shade100,),
                  Consumer(builder: (context, ref, child) {
                    final chatRoomData = ref.watch(chatRoomStreamProvider);
                    return chatRoomData.when(data: (data) {

                      final filteredData = data.chatRooms?.where((chatRoom) {
                        final searchQuery =
                        chatRoom.title!.toLowerCase().contains(searchController.text);

                        if (isFilter) {
                          return searchQuery &&
                              chatRoom.unreadMessagesCount! > 0;
                        }
                        return searchQuery;
                      }).toList();

                      return filteredData != null ||
                          filteredData!.isNotEmpty
                          ? Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:context.screenWidth * 0.02,),
                            child: Column(
                              children: [
                                 ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final chatData = filteredData[index];

                                    var formattedTime = '';
                                    final timestamp =
                                        chatData?.lastMessage?.sentAt;
                                    if(timestamp != null){
                                      final dateTime = DateTime
                                          .fromMillisecondsSinceEpoch
                                        (timestamp * 1000);
                                      formattedTime = DateFormat('hh:mm a').format(dateTime);
                                    }

                                    return ListTile(
                                      onTap: () {
                                        context.router.push(
                                          ChatRoute(
                                            roomName: chatData?.title ?? '',
                                            roomProfile: Assets.images.logo,
                                            roomId: chatData?.chatRoomId ?? '',
                                          ),);
                                      },
                                      title: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(chatData?.title ?? '',
                                          style: heading3.copyWith(fontSize: 14,
                                            color: dark ? Colors.white
                                                :silverChalice.shade900,),),
                                      ),
                                      leading:CircleAvatar(
                                        radius: 24.5,
                                        backgroundImage: (chatData?.avatarUrl != null)
                                            ? NetworkImage(chatData!.avatarUrl!,)
                                            : null,
                                      ),
                                      trailing:Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(formattedTime,style: heading4.copyWith(
                                            color: orange.shade500,),),
                                          if(chatData?.unreadMessagesCount != 0)
                                            CircleAvatar(radius: 13.2,
                                            backgroundColor: orange.shade500,
                                            child: Center(
                                              child: Text(
                                                chatData?.unreadMessagesCount
                                                    .toString() ?? '',
                                                style: heading4.copyWith(
                                                  color: Colors.white,),),),),
                                        ],
                                      ),
                                      subtitle: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              top: 5,
                                            ),
                                            child:
                                            chatData?.lastMessage?.messageType
                                                == MessageType.text.name
                                                ? SizedBox(
                                              width: context.screenWidth *0.5,
                                              child: Text(
                                                chatData?.lastMessage?.content
                                                    ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: subtitle2.copyWith(
                                                  color: dark
                                                      ? const Color(0xffD3D3D3)
                                                      : silverChalice.shade700,
                                                ),),
                                                )
                                                :
                                            chatData?.lastMessage?.messageType
                                                == MessageType.audio.name
                                                ? const Icon(
                                              Iconsax.microphone,size: 20,)
                                                : const SizedBox(),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: filteredData.length ?? 0,
                                  separatorBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:context.screenWidth * 0.1,),
                                      child: Divider(color: dark
                                          ? const Color(0xff222223)
                                          : silverChalice.shade100,),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),)
                          : Expanded(
                          child: CustomDataNotFound(
                              imageUrl: Assets.images.noMessages,
                              title: '',
                              subTitle: '',),);
                    }, error: (error, stackTrace) {
                      return Text(error.toString());
                    }, loading: () {
                      return const CircularProgressIndicator();
                    },);
                  },),
                ],
              ),
            ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.transparent,
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   elevation: 0,
      //   child: SvgPicture.asset(widget.newChat
      //       ? Assets.icons.closeCircle : Assets.icons.addCircle ,),
      // ),
    );
  }
}
