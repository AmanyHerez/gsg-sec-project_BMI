import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project2_flutter_gsg/database/db_provider.dart';
import 'package:project2_flutter_gsg/screen/add_record.dart';
import 'package:project2_flutter_gsg/screen/history_screen.dart';
import 'package:project2_flutter_gsg/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'provider/bmi_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DbProvider().initDataBase();
  runApp( EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar'),],
      path: 'asset/langs',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<BmiProvider>(create: (context)=>BmiProvider())],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          '/splach_screen':(context)=>SplashScreen(),
          '/add_record_screen':(context)=>AddRecordScreen(),
          '/history_screen':(context)=>HistoryScreen(),
        },
      ),
    );
  }
}

