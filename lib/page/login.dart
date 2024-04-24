import 'package:opensource/mobile/login.dart';
import 'package:opensource/web/login.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 900 ? const LoginMobile() : const LoginWeb();
  }
}
