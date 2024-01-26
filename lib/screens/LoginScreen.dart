import 'package:flutter/material.dart';
import 'package:holohive/widgets/TopBar.dart';

import '../widgets/Login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TopBar(),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Spacer(flex: 1),
              Expanded(flex: 10, child: LoginWidget()),
              Spacer(flex: 1)
            ],
          ),
        ),
      ],
    );
  }
}
