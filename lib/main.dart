import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wundu/core/app_export.dart';
import 'package:responsive_framework/responsive_framework.dart'; // Importe o responsive_framework

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => ThemeBloc(
            ThemeState(
              themeType: PrefUtils().getThemeData(),
            ),
          ),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                theme: theme,
                title: 'wundu',
                builder: (context, child) {
                  // Adicione o ResponsiveBreakpoints.builder aqui
                  return ResponsiveBreakpoints.builder(
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: TextScaler.linear(1.0),
                      ),
                      child: child!,
                    ),
                    breakpoints: [
                      const Breakpoint(
                          start: 0,
                          end: 450,
                          name: MOBILE), // Dispositivos móveis
                      const Breakpoint(
                          start: 451, end: 800, name: TABLET), // Tablets
                      const Breakpoint(
                          start: 801, end: 1920, name: DESKTOP), // Desktops
                    ],
                  );
                },
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: const Locale('pt', ''),
                supportedLocales: const [Locale('pt', '')],
                initialRoute: AppRoutes.splashScreen,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
