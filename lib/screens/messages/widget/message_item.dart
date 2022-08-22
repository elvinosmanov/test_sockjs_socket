import 'package:flutter/material.dart';
import 'package:test_sockjs_socket/components/custom_profile_picture.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const ProfilePicture(
              bigSize: 24,
              smallSize: 8,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'Jeremias de Pozo',
              style: kMediumTextStyle(12, kGreyColor),
            )
          ],
        ).padding(bottom: 2),
        Container(
          margin: EdgeInsets.only(right: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: const BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hey, Can you show me how to add a team?',
                style: kRegularTextStyle(14),
              ).padding(bottom: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '19:20',
                    style: kRegularTextStyle(12),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
