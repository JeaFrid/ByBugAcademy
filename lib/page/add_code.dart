import 'package:opensource/mobile/add_code.dart';
import 'package:opensource/web/add_code.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class AddSCode extends StatelessWidget {
  const AddSCode({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500 ? const AddSCodeMobile() : const AddSCodeWeb();
  }
}
