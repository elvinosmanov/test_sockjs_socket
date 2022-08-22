import 'dart:convert';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:test_sockjs_socket/components/custom_profile_picture.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';
import 'package:test_sockjs_socket/screens/messages/widget/receiver_message_item.dart';
import 'package:test_sockjs_socket/screens/messages/widget/sender_message_item.dart';

import '../../core/styles.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen(
      {Key? key,
      required this.conversationId,
      required this.name,
      required this.profession,
      required this.isOnline})
      : super(key: key);
  final String conversationId;
  final String name;
  final String profession;
  final bool isOnline;
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final messageTextFieldController = TextEditingController();
  var result;
  late StompClient stompClient;
  final randomNumberGenerator = Random();

  void onConnect(StompFrame frame) {
    stompClient.subscribe(
      destination: '/ws/v1/conversations/${widget.conversationId}/messages?size=120&page=0',
      callback: (frame) {
        setState(() {
          result = json.decode(frame.body!);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // var token =  context.read<LoginProvider>().getSocketToken();
    // print(token);
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJDaGF0ZG9kb0NvbnZlcnNhdGlvblNlcnZpY2UiLCJpZCI6IlVTNmY3ODBlNTVmMzZkNDlkYmE5NGFlYzhkZTU1ZWUyZWIiLCJleHAiOjE2NzEzNTg2MTUsImlhdCI6MTY2MDU1ODYxNX0.BNO-KflcAiw-LaKUiUz45O382IMEyF4MmYieBXQe4Is';
    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: 'https://conversation-staging.chatdodo.com/ws-registration?token=$token',
        onConnect: onConnect,
        onStompError: (p0) => print('error'),
        onWebSocketError: (dynamic error) => print(error.toString()),
      ),
    );
    stompClient.activate();
  }

  @override
  void dispose() {
    super.dispose();
    stompClient.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.name, widget.profession, widget.isOnline),
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
                  _buildChatStartedContainer(),
                  result != null
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: result.length,
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            itemBuilder: (BuildContext context, int index) {
                              final randomBoolean = randomNumberGenerator.nextBool();
                              var date = DateTime.fromMillisecondsSinceEpoch(
                                  result['content'][index]['createDate']);
                              DateFormat df = DateFormat('HH:mm');

                              //Receiver ve ya Sender json datada ne oldugunu bilmediyim ucun random-dan istifade etdim.
                              if (index == 0) {
                                return Receiver(
                                  isOnline: widget.isOnline,
                                  padding: EdgeInsets.zero,
                                  name: result['content'][index]['author']['metadata']['fullName'],
                                  body: result['content'][index]['body'],
                                  dateTime: df.format(date),
                                  isMultiMessageSent: false,
                                );
                              }
                              return randomBoolean
                                  ? Sender(
                                      body: result['content'][index]['body'],
                                      dateTime: df.format(date),
                                    )
                                  : Receiver(
                                      isOnline: widget.isOnline,
                                      name: result['content'][index]['author']['metadata']
                                          ['fullName'],
                                      body: result['content'][index]['body'],
                                      dateTime: df.format(date),
                                      isMultiMessageSent: false,
                                    );
                            },
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
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
                      controller: messageTextFieldController,
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
                        child: GestureDetector(
                          onTap: () => stompClient.send(
                              destination:
                                  '/ws/v1/conversations/${widget.conversationId}/sendMessage',
                              body: json.encode({"body": messageTextFieldController.text})),
                          child: SvgPicture.asset(
                            R.send,
                            fit: BoxFit.scaleDown,
                            color: kWhiteColor,
                          ),
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

  AppBar _buildAppBar(String name, String profession, bool isOnline) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: true,
      title: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: SvgPicture.asset(R.left),
          ),
          ProfilePicture(
            bigSize: 32,
            smallSize: 8,
            smallCircleColor: isOnline ? kGreenColor : kGreyColor,
          ),
          const SizedBox(width: 24),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: kSemiBoldTextStyle(14),
              ),
              Text(
                profession,
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
