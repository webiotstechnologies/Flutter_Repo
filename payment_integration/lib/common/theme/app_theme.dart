import '../../config.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;

  Color txt;
  Color primary;
  Color primaryLight;
  Color secondary;
  Color accentTxt;
  Color bg1;
  Color bgColor;
  Color surface;
  Color error;
  Color dividerColor;

  Color title;
  Color content;
  Color darkBg;
  Color lightBg;
  Color themeColor;
  Color bottomIconColor;
  Color unSelectStar;
  Color boardingColor;
  Color sameWhite;
  Color darkBg2;
  Color green;
  //Extra Colors

  Color whiteColor;
  Color blackColor;
  Color borderGray;
  Color indigo;
  Color lightIndigo;
  Color textFieldColor;
  Color lightBlack;
  Color indigoShade;
  Color pink;
  Color blue;
  Color yellow;
  Color greyShade;
  Color blue200;
  Color indigo200;


  /// Default constructor
  AppTheme({
    required this.isDark,

    required this.txt,
    required this.primary,
    required this.primaryLight,
    required this.secondary,
    required this.accentTxt,
    required this.bg1,
    required this.bgColor,
    required this.surface,
    required this.error,
    required this.dividerColor,

    required this.title,
    required this.content,
    required this.darkBg,
    required this.lightBg,
    required this.themeColor,
    required this.bottomIconColor,
    required this.unSelectStar,
    required this.boardingColor,
    required this.sameWhite,
    required this.darkBg2,
    required this.green,
    //Extra

    required this.whiteColor,
    required this.blackColor,
    required this.borderGray,
    required this.indigo,
    required this.lightIndigo,
    required this.textFieldColor,
    required this.lightBlack,
    required this.indigoShade,
    required this.pink,
    required this.blue,
    required this.yellow,
    required this.greyShade,
    required this.blue200,
    required this.indigo200,

  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          txt: const Color(0xFF001928),
          primary: Colors.transparent,
          primaryLight: const Color(0xFFFFF4F4),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          bg1: Colors.white,
          bgColor: Colors.white,
          surface: Colors.white,
          error: const Color(0xFFd32f2f),
          dividerColor: const Color(0xFFF9F9F9),

          title : const Color(0xff545454),
          content: const Color(0xffAFAFAF),
          darkBg:  const Color(0xFF373737),
          lightBg: const Color(0xffF6F6F6),
          themeColor: const Color(0xffFFBA46),
          bottomIconColor: const Color(0xff9F9F9F),
          unSelectStar: const Color(0xffEDEFF4),
          boardingColor: const Color(0x1AFFFFFF),
          sameWhite: const Color(0xFFFFFFFF),
          darkBg2: const Color(0xFF373737),
          green: Colors.green,
          //Extra

          whiteColor: Colors.white,
          blackColor: Colors.black,
          borderGray: Colors.grey,
          indigo: Colors.indigo,
          lightIndigo: Colors.indigo.shade400,
          textFieldColor: Colors.grey.shade100,
          lightBlack: Colors.black54,
          indigoShade: Colors.indigo.shade200,
          yellow:Colors.yellow,
          pink: Colors.pink.shade300,
          blue: Colors.blue,
          greyShade: Colors.grey.shade200,
          blue200: Colors.blue.shade200,
          indigo200: Colors.indigo.shade200,
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          txt: Colors.white,
          primary: Colors.black,
          primaryLight: const Color(0xFF202020),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          bg1: const Color(0xFF151A1E),
          bgColor: const Color(0xFF262626),
          surface: const Color(0xFF151A1E),
          error: const Color(0xFFd32f2f),
          dividerColor: const Color(0xFFF9F9F9),

          title: const Color(0xff545454),
          content: Colors.white,
          darkBg: Colors.black,
          lightBg: Colors.white,
          themeColor: const Color(0xffFFBA46),
            bottomIconColor: const Color(0xff9F9F9F),
            unSelectStar: const Color(0xffEDEFF4),
            boardingColor: const Color(0x1AFFFFFF),
            sameWhite: const Color(0xFFFFFFFF),
          darkBg2: Colors.white,
          green: Colors.green,
          //Extra

          whiteColor: Colors.black,
          blackColor: Colors.white,
          borderGray: Colors.grey,
          indigo: Colors.indigo,
          lightIndigo: Colors.indigo.shade400,
          textFieldColor: Colors.grey.shade100,
          lightBlack: Colors.black54,
            indigoShade: Colors.indigo.shade200,
            yellow:Colors.yellow,
            pink: Colors.pinkAccent,
            blue: Colors.blue,
          greyShade: Colors.grey.shade200,
            blue200: Colors.blue.shade200,
          indigo200: Colors.indigo.shade200,
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: secondary,
        background: bg1,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: borderGray,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
      toggleableActiveColor: primary,
    );
  }

//Color shift(Color c, double d) => shiftHsl(c, d * (isDark ? -1 : 1));
}
