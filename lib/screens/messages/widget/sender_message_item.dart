import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_sockjs_socket/components/custom_profile_picture.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

class Sender extends StatelessWidget {
  const Sender({
    Key? key,
    this.isMultiMessageSent = false,
    required this.body,
    required this.dateTime,
  }) : super(key: key);
  final bool isMultiMessageSent;
  final String body;
  final String dateTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isMultiMessageSent ? 0 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (!isMultiMessageSent)
                Text(
                  'You',
                  style: kMediumTextStyle(12, kGreyColor),
                ),
              const SizedBox(height: 2),
              Container(
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                constraints: BoxConstraints(minWidth: 100, maxWidth: MediaQuery.of(context).size.width - 24 - 36),
                decoration: BoxDecoration(
                    color: kBlueColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      bottomLeft: const Radius.circular(16),
                      bottomRight: const Radius.circular(16),
                      topRight: isMultiMessageSent ? const Radius.circular(16) : const Radius.circular(0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      body,
                      style: kRegularTextStyle(14, kWhiteColor),
                    ).padding(bottom: 4),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          dateTime,
                          style: kRegularTextStyle(12, kWhiteColor.withOpacity(0.5)),
                        ).padding(right: 4),
                        SvgPicture.asset(
                          R.check,
                          color: kWhiteColor,
                          fit: BoxFit.scaleDown,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
