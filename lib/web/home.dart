import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:opensource/widget/post.dart';
import 'package:cosmos/cosmos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
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
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.school,
                  color: defaultColor,
                  size: 30,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(width: 5),
              ),
              WidgetSpan(
                child: Text(
                  "ByBug Academy",
                  style: GoogleFonts.poppins(
                    color: defaultColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              WidgetSpan(
                child: Text(
                  "'ye Hoş Geldiniz!",
                  style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width(context) * 0.40,
          child: Text(
            "ByBug Akademi, yazılım geliştirme, grafik tasarım, yapay zeka, video düzenleme ve yazarlık gibi alanlarda tamamen ücretsiz eğitimler sunan bir platformdur. YouTube ve Discord aracılığıyla sunulan eğitimlerimizle bilgi ve becerilerinizi geliştirebilirsiniz.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await openUrl("https://www.youtube.com/@KirmiziPatika");
              },
              child: Icon(
                FontAwesomeIcons.youtube,
                color: textColor.withOpacity(0.2),
                size: 25,
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () async {
                await openUrl("https://github.com/JeaFrid");
              },
              child: Icon(
                FontAwesomeIcons.github,
                color: textColor.withOpacity(0.2),
                size: 25,
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () async {
                await openUrl("https://t.me/kirmizipatika");
              },
              child: Icon(
                FontAwesomeIcons.telegram,
                color: textColor.withOpacity(0.2),
                size: 25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Visibility(
          visible: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Toplam Öğrenci Sayısı",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Güncel kayıtlı öğrencilerin toplam sayısını içerir. Toplam öğrenci sayısı.",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Toplam Ders Sayısı",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Bugüne kadar akademide gerçekleştirilen ders sayısını içerir.",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Toplam Döküman Sayısı",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Geliştirilmiş uygulamaların kaynak kodlarını içeren döküman sayısı.",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Toplam Sertifika Sayısı",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Güncel kayıtlı öğrencilerin toplam sertifika sayısını içerir.",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: bg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.5),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Geliştirilen Uygulamalar",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Geliştirilen toplam uygulama sayısı. Tüm uygulamalar.",
                                  style: GoogleFonts.poppins(
                                    color: textColor.withOpacity(0.5),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Tüm Gönderiler",
            style: GoogleFonts.poppins(
              color: textColor.withOpacity(0.9),
              fontSize: 20,
            ),
          ),
        ),
        Column(
          children: posts,
        ),
      ],
    );
  }
}
