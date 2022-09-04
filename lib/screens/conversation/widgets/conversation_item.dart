import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';
import 'package:test_sockjs_socket/screens/messages/messages_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/custom_profile_picture.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    Key? key,
    required this.title,
    required this.profession,
    required this.unreadMessagesCount,
    required this.conversationId,
    required this.isOnline,
  }) : super(key: key);
  final String title;
  final String profession;
  final int unreadMessagesCount;
  final String conversationId;
  final bool isOnline;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessagesScreen(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1),
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius8),
        child: Row(
          children: [
            ProfilePicture(
              smallCircleColor: isOnline ? kGreenColor : kGreyColor,
            ).padding(right: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: kBoldTextStyle(16),
                ),
                Text(
                  profession,
                  style: kRegularTextStyle(14, kGreyColor),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              R.edit,
              color: kYellowColor,
            ).padding(right: 8),
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: kRedColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadMessagesCount.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: kRegularTextStyle(12, kWhiteColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
