import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_sockjs_socket/core/R.dart';
import 'package:test_sockjs_socket/core/colors.dart';
import 'package:test_sockjs_socket/core/styles.dart';
import 'package:test_sockjs_socket/extensions/widget_padding_extension.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          prefixText: 'Live chat',
          suffixText: 'Archived',
        ),
        bottomNavigationBar: _buildBottomAppBar(),
        body: Column(
          children: <Widget>[
            const CustomSearcHTextfield(),
            const SizedBox(height: 4),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 184),
                    // const CustomMessageListItem(),
                    DottedBorder(
                        borderType: BorderType.Circle,
                        color: kDarkGreyColor,
                        dashPattern: const [12, 12],
                        padding: const EdgeInsets.all(12),
                        // strokeCap: ,
                        strokeWidth: 1,
                        child: Container(
                          width: 96,
                          height: 96,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: kDarkGreyColor,
                          ),
                          child: SvgPicture.asset(
                            R.livechatBig,
                            fit: BoxFit.scaleDown,
                          ),
                        )),
                    Text(
                      'You have no active chats.\nIf you have active chats, they are listed here.',
                      textAlign: TextAlign.center,
                      style: kMediumTextStyle(14, kGreyColor).copyWith(height: 1.42),
                    ).padding(all: 24)
                  ],
                ),
              ),
            )
          ],
        ));
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      color: kWhiteColor,
      elevation: 0,
      child: SizedBox(
        height: 58,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhiteColor,
          currentIndex: currentIndex,
          showSelectedLabels: true,
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
              tooltip: 'Dashboard',
              icon: SvgPicture.asset(
                R.home,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(R.homeFilled),
            ),
            BottomNavigationBarItem(
              label: 'Messages',
              tooltip: 'Messages',
              icon: SvgPicture.asset(
                R.userGroups,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(R.userGroupsFilled),
            ),
            BottomNavigationBarItem(
              label: 'Live Chat',
              tooltip: 'Live Chat',
              icon: SvgPicture.asset(
                R.livechat,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(R.livechatFilled),
            ),
            BottomNavigationBarItem(
              label: 'Leads',
              tooltip: 'Leads',
              icon: SvgPicture.asset(
                R.leads,
                fit: BoxFit.scaleDown,
              ),
              activeIcon: SvgPicture.asset(R.leadsFilled),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.prefixText,
    required this.suffixText,
  }) : super(key: key);
  final String prefixText;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () {},
              child: Text(prefixText, style: kBoldTextStyle(16)),
            ),
            TextButton(
              style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
              onPressed: () {},
              child: Text(suffixText, style: kBoldTextStyle(16, kPurpleColor)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomSearcHTextfield extends StatelessWidget {
  const CustomSearcHTextfield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 56,
      decoration: const BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
      child: TextField(
        style: kRegularTextStyle(16),
        decoration: InputDecoration(
            isDense: true,
            // contentPadding: const EdgeInsets.only(left: 30, top: 16, bottom: 16),
            prefixIcon: SvgPicture.asset(
              R.search,
              fit: BoxFit.scaleDown,
              color: kGreyColor,
            ).padding(right: 8),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            // prefix: SvgPicture.asset(R.search),
            border: InputBorder.none,
            hintStyle: kRegularTextStyle(16, kGreyColor),
            hintText: 'Search in list'),
      ),
    );
  }
}
