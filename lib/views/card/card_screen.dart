import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/bloc/card_screen_bloc.dart';
import 'package:wundu/views/card/models/card_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_app_bar.dart';
import 'package:wundu/widgets/custom_bottom_nav_bar.dart';
import 'package:wundu/core/session/session_service.dart'; // Import SessionService

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<CardScreenBloc>(
      create: (context) => CardScreenBloc(CardScreenState(
        cardScreenModelObj: CardScreenModel(),
      ))
        ..add(CardScreenInitialEvent()),
      child: CardScreen(),
    );
  }

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int _currentIndex = 1; // Inicializa com 1 pois estamos na tela de cartões

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Aqui você pode adicionar a navegação para outras telas
    switch (index) {
      case 0:
        // Navigate to Home
        NavigatorService.pushNamed(AppRoutes.homeScreen);
        break;
      case 1:
        // Já estamos na tela de cartões, não precisa navegar
        break;
      case 2:
        // Navigate to Center button action
        break;
      case 3:
        // Navigate to Library
        // NavigatorService.pushNamed(AppRoutes.libraryScreen);
        break;
      case 4:
        // Navigate to Profile
        // NavigatorService.pushNamed(AppRoutes.profileScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: SessionService().getUserData(),
      builder: (context, snapshot) {
        final userData = snapshot.data;
        return BlocBuilder<CardScreenBloc, CardScreenState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: appTheme.blueGray50,
                appBar: CustomAppBar(
                  userName: userData?['name'] ?? 'Usuário',
                  welcomeMessage: "Bem-vindo ao wundu",
                ),
                body: SafeArea(
                  top: false,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 4.h,
                      top: 18.h,
                      right: 4.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.only(
                              left: 8.h,
                              top: 100.h,
                              right: 8.h,
                            ),
                            decoration: AppDecoration.fillWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder20,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                  child: GestureDetector(
                                    onTap: () {
                                      onTapColumn(context);
                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(16),
                                      color: Color.fromRGBO(
                                          255, 138, 122, 1), // Cor amarela
                                      strokeWidth: 2,
                                      dashPattern: [
                                        8,
                                        4
                                      ], // Ajuste conforme necessário
                                      child: Container(
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 68.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder16,
                                          color: Colors.white, // Fundo branco
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        255, 212, 0, 1),
                                                    Color.fromRGBO(
                                                        255, 114, 94, 1),
                                                    Color.fromRGBO(
                                                        229, 148, 0, 1),
                                                  ],
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Text(
                                    "Pressione o botão acima para adicionar um novo cartão a ser gerenciado",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.bodyLargeBluegray900
                                        .copyWith(
                                      height: 1.56,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Text(
                                  "ou",
                                  style: CustomTextStyles.titleMediumSemiBold,
                                ),
                                SizedBox(height: 24.h),
                                CustomElevatedButton(
                                  text: "Adicionar de forma manual",
                                  onPressed: () {
                                    onTapAdicionarde(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h)
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: CustomBottomNavBar(
                  currentIndex: _currentIndex,
                  onTap: _onNavItemTapped,
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Navegação para a tela de notificações
  void onTapBtnIconbuttonone(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.telaNotificaEsScreen,
    // );
  }

  /// Navegação para a tela de foto do cartão
  void onTapColumn(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.CardFotoTwoScreen,
    // );
  }

  /// Navegação para a tela de adicionar cartão
  void onTapAdicionarde(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.CardOneScreen,
    // );
  }
}
