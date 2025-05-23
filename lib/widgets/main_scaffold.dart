import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';
import 'package:wundu/views/card/card_screen.dart';
import 'package:wundu/views/home/home_screen.dart';
import 'package:wundu/views/library/library_screen.dart';
import 'package:wundu/views/profile/profile.dart';
import 'package:wundu/widgets/custom_app_bar.dart';
import 'package:wundu/widgets/custom_bottom_nav_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  static Widget builder(BuildContext context) {
    return MainScaffold();
  }

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  // Lista de conteúdos de páginas que serão exibidos
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _checkSession();
    _pages = [
      HomeScreen(),
      CardScreen(),
      Container(),
      LibraryScreen.builder(context),
      ProfileScreen.builder(context),
    ];
  }

  Future<void> _checkSession() async {
    final isValid = await SessionService().isSessionValid();
    if (!isValid) {
      NavigatorService.pushNamedAndRemovedUntil(AppRoutes.authScreen,
          routePredicate: false);
    }
  }

  void _onNavItemTapped(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: SessionService().getUserData(),
      builder: (context, snapshot) {
        final userData = snapshot.data;
        return Scaffold(
          backgroundColor: appTheme.blueGray50,
          appBar: (_currentIndex == 3 || _currentIndex == 4)
              ? null
              : CustomAppBar(
                  userName: userData?['name'] ?? 'Usuário',
                  welcomeMessage: "Bem-vindo ao wundu",
                ),
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onNavItemTapped,
          ),
        );
      },
    );
  }
}
