import '../config.dart';

class AppArray {
  // Currency List
  var currencyList = [
    {
      'title': appFonts.rupee,
      'image': eImageAssets.rupee,
      'code': 'INR',
      'symbol': '₹',
      'USD': 0.013,
      'YEN': 1.75,
      'INR': 1,
      'WON': 16.60,
      'POU': 0.010,
      'DIN': 0.0038,
      'EUR': 0.012,
    },
    {
      'title': appFonts.dollar,
      'image': eImageAssets.dollar,
      'code': 'USD',
      'symbol': '\$',
      'USD': 1,
      'YEN': 145.12,
      'INR': 79.57,
      'WON': 1357.96,
      'POU': 0.85,
      'DIN': 0.31,
      'EUR': 0.97,
    },
    {
      'title': appFonts.yen,
      'image': eImageAssets.yen,
      'code': 'YEN',
      'symbol': '¥',
      'USD': 0.0069,
      'YEN': 1,
      'INR': 0.57,
      'WON': 9.64,
      'POU': 0.0060,
      'DIN': 0.0022,
      'EUR': 0.0069,
    },
    {
      'title': appFonts.won,
      'image': eImageAssets.won,
      'code': 'WON',
      'symbol': '₩',
      'USD': 0.00074,
      'YEN': 0.10,
      'INR': 0.060,
      'WON': 1,
      'POU': 0.00062,
      'DIN': 0.00023,
      'EUR': 0.00072,
    },
    {
      'title': appFonts.pound,
      'image': eImageAssets.pound,
      'code': 'POU',
      'symbol': '£',
      'USD': 1.18,
      'YEN': 166.45,
      'INR': 96.70,
      'WON': 1605.44,
      'POU': 1,
      'DIN': 0.36,
      'EUR': 1.15,
    },
    {
      'title': appFonts.dinar,
      'image': eImageAssets.dinar,
      'code': 'DIN',
      'symbol': 'د.ك',
      'USD': 3.25,
      'YEN': 457.10,
      'INR': 265.45,
      'WON': 4406.48,
      'POU': 2.75,
      'DIN': 1,
      'EUR': 3.16,
    },
    {
      'title': appFonts.euro,
      'image': eImageAssets.euro,
      'code': 'EUR',
      'symbol': '€',
      'USD': 1.03,
      'YEN': 144.53,
      'INR': 84.00,
      'WON': 1394.08,
      'POU': 0.87,
      'DIN': 0.32,
      'EUR': 1,
    },
  ];

  // Product List
  var listImages = [
    {
      "image": eImageAssets.blackJeansBoy,
      "title": appFonts.blackDenimJeans,
      "price": 160,
      "size": "M",
      "description": appFonts.pDescription,
    },
    {
      "image": eImageAssets.blackJeansBoy2,
      "title": appFonts.blackCottonJeans,
      "price": 58,
      "size": "M",
      "description": appFonts.pDescription
    },
    {
      "image": eImageAssets.pinkTShirtBoy,
      "title": appFonts.pinkTShirt,
      "price": 30,
      "size": "M",
      "description": appFonts.pDescription2,
    },
    {
      "image": eImageAssets.whiteShirtBoy,
      "title": appFonts.whiteSilkShirtMen,
      "price": 20,
      "size": "XL",
      "description": appFonts.pDescription3
    },
    {
      "image": eImageAssets.whiteShirtBoy2,
      "title": appFonts.whiteFormalShirtMen,
      "price": 65,
      "size": "M",
      "description": appFonts.pDescription3
    },
    {
      "image": eImageAssets.whiteShirtGirl,
      "title": appFonts.whiteCottonShirtGirl,
      "price": 29,
      "size": "M",
      "description": appFonts.pDescription3
    },
    {
      "image": eImageAssets.yellowKurtiGirl,
      "title": appFonts.yellowKolhapuriKurti,
      "price": 51,
      "size": "L",
      "description": appFonts.pDescription4
    },
    {
      "image": eImageAssets.yellowKurtiGirl2,
      "title": appFonts.yellowFormalKurti,
      "price": 176,
      "size": "S",
      "description": appFonts.pDescription4
    },
    {
      "image": eImageAssets.yellowKurtaBoy,
      "title": appFonts.yellowFormalKurta,
      "price": 76,
      "size": "M",
      "description": appFonts.pDescription5
    },
    {
      "image": eImageAssets.yellowKurtaBoy2,
      "title": appFonts.yellowKolhapuriKurta,
      "price": 88,
      "size": "S",
      "description": appFonts.pDescription5
    },
  ];

  // Languages List
  var languageList = [
    {
      "language": appFonts.english,
      "image": eImageAssets.usa,
      'locale': const Locale('en', 'US'),
      "code": "en"
    },
    {
      "language": appFonts.hindi,
      "image": eImageAssets.india,
      'locale': const Locale('hi', 'IN'),
      "code": "hi"
    },
    {
      "language": appFonts.gujarati,
      "image": eImageAssets.india,
      'locale': const Locale('gu', 'IN'),
      "code": "gu"
    },
    {
      "language": appFonts.spanish,
      "image": eImageAssets.spain,
      'locale': const Locale('es', 'DU'),
      "code": "es"
    },
    {
      "language": appFonts.german,
      "image": eImageAssets.germany,
      'locale': const Locale('de', 'DE'),
      "code": "de"
    },
    {
      "language": appFonts.french,
      "image": eImageAssets.french,
      'locale': const Locale('fr', 'CA'),
      "code": "fr"
    },
    {
      "language": appFonts.japanese,
      "image": eImageAssets.japan,
      'locale': const Locale('ja', 'JP'),
      "code": "ja"
    },
    {
      "language": appFonts.koran,
      "image": eImageAssets.korea,
      'locale': const Locale('ko', 'KE'),
      "code": "ko"
    },
    {
      "language": appFonts.arabic,
      "image": eImageAssets.uae,
      'locale': const Locale('ar', 'AE'),
      "code": "ar"
    },
    {
      "language": appFonts.russian,
      "image": eImageAssets.russia,
      'locale': const Locale('ru', 'RU'),
      "code": "ru"
    },
  ];
}
