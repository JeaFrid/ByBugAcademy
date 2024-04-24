import 'package:opensource/mobile/sertifika.dart';
import 'package:opensource/web/sertifika.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class Sertifika extends StatelessWidget {
  const Sertifika({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 900
        ? const SertifikaMobile()
        : const SertifikaWeb();
  }
}
