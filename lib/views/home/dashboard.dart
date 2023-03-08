import 'package:flick/constants/color_palette.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // The title and notif bar acting as an appbar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: Center(
              child: Text(
                'Flick',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette().primaryBlack),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: ColorPalette().inactiveIconGrey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: ColorPalette().inactiveIconGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
