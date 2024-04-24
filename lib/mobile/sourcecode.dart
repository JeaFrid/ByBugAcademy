import 'package:opensource/page/page.dart';
import 'package:opensource/widget/code.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';

class SourceCodeMobile extends StatefulWidget {
  const SourceCodeMobile({super.key});

  @override
  State<SourceCodeMobile> createState() => _SourceCodeMobileState();
}

class _SourceCodeMobileState extends State<SourceCodeMobile> {
  List<Widget> codeList = [];
  getData() async {
    List getData = await CosmosFirebase.getOnce("code");
    List dataReversed = CosmosTools.sortFromList(getData, 6);
    List datas = dataReversed.reversed.toList();
    for (List dataList in datas) {
      //uid,
      //tag,
      //projectName.text,
      //projectAbout.text,
      //projectLanguage.text,
      //projectCode.text,
      //CosmosTime.getNowTimeString(),
      codeList.add(
        CodeComponent(
          title: dataList[2],
          subtitle: dataList[3],
          code: dataList[5],
          language: dataList[4],
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.code,
      title: "Açık Kaynak Kodlar",
      children: [
     
        Column(
          children: codeList,
        ),
      ],
    );
  }
}
