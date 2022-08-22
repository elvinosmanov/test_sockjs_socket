import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_sockjs_socket/components/custom_profile_picture.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/screens/messages/widget/message_item.dart';

import '../../core/styles.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: kRadius8,
          color: kWhiteColor,
        ),
        child: Column(
          children: <Widget>[_buildChatStartedContainer(), MessageItem()],
        ),
      ),
    );
  }

  Container _buildChatStartedContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: kBackgroundColor1,
      ),
      child: const Text('Chat started: Thu 20 Feb, 2021 | 19:15 AM'),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      title: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(R.left),
          ),
          const ProfilePicture(
            bigSize: 32,
            smallSize: 8,
          ),
          const SizedBox(width: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jeremias del Pozo',
                style: kSemiBoldTextStyle(14),
              ),
              Text(
                'Tester',
                style: kMediumTextStyle(12, kGreyColor),
              )
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(R.detailsVertical))
        ],
      ),
    );
  }
}
