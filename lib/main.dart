import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StompClient stompClient;
  void onConnect(StompFrame frame) {
    print('girid');
    stompClient.subscribe(
      destination: '/ws/v1/conversations/CN42f4b82a38024038a165e6573310a213/messages?size=120&page=0',
      callback: (frame) {
        // List<dynamic>? result = json.decode(frame.body!);
        print(json.decode(frame.body!)['content'][0]);
      },
    );
    Timer.periodic(const Duration(seconds: 5), (_) {
      stompClient.send(
        destination: '/ws/v1/conversations/CN42f4b82a38024038a165e6573310a213/sendMessage',
        body: json.encode({'body': "Agilgfdsgli ol"}),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    print('error');
    var token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJDaGF0ZG9kb0NvbnZlcnNhdGlvblNlcnZpY2UiLCJpZCI6IlVTNmY3ODBlNTVmMzZkNDlkYmE5NGFlYzhkZTU1ZWUyZWIiLCJleHAiOjE2NzEzNTg2MTUsImlhdCI6MTY2MDU1ODYxNX0.BNO-KflcAiw-LaKUiUz45O382IMEyF4MmYieBXQe4Is';

    stompClient = StompClient(
      config: StompConfig.SockJS(
        url: 'https://conversation-staging.chatdodo.com/ws-registration?token=$token',
        onConnect: onConnect,
        onStompError: (p0) => print('erro'),
        onWebSocketError: (dynamic error) => print(error.toString()),
        // stompConnectHeaders: {'token': token},
        // webSocketConnectHeaders: {
        //   'token': token,
        // },
      ),
    );
    stompClient.activate();
    // Future.delayed(Duration(seconds: 1));
    // stompClient.send(destination: '/ws/v1/conversations/<conversationId>/sendMessage', headers: {'body':'fdsgs'});
  }

  void onMessageReceive(StompFrame frame) {
    var message = json.decode(frame.body!);
    if (message.type == 'JOIN') {
      message.content = message.sender + 'joined';
    } else if (message.type == 'LEAVE') {
      message.content = message.sender + ' left!';
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elvinin api',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Elvinin api'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
