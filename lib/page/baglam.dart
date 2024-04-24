import 'package:opensource/mobile/baglam.dart';
import 'package:opensource/web/baglam.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class Baglamlar extends StatelessWidget {
  const Baglamlar({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500
        ? const BaglamlarMobile()
        : const BaglamlarWeb();
  }
}
