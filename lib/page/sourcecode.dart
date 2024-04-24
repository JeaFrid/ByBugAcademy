import 'package:opensource/mobile/sourcecode.dart';
import 'package:opensource/web/sourcecode.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class SourceCode extends StatelessWidget {
  const SourceCode({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500
        ? const SourceCodeMobile()
        : const SourceCodeWeb();
  }
}
