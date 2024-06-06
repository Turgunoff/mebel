import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // USD kursini saqlash uchun o'zgaruvchi (boshlang'ich qiymati 0.0)
  static double usdKursi = 0.0;

  // Valyuta kurslarini API dan olib keluvchi asinxron funksiya
  static Future<double> usdKursiniOlish() async {
    try {
      // API so'rovini yuboramiz (Markaziy Bankning valyuta kurslari API si)
      final response = await http
          .get(Uri.parse('https://cbu.uz/oz/arkhiv-kursov-valyut/json/'));

      // Agar so'rov muvaffaqiyatli bo'lsa (status kodi 200)
      if (response.statusCode == 200) {
        // JSON ma'lumotlarni tahlil qilamiz (parse)
        final List<dynamic> data = jsonDecode(response.body);

        // USD kursini topish uchun massivni aylanib chiqamiz
        for (var valyuta in data) {
          if (valyuta['Ccy'] == 'USD') {
            // USD kursini qaytaramiz
            return double.parse(valyuta['Rate']);
          }
        }
      } else {
        // Agar so'rov muvaffaqiyatsiz bo'lsa, xatolik (exception) tashlaymiz
        throw Exception(
            'USD kursini olishda xatolik yuz berdi. Status kodi: ${response.statusCode}');
      }
    } catch (xatolik) {
      // Xatolikni konsolga chiqaramiz (log qilamiz)
      print('USD kursini olishda xatolik: $xatolik');
      // Xatolikni qayta tashlaymiz (ilovani ishdan chiqmasligi uchun)
      rethrow;
    }

    // Agar USD kursi topilmasa, xatolik tashlaymiz
    throw Exception('Javobda USD kursi topilmadi');
  }

  // USD kursini olib, uni saqlovchi asinxron funksiya
  static Future<void> usdKursiniYangilash() async {
    try {
      // `usdKursiniOlish` funksiyasidan foydalanib, USD kursini olamiz
      usdKursi = await usdKursiniOlish();
      // Olingan kursni `usdKursi` o'zgaruvchisiga saqlaymiz

      print("Valyuta kursi muvaffaqiyatli yangilandi: $usdKursi");
    } catch (xatolik) {
      // Xatolikni konsolga chiqaramiz
      print("Valyuta kursini yangilashda xatolik yuz berdi: $xatolik");
    }
  }
}
