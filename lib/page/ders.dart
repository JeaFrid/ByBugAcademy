import 'package:opensource/mobile/ders.dart';
import 'package:opensource/web/ders.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class DersProgrami extends StatelessWidget {
  const DersProgrami({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500
        ? const DersProgramiMobile()
        : const DersProgramiWeb();
  }
}
