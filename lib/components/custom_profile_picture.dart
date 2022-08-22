import 'package:flutter/material.dart';
import 'package:test_sockjs_socket/core/R.dart';

import 'package:test_sockjs_socket/core/colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    this.bigSize,
    this.smallSize,
  }) : super(key: key);
  final double? bigSize;
  final double? smallSize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: bigSize ?? 48,
          height: bigSize ?? 48,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              image: DecorationImage(image: AssetImage(R.ellipse2Image))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: smallSize ?? 12,
            height: smallSize ?? 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(color: kWhiteColor, width: 1)),
          ),
        )
      ],
    );
  }
}
