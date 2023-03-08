import 'package:flick/views/home/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/color_palette.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final List<Widget?> pages = const [Dashboard()];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
        // bottom navigation
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.white,
            backgroundColor: Colors.white,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 12, color: ColorPalette().primaryBlack)),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          ),
          child: NavigationBar(
            elevation: 0,
            height: height * 0.08,
            animationDuration: const Duration(seconds: 1),
            selectedIndex: index,
            onDestinationSelected: (value) {
              setState(() {
                index = value;
              });
            },

            // destinations in nav bar
            destinations: [
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.dashboard,
                    color: ColorPalette().primaryBlack,
                  ),
                  icon: Icon(
                    Icons.dashboard_outlined,
                    color: ColorPalette().inactiveIconGrey,
                  ),
                  label: 'Dashboard'),

              //
              NavigationDestination(
                  selectedIcon: Icon(CupertinoIcons.chat_bubble_text_fill,
                      color: ColorPalette().primaryBlack),
                  icon: Icon(CupertinoIcons.chat_bubble_text,
                      color: ColorPalette().inactiveIconGrey),
                  label: 'Chats'),

              //
              NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.at_circle_fill,
                    color: ColorPalette().primaryBlack,
                  ),
                  icon: Icon(CupertinoIcons.at_circle,
                      color: ColorPalette().inactiveIconGrey),
                  label: 'Account'),
            ],
          ),
        ),
        body: pages[index]);
  }
}
