import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late StompClient stompClient;
  // void onConnect(StompFrame frame) {
  //   print('girid');
  //   stompClient.subscribe(
  //     destination: '/ws/v1/conversations/CN42f4b82a38024038a165e6573310a213/messages?size=120&page=0',
  //     callback: (frame) {
  //       // List<dynamic>? result = json.decode(frame.body!);
  //       print(json.decode(frame.body!)['content'][0]);
  //     },
  //   );
  //   Timer.periodic(const Duration(seconds: 5), (_) {
  //     stompClient.send(
  //       destination: '/ws/v1/conversations/CN42f4b82a38024038a165e6573310a213/sendMessage',
  //       body: json.encode({'body': "Agilgfdsgli ol"}),
  //     );
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   print('error');
  //   var token =
  //       'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJVc2VyIERldGFpbHMiLCJpc3MiOiJDaGF0ZG9kb0NvbnZlcnNhdGlvblNlcnZpY2UiLCJpZCI6IlVTNmY3ODBlNTVmMzZkNDlkYmE5NGFlYzhkZTU1ZWUyZWIiLCJleHAiOjE2NzEzNTg2MTUsImlhdCI6MTY2MDU1ODYxNX0.BNO-KflcAiw-LaKUiUz45O382IMEyF4MmYieBXQe4Is';

  //   stompClient = StompClient(
  //     config: StompConfig.SockJS(
  //       url: 'https://conversation-staging.chatdodo.com/ws-registration?token=$token',
  //       onConnect: onConnect,
  //       onStompError: (p0) => print('error'),
  //       onWebSocketError: (dynamic error) => print(error.toString()),
  //       // stompConnectHeaders: {'token': token},
  //       // webSocketConnectHeaders: {
  //       //   'token': token,
  //       // },
  //     ),
  //   );
  //   stompClient.activate();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ' Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: kBackgroundColor,
              toolbarHeight: 48.0,
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(color: kBlackColor),
            ),
            scaffoldBackgroundColor: kBackgroundColor),
        home: const LoginScreen());
  }
}
