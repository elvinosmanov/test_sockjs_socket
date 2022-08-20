import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:test_sockjs_socket/components/custom_textfield.dart';
import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _selectedSegment_02 = ValueNotifier('dms');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomSegment(selectedSegment_02: _selectedSegment_02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    controller: TextEditingController(),
                    prefix: Container(
                      color: Colors.redAccent,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ).padding(left: 24, right: 24)
          ],
        ));
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
        child: AdvancedSegment(
            controller: _selectedSegment_02,
            segments: const {
              'live_chat': 'Live Chat',
              'dms': 'DMs',
              'groups': 'Groups',
            },
            itemPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            sliderDecoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: kRadius8,
            ),
            backgroundColor: kBackgroundColor2,
            inactiveStyle: kMediumTextStyle(16, kGreyColor),
            activeStyle: kSemiBoldTextStyle(16)),
      ),
    );
  }
}
