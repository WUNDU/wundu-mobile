import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wundu/core/app_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
          create: (context) => ThemeBloc(
                ThemeState(
                  themeType: PrefUtils().getThemeData(),
                ),
              ),
          child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            return MaterialApp(
              theme: theme,
              title: 'wundu',
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(1.0),
                    ),
                    child: child!);
              },
              navigatorKey: NavigatorService.navigatorKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: Locale('pt', ''),
              supportedLocales: [Locale('pt', '')],
              initialRoute: AppRoutes.splashScreen,
              routes: AppRoutes.routes,
            );
          }));
    });
  }
}
