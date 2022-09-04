
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/provider/login_provider.dart';
import 'package:test_sockjs_socket/screens/messages/messages_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        )
      ],
      child: MaterialApp(
          title: ' Flutter App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                color: kWhiteColor,
                toolbarHeight: 48.0,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: TextStyle(color: kBlackColor),
              ),
              scaffoldBackgroundColor: kBackgroundColor1),
          home:   MessagesScreen()),
    );
  }
}
