import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

import '../../../components/custom_profile_picture.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    Key? key,
    required this.title,
    required this.profession,
    required this.unreadMessagesCount,
  }) : super(key: key);
  final String title;
  final String profession;
  final int unreadMessagesCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius8),
      child: Row(
        children: [
          const ProfilePicture().padding(right: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jeremias del Pozo',
                style: kBoldTextStyle(16),
              ),
              Text(
                'Tester',
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
              '32',
              textAlign: TextAlign.center,
              style: kRegularTextStyle(12, kWhiteColor),
            ),
          )
        ],
      ),
    );
  }

}
