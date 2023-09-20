import 'dart:ui';
import 'package:delivery/bindings/initial_bindings.dart';
import 'package:delivery/core/constant/colors.dart';
import 'package:delivery/core/services/my_services.dart';
import 'package:delivery/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior:const  MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.darkYellow,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.darkYellow) ,
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Nunito",
            ),
            // headline2: TextStyle(
            //   //fontWeight: FontWeight.bold,
            //   fontSize: 13,
            //   fontFamily: "Nunito",
            // ),
            bodyLarge: TextStyle(
                height: 1,
                fontSize: 20,
                color: AppColors.babyBlueLight,
                //fontWeight: FontWeight.bold,
                fontFamily: "WorkSans")),
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitialBindings(),
      // home: const onBoarding(),
      //  home: const test(),
      getPages: routes,
    );
  }
}
