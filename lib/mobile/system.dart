import 'package:opensource/web/system.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class SystemMonitoru extends StatelessWidget {
  const SystemMonitoru({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1000 ? const SizedBox() : const SystemMonitoruWeb();
  }
}
