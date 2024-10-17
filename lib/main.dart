import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goals/layout/cubit/main_cubit.dart';
import 'package:goals/layout/main_layout/main_layout.dart';
import 'package:goals/localization/set_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(
            create: (context) => MainCubit()
              ..initSqfLite()
              ..getData(),
            child: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                return MaterialApp(
                  locale: Locale(MainCubit.get(context).lang.toString()),
                  supportedLocales: const [
                    Locale('en', 'US'),
                    Locale('ar', 'EG')
                  ],
                  localizationsDelegates: const [
                    SetLocalization.localizationsDelegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  title: 'Goals',
                  theme: ThemeData(
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                    useMaterial3: true,
                  ),
                  home: const MainLayout(),
                );
              },
            ),
          );
        });
  }
}
