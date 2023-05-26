import 'package:firebase_auth/firebase_auth.dart';
import 'package:nrich_assignment/auth.dart';
import 'package:nrich_assignment/pages/home_page.dart';
import 'package:nrich_assignment/pages/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          // User is authenticated, show the home page
          final User user = snapshot.data!;
          return HomePage(name: user.displayName ?? '');
        } else {
          // User is not authenticated, show the login/register page
          return const LoginPage();
        }
      },
    );
  }
}
