import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_sockjs_socket/components/custom_textfield.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';
import 'package:test_sockjs_socket/screens/conversation/widgets/conversation_item.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import '../../core/R.dart';
import 'dart:convert';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final _selectedSegment_02 = ValueNotifier('dms');
  int currentIndex = 1;
  var result;
  late StompClient stompClient;
  void onConnect(StompFrame frame) {
    stompClient.subscribe(
      destination: '/ws/v1/conversations',
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
    // TODO: implement dispose
    super.dispose();
    stompClient.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: _buildBottomAppBar(),
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomSegment(selectedSegment_02: _selectedSegment_02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: CustomTextField(
                          controller: TextEditingController(),
                          hintText: 'Search in list',
                          hintStyle: kRegularTextStyle(16, const Color(0xFFC9CED6)),
                          prefixIcon: SvgPicture.asset(
                            R.search,
                            color: const Color(0xFFC9CED6),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          borderRadius: kRadius8,
                          border: Border.all(color: kBorderColor, width: 1),
                        ),
                        child: SvgPicture.asset(
                          R.leadsFilled,
                          fit: BoxFit.scaleDown,
                        ),
                      )
                    ],
                  ).padding(left: 24, right: 24, top: 16, bottom: 16)
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            result != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return ConversationItem(
                            isOnline: result[index]['metadata']['user']['isOnline'],
                            conversationId: result[index]['id'],
                            title: result[index]['metadata']['user']['metadata']['fullName'],
                            profession: 'Tester',
                            unreadMessagesCount: result[index]['unreadMessagesCount']);
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(R.ellipse1Image),
          ),
          SvgPicture.asset(R.settings)
        ],
      ).padding(left: 23, right: 24),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      color: kWhiteColor,
      elevation: 0,
      child: SizedBox(
        height: 72,
        child: BottomNavigationBar(
          backgroundColor: kWhiteColor,
          currentIndex: currentIndex,
          selectedItemColor: kBlackColor,
          unselectedItemColor: kGreyColor,
          unselectedLabelStyle: kRegularTextStyle(12),
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: SvgPicture.asset(
                currentIndex == 0 ? R.homeFilled : R.home,
                fit: BoxFit.scaleDown,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Messages',
              icon: SvgPicture.asset(
                currentIndex == 1 ? R.leadsFilled : R.leadsFilled,
                fit: BoxFit.scaleDown,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Leads',
              icon: SvgPicture.asset(
                currentIndex == 2 ? R.leadsFilled : R.leadsFilled,
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSegment extends StatelessWidget {
  const CustomSegment({
    Key? key,
    required ValueNotifier<String> selectedSegment_02,
  })  : _selectedSegment_02 = selectedSegment_02,
        super(key: key);

  final ValueNotifier<String> _selectedSegment_02;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(color: kBorderColor, borderRadius: kRadius8),
      ),
    );
  }
}
