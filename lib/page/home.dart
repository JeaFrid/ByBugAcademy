import 'package:opensource/mobile/home.dart';
import 'package:opensource/web/home.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 1500 ? const HomePageMobile() : const HomePageWeb();
  }
}
