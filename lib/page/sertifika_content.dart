import 'package:opensource/mobile/sertifika_content.dart';
import 'package:opensource/web/sertifika_content.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class SertifikaContent extends StatelessWidget {
  final String id;
  const SertifikaContent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return width(context) < 900
        ? SertifikaContentMobile(id: id)
        : SertifikaContentWeb(id: id);
  }
}
