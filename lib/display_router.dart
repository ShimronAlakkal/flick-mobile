import 'package:flick/views/auth/si_su_router.dart';
import 'package:flutter/material.dart';

class DisplayRouter extends StatefulWidget {
  final bool isLoggedIn;
  const DisplayRouter({super.key, required this.isLoggedIn});

  @override
  State<DisplayRouter> createState() => _DisplayRouterState();
}

class _DisplayRouterState extends State<DisplayRouter> {
  @override
  Widget build(BuildContext context) {
    return SISURouter(
      isLoggedIn: widget.isLoggedIn,
    );
  }
}
