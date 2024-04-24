import 'package:opensource/mobile/profile.dart';
import 'package:opensource/web/profile.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return width(context) < 900 ? const ProfileMobile() : const ProfileWeb();
  }
}
