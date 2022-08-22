import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_sockjs_socket/components/custom_profile_picture.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';
import 'package:test_sockjs_socket/screens/messages/widget/receiver_message_item.dart';
import 'package:test_sockjs_socket/screens/messages/widget/sender_message_item.dart';

import '../../core/styles.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                borderRadius: kRadius8,
                color: kWhiteColor,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: <Widget>[
                        _buildChatStartedContainer(),
                        const Receiver(
                          body: "Salam necesiniz?",
                          name: 'Elvin Osmanov',
                          dateTime: '09:45',
                        ),
                        const Sender(
                          body:
                              "Yaxsi cox sagolun. Yaxsi cox sagolun.Yaxsi cox sagols cox sagolun.Yaxsi cox sagolun.Yaxsi cox sagolun.Yaxsi cox sagolun.",
                          dateTime: "10:00",
                        ),
                        const Sender(
                          body: "Bes siz necesiniz?",
                          dateTime: "10:01",
                          isMultiMessageSent: true,
                        ),
                        const Receiver(
                          body: "Salam necesiniz bfidbofjlkjbj sadkonfn hjkadfg  fsad  sfa fsd?",
                          name: 'Elvin Osmanov',
                          dateTime: '09:45',
                        ),
                        const Receiver(
                          body: "Salam necesiniz?",
                          name: 'Elvin Osmanov',
                          dateTime: '09:45',
                          isMultiMessageSent: true,
                        ),
                        const Sender(
                          body: "Bes siz necesiniz?",
                          dateTime: "10:01",
                        ),
                        const Receiver(
                          body: "Salam necesiniz?",
                          name: 'Elvin Osmanov',
                          dateTime: '09:45',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            decoration: BoxDecoration(color: kWhiteColor, borderRadius: kRadius8),
            padding: const EdgeInsets.all(8),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 110, maxHeight: 110),
              decoration: BoxDecoration(color: kBackgroundColor1, borderRadius: kRadius8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      style: kRegularTextStyle(14),
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 12),
                          border: InputBorder.none,
                          hintText: 'Message to Jeremies del Pozo',
                          hintStyle: kMediumTextStyle(14, const Color(0xFFB0B7C3))),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(R.hashtag).padding(right: 16),
                      SvgPicture.asset(R.smiles).padding(right: 16),
                      SvgPicture.asset(R.attachment),
                      const Spacer(),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: kBlueColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          R.send,
                          fit: BoxFit.scaleDown,
                          color: kWhiteColor,
                        ),
                      )
                    ],
                  ).padding(bottom: 8)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatStartedContainer() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: kBackgroundColor1,
        ),
        child: const Text('Chat started: Thu 20 Feb, 2021 | 19:15 AM'),
      ),
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
