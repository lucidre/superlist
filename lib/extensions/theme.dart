import 'package:superlist/common_libs.dart';

extension DeviceTheme on BuildContext {
  ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: primaryColor),
        canvasColor: backgroundColor,
        dialogBackgroundColor: backgroundColor,
        floatingActionButtonTheme: ThemeData.light()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: primaryColor),
        cardColor: backgroundColor,
        iconTheme:
            ThemeData.light().iconTheme.copyWith(color: textColor, size: 24),
      );
}

Color get primaryColor => const Color(0xFFF74E3A);
Color get textColor => const Color(0xFF26253B);
Color get backgroundColor => const Color(0xFFF4F3FA);
Color get inactiveColor1 => const Color(0xFFE0DFED);
Color get inactiveColor2 => const Color(0xFF72718A);
Color get inactiveColor3 => const Color(0xFFEAE9F4);
Color get inactiveColor4 => const Color(0xFFF4F4F8);
Color get inactiveColor5 => const Color(0xFFF3F3F7);
Color get activeColor2 => const Color(0xFFF8F8F8);
Color get activeColor1 => const Color(0xFFE7E6EF);
Color get white2 => const Color(0xFFDEDEEB);
Color get white3 => const Color(0xFFFAFAFA);
Color get grey1 => const Color(0xFF30303A);
Color get grey2 => const Color(0xFF2C2C3D);
Color get grey3 => const Color(0xFF97979E);
Color get blue1 => const Color(0xFF2590F2);
Color get blue2 => const Color(0xFFF3F2FA);
Color get blue => const Color(0xFFF3F2FA);
Color get blue3 => const Color(0xFFE9F4FE);
Color get blue4 => const Color(0xFF2590F2);
Color get blue5 => const Color(0xFF181824);
Color get blue6 => const Color(0xFF20202E);
Color get blue7 => const Color(0xFF272737);
Color get green1 => const Color(0xFF2A956F);
Color get green2 => const Color(0xFFE9F4F0);
Color get purple1 => const Color(0xFF6B66DA);
Color get purple2 => const Color(0xFF8E89FA);
Color get red1 => const Color(0xFFFEECEB);
Color get red2 => const Color(0xFFF74E3A);
Color get red3 => const Color(0xFFF3E1E7);
Color get red4 => const Color(0xFFF74E3A);
