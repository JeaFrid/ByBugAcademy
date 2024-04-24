import 'package:opensource/mobile/add_basari.dart';
import 'package:opensource/web/add_basari.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class AddBasarim extends StatelessWidget {
  const AddBasarim({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500
        ? const AddBasarimMobile()
        : const AddBasarimWeb();
  }
}
