import 'package:opensource/page/add_code.dart';
import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:opensource/widget/code.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SourceCodeWeb extends StatefulWidget {
  const SourceCodeWeb({super.key});

  @override
  State<SourceCodeWeb> createState() => _SourceCodeWebState();
}

class _SourceCodeWebState extends State<SourceCodeWeb> {
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
        Row(
          children: [
            InkWell(
              onTap: () {
                CosmosNavigator.pushNonAnimated(context, const AddSCode());
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                decoration: BoxDecoration(
                  color: bg.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Icon(
                      Icons.library_add,
                      color: defaultColor,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Yeni Kaynak Kod",
                      style: GoogleFonts.poppins(
                        color: defaultColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: codeList,
        ),
      ],
    );
  }
}
