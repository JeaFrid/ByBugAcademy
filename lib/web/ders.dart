import 'package:opensource/page/page.dart';
import 'package:opensource/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DersProgramiWeb extends StatelessWidget {
  const DersProgramiWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return NewPage(
      icon: Icons.list_alt_rounded,
      title: "Ders Programı ve Müfredat",
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  width: constraints.maxWidth / 2 - 100,
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Ders Programı",
                            style: GoogleFonts.poppins(
                              color: defaultColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pazartesi",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "20:00",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Salı",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "20:00",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Çarşamba",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "20:00",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Perşembe",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "20:00",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cuma",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "20:00",
                            style: GoogleFonts.poppins(
                              color: textColor.withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Icon(
                        Icons.arrow_drop_down,
                        color: textColor,
                        size: 40,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Değişiklikler ve Güncelleme",
                            style: GoogleFonts.poppins(
                              color: defaultColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Bu program, 10 dakika geç veya 10 dakika erken gerçekleşebilen dersleri içerir. Ders programında bulunan ders/dersler, müfredata bağlıdır.",
                              style: GoogleFonts.poppins(
                                color: textColor.withOpacity(0.5),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    item(
                      constraints,
                      "Seviye 1 - Temelleri Anlamak",
                      """
• Widget Yapısını Anlamak
• Temel Widgetları Anlamak
• Veri Tipleri
• Değişkenler
• Değişkenlerle İşlemler
• Temel Widgetlar ile Değişkenleri Kullanmak""",
                    ),
                    item(
                      constraints,
                      "Seviye 2 - Widget Ağacını Anlamak",
                      """
• Düzen Oluşturmak
• Temel Materyalleri Öğrenmek
• State Yapısını Öğrenmek
• Değişkenlerle Widgetları kullanmak""",
                    ),
                    item(
                      constraints,
                      "Seviye 3 - Temel Dart",
                      """
• Class yapısını anlamak
• Sabitleri ve dinamikleri anlamak
• Fonksiyon ve metot kavramlarını anlamak
• Fonksiyonlarda hata yönetimini anlamak
• Fonksiyonlarda hata yönetimini anlamak""",
                    ),
                    item(
                      constraints,
                      "Seviye 4 - Paket Yönetimi",
                      """
• Paketleri Anlamak ve Pub Dev
• Çoklu paketleri yönetme ve çakışma problemleri
• Paketleri ayrıştırma
• Paketleri  güncelleme
• Paketlerde keşif""",
                    ),
                    item(
                      constraints,
                      "Seviye 5 - Flutter ile Dart kullanımı",
                      """
• Flutter tasarımına dart kodlamak
• Flutter koduna dart işlevleri tanımlamak
• Flutter içinde state yapısının optimizasyonunu sağlamak.
• Responsive tasarım geliştirmek ve dart ile dönüşüm sağlamak""",
                    ),
                    item(
                      constraints,
                      "Seviye 6 - Veritabanına Giriş",
                      """
• Firebaase CLI'yın kurulumu
• Firebase Web'i Keşfetmek
• Cosmos Paketini Kullanmak
• Giriş ve Kayıt Algoritmaları
• Veritabanı İşlemleri""",
                    ),
                    item(
                      constraints,
                      "Seviye 7 - OneSignal ile Bildirim",
                      """
• OneSignal Sitesini Keşfetmek
• OneSignal Kurulumu
• Kullanıcılara Toplu Bildirim Göndermek
• Kullanıcılara Tek Tek Bildirim Göndermek
• Kullanıcılara Kanal Bildirimi Göndermek""",
                    ),
                    item(
                      constraints,
                      "Seviye 8 - Play Store Kullanımı",
                      """
• Play Store Sitesini Keşfetmek
• Play Store'a Uygulama Hazırlamak
• Play Store'a Uygulama Yayınlamak
• Yeni Sürüm Oluşturmak
• Politika ve Kuralları Belirlemek
• KVKK metni hazırlamak""",
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Container item(
    BoxConstraints constraints,
    String title,
    String text,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      width: constraints.maxWidth / 2 - 100,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Müfredat",
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
