import 'package:opensource/mobile/add_sertifika.dart';
import 'package:opensource/web/add_sertifika.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class AddSertifika extends StatelessWidget {
  const AddSertifika({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500
        ? const AddSertifikaMobile()
        : const AddSertifikaWeb();
  }
}
