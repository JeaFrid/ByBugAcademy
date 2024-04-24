import 'package:opensource/mobile/register.dart';
import 'package:opensource/web/register.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 900 ? const RegisterMobile() : const RegisterWeb();
  }
}
