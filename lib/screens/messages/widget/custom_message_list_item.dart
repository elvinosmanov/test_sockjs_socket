import 'package:flutter/material.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';

class CustomMessageListItem extends StatelessWidget {
  const CustomMessageListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAvatar(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Chloe Burke',
                  style: kBoldTextStyle(16, kDarkGreyColor),
                ),
                Text(
                  'Customise',
                  style: kRegularTextStyle(12, kGreyColor),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: kPurpleColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              '12',
              style: kMediumTextStyle(12, kWhiteColor),
            ),
          )
        ],
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(13.33),
          ),
        ),
        Positioned(
          bottom: -4,
          right: -4,
          child: Container(
            width: 15.5,
            height: 15.5,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: kWhiteColor),
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
