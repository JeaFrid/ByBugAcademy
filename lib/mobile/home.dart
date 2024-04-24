import 'package:opensource/page/page.dart';
import 'package:opensource/widget/post.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  List<Widget> posts = [];
  getPost() async {
    Map<String, List> profiles = {};
    List getProfiles = await CosmosFirebase.getOnce("users");

    List getData = await CosmosFirebase.getOnce("post");
    List dataReversed = CosmosTools.sortFromList(getData, 4);
    List datas = dataReversed.reversed.toList();
    for (List element in getProfiles) {
      profiles.addAll({element[element.length - 1]: element});
    }
    for (List element in datas) {
      //ip,
      //tag,
      //uid,
      //controller.text,
      //CosmosTime.getNowTimeString(),

      List getMyProfile = profiles['"${element[2]}"']!;
      String time = element[4];
      String hour = time.split(" ")[1].split(":")[0];
      String min = time.split(" ")[1].split(":")[1];
      posts.add(
        PostComponent(
          image: getMyProfile[10],
          title: getMyProfile[1],
          subtitle: "Herkese Açık",
          time: "$hour:$min",
          text: element[3],
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.home,
      title: "Anasayfa",
      children: [
        Column(
          children: posts,
        ),
      ],
    );
  }
}
