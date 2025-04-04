import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';
import 'package:wundu/views/card/card_screen.dart';
import 'package:wundu/views/home/home_screen.dart';
import 'package:wundu/views/library/library_screen.dart';
import 'package:wundu/views/wundu/wundu_screen.dart';
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
  final PageController _pageController = PageController();

  // Lista de conteúdos de páginas que serão exibidos
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(), // Conteúdo da tela Home
      CardScreen(), // Conteúdo da tela Card
      WunduScreen.builder(context), // Placeholder para o botão central
      LibraryScreen.builder(context), // Biblioteca
      Container(), // Placeholder para o perfil
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    // Se clicar no mesmo item, não fazemos nada
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
      // Animar a transição de página sem reconstruir o Scaffold
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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
          appBar: _currentIndex == 3
              ? null
              : CustomAppBar(
                  userName: userData?['name'] ?? 'Usuário',
                  welcomeMessage: "Bem-vindo ao wundu",
                ),
          body: PageView(
            controller: _pageController,
            physics:
                NeverScrollableScrollPhysics(), // Desativar o gesto de deslizar
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
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
