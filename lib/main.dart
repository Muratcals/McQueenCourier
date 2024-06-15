import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/AtomicWidgets/appbar_widget.dart';
import 'package:mc_queen_courier/AtomicWidgets/text_widget.dart';
import 'package:mc_queen_courier/Pages/Splash/splash_screen_page.dart';
import 'package:mc_queen_courier/Pages/Cargo%20Information/cargo_information_page.dart';
import 'package:mc_queen_courier/Pages/Login/login_page.dart';
import 'package:mc_queen_courier/Pages/Main/main_page.dart';
import 'package:mc_queen_courier/main_mixin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with MainAppMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 420),
      child: Obx(() => visibility.value
          ? const DefaultWidget()
          : const NotConnectionWidget()),
    );
  }
}

class NotConnectionWidget extends StatelessWidget {
  const NotConnectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 30.h),
          child: AtomicAppBar(
            title: "Bağlantı bulunamadı",
            backIcon: false,
          ),
        ),
        body: Center(
            child: TextView(
                title: "İnternet bağlantınızı kontrol ediniz",
                fontsize: 14.sp)),
      ),
    );
  }
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('tr'), Locale('en')],
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      getPages: [
        GetPage(
            name: "/",
            page: () => const SplashScreen(),
            transition: Transition.leftToRight),
        GetPage(
            name: "/login",
            page: () => const LoginPage(),
            transition: Transition.leftToRight),
        GetPage(
            name: "/main",
            page: () => const MainPage(),
            transition: Transition.leftToRight),
        GetPage(
            name: "/cargoInformation",
            page: () => const CargoInformationPage(),
            transition: Transition.leftToRight),
        GetPage(
            name: "/login",
            page: () => const LoginPage(),
            transition: Transition.leftToRight)
      ],
    );
  }
}
