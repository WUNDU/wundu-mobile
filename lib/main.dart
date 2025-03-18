import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wundu/core/app_export.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
                  return ResponsiveBreakpoints.builder(
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: TextScaler.linear(1.0),
                      ),
                      child: child!,
                    ),
                    breakpoints: [
                      const Breakpoint(start: 0, end: 450, name: MOBILE),
                      const Breakpoint(start: 451, end: 800, name: TABLET),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCard(context),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 29.4,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 96.0, top: 13.7, right: 93.7),
                    child: SizedBox(
                      width: double.infinity,
                      height: 38.9,
                      child: Center(
                        child: Text(
                          "Bem-vindo",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Valor total",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16.8,
                          letterSpacing: 0.3,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 2.3),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 27.4,
                              height: 27.4,
                            ),
                          ),
                          Text(
                            "R\$ 0,00",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 68.6),
                    _buildCard(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0F1B36),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      width: 68.6,
      height: 45.7,
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(9.1),
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        child: Center(
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
