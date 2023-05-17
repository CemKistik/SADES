import 'dart:ui';

import 'package:get/get.dart';


class Dil extends Translations {
   static final varsayilan =Locale("tr","TR");
   static final diller=[
    Locale("tr","TR"),
    Locale("en", "US"),
   ];
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'yardim': 'HELP',
          'tarif': 'DIRECTION',
          'favoriler': 'Favorites',
          'hastane': 'Hospital',
          'eczane': 'Pharmacy',
          'diger': 'Others',
          'kabul': 'Accept',
          'sil': 'Delete',
          'dil': 'LANGUAGE',
          'tema': 'THEME',
          'bilgi': 'UPDATE INFORMATIONS',
          'adsoyad': 'NAME SURNAME AND BIRTH DATE',
          'kiloboy': 'WEIGHT AND HEIGHT',
          'kronikilac': 'CHRONIC DISEASES AND MEDICINES',
          'ilkyardimbil': 'FIRST AID INFORMATION',
          'ad': 'Name',
          'soyad': 'Surname',
          'dogum': 'Birth Date',
           'boy': 'Height (cm)',
          'kilo': 'Weight (kg)',
          'kronik': 'Chronic Diseases',
          'ilac': 'Medicines',
          'sag': 'Health Employee',
          'iysv': 'First Aid Certificate',
          'kullanici': 'Only User',
          'turkce': 'TURKISH',
          'ing': 'ENGLISH',
          'acik':'LIGHT',
          'koyu':'DARK',
          'ara':'SEARCH',
          'rota':'ROUTE',
          'enh':'CLOSEST HOSPITAL',
          'enasm':"CLOSEST ASM",
          'ile':'CONTACT'
        },
        'tr_TR': {
          'yardim': 'YARDIM İSTE',
          'tarif': 'YOL TARİFİ',
          'favoriler': 'Favoriler',
          'hastane': 'Hastane',
          'eczane': 'Eczane',
          'diger': 'Diğer',
          'kabul': 'Kabul Et',
          'sil': 'Sil',
          'dil': 'DİL',
          'tema': 'TEMA',
          'bilgi': 'BİLGİLERİMİ GÜNCELLE',
          'adsoyad': 'AD SOYAD VE DOĞUM TARİHİ',
          'kiloboy': 'KİLO VE BOY',
          'kronikilac': 'KRONİK HASTALIKLAR VE İLAÇLAR',
          'ilkyardimbil': 'İLK YARDIM BİLGİSİ',
          'ad': 'Ad',
          'soyad': 'Soyad',
          'dogum': 'Doğum Tarihi',
           'boy': 'Boy',
          'kilo': 'Kilo (kg)',
          'kronik': 'Kronik Hastalıklar',
          'ilac': 'Kullanılan İlaçlar',
          'sag': 'Sağlık Çalışanıyım',
          'iysv': 'İlk Yardım Sertifikam Var',
          'kullanici': 'Yalnızca Kullanıcı Olarak Devam Et',
          'turkce': 'TÜRKÇE',
          'ing': 'İNGİLİZCE',
          'acik':'AÇIK',
          'koyu':'KOYU',
          'ara':'ARA',
          'rota':'ROTA OLUŞTUR',
          'enh':'EN YAKIN HASTANE',
          'enasm':"EN YAKIN ASM",
          'ile':'İLETİŞİM'
        }
      };

      
}