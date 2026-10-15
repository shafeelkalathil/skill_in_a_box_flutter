import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_package/voice_message_package.dart';
import 'package:skill_in_a_box_flutter/core/constants/color_constants.dart';
import 'package:skill_in_a_box_flutter/core/utils/helpers/helpers.dart';
import 'package:skill_in_a_box_flutter/core/utils/styles/text_style.dart';
import 'package:skill_in_a_box_flutter/gen/assets.gen.dart';

import 'package:skill_in_a_box_flutter/features/profile/view_models/basic_details_view_model/basic_details_view_model.dart';

class VoiceMessage extends ConsumerWidget {
  const VoiceMessage({
    required this.isSender,
    required this.audioUrl,
    required this.senderName,
    required this.senderRole,
    required this.profilePic,
    required this.sendTime,
    required this.deleteOnTap,
    super.key,});
  final bool isSender;
  final String audioUrl;
  final String senderName;
  final String senderRole;
  final String profilePic;
  final String sendTime;
  final void Function() deleteOnTap;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final dark = AppHelpers.isDarkMode(context);
    final userDetailsState = ref.watch(basicDetailsViewModelProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isSender) CircleAvatar(
              radius: 15,
              backgroundImage: (profilePic != null)
                  ? NetworkImage(profilePic,)
                  : null,
              backgroundColor: silverChalice.shade100,
            ),
            if (!isSender) const SizedBox(width: 8),

            Column(
              crossAxisAlignment: isSender
                  ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      isSender ? 'You ' : senderName ,
                      style: heading4.copyWith(color: dark
                          ? const Color(0xffD3D3D3)
                          :silverChalice.shade900,),
                    ),
                    if(!isSender)Text(
                      senderRole,
                      style: heading4.copyWith(color: dark
                          ? const Color(0xffD3D3D3)
                          :silverChalice.shade500,),
                    ),
                    Text(
                      sendTime,
                      style: heading4.copyWith(color:dark
                          ? const Color(0xffD3D3D3)
                          : silverChalice.shade500,),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Message bubble
                Row(
                  children: [
                    if(isSender)moreVert(dark: dark,deleteOnTap: deleteOnTap),
                    VoiceMessageView(
                      isSender: isSender,
                      circlesColor: Colors.transparent,
                      activeSliderColor: isSender || dark
                          ? Colors.white : silverChalice.shade900,
                      backgroundColor: isSender ?  orange.shade500
                          : dark ? const Color(0xff2C2C2E)
                          : silverChalice.shade100,
                      controller: VoiceController(
                        audioSrc: audioUrl,
                        onComplete: () {},
                        onPause: () {},
                        onPlaying: () {},
                        onError: (err) {},
                        maxDuration: const Duration(minutes: 5),
                        isFile: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (isSender) const SizedBox(width: 8),
            if (isSender) CircleAvatar(
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
