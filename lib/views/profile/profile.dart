import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/session_service.dart';
import 'package:wundu/routes/protected_route.dart';
import 'package:wundu/views/profile/bloc/profile_bloc.dart';
import 'package:wundu/views/profile/model/profile.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(ProfileState(
        profileModelObj: ProfileModel(),
      ))
        ..add(ProfileInitialEvent()),
      child: ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ProtectedRoute(
          child: Scaffold(
            backgroundColor: appTheme.blueGray50,
            body: SafeArea(
              child: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.only(left: 14.h, top: 14.h, right: 14.h),
                    child: Column(
                      spacing: 20,
                      children: [
                        _buildColumncontrast(context),
                        _buildStackpainelde(context),
                        _buildColumniconamoon(context),
                        SizedBox(height: 26.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SizedBox(
              width: double.maxFinite,
              child: buildBottombar(context),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildColumncontrast(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: SessionService().getUserData(),
      builder: (context, snapshot) {
        final userData = snapshot.data;
        final userName = userData?['name'] ?? "Usuário";
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: AppDecoration.fillwhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder4,
          ),
          child: Column(
            spacing: 14,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              SizedBox(
                height: 100.h,
                width: 96.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.user,
                      height: 100.h,
                      width: double.maxFinite,
                      radius: BorderRadius.circular(46.h),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.pen,
                      height: 24.h,
                      width: 26.h,
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 2.h, bottom: 2.h),
                    ),
                  ],
                ),
              ),
              Text(
                userName,
                style: CustomTextStyles.titleMediumPoppinsBlack90001,
              ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildStackpainelde(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.panelBackground,
            height: 60.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(8.h),
            onTap: () {
              onTapImgImageone(context);
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.h),
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Text(
                        "msg_painel_de_controle".tr,
                        style: CustomTextStyles.titleMediumPoppins2WhiteA700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        onTapControlPanel(context);
                      },
                      icon: Icon(
                        Icons.chevron_right,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumniconamoon(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: AppDecoration.fillwhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            child: buildRowmaterialsymb(
              context,
              materialsymbol: ImageConstant.userProfile,
              suporteeOne: "lbl_meus_dados".tr,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray90001.withValues(alpha: 0.1)),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            child: buildRowmaterialsymb(
              context,
              materialsymbol: ImageConstant.help,
              suporteeOne: "msg_suporte_e_feedback".tr,
            ),
          ),
          SizedBox(height: 22.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray90001.withValues(alpha: 0.1)),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            child: buildRowmaterialsymb(
              context,
              materialsymbol: ImageConstant.uiNotification,
              suporteeOne: "lbl_notifica_es".tr,
              onTap: () => onTapNotification(context),
            ),
          ),
          SizedBox(height: 22.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray90001.withValues(alpha: 0.1)),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            child: buildRowmaterialsymb(
              context,
              materialsymbol: ImageConstant.payment,
              suporteeOne: "lbl_meus_plano".tr,
            ),
          ),
          SizedBox(height: 22.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray90001.withValues(alpha: 0.1)),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 12.h),
            child: buildRowmaterialsymb(
              context,
              materialsymbol: ImageConstant.settings,
              suporteeOne: "lbl_configura_es".tr,
            ),
          ),
          SizedBox(height: 22.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(color: appTheme.gray90001.withValues(alpha: 0.1)),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () => onTapLogOut(context),
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 12.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.logOut,
                    height: 24.h,
                    width: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.h),
                    child: Text(
                      "lbl_sair".tr,
                      style: CustomTextStyles.titleMediumRedA400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildBottombar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      //child: CustomBottomBar(onChanged: (BottomBarEnum type) {}),
    );
  }

  /// Common widget
  Widget buildRowmaterialsymb(
    BuildContext context, {
    required String materialsymbol,
    required String suporteeOne,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(imagePath: materialsymbol, height: 24.h, width: 26.h),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text(
                suporteeOne,
                style: CustomTextStyles.labelLargePoppinsGray90002.copyWith(
                  color: appTheme.gray90001.withValues(alpha: 0.8),
                ),
              ),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            size: 24.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  /// Navigates to the perfilPainelDeControleGrFicoTwoScreen when the action is triggered.
  void onTapImgImageone(BuildContext context) {
    //NavigatorService.pushNamed(AppRoutes.perfilPainelDeControleGrFicoTwoScreen);
  }

  void onTapControlPanel(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.controlPanel);
  }

  void onTapNotification(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.notificationScreen);
  }

  void onTapLogOut(BuildContext context) {
    SessionService().clearSession();
    NavigatorService.pushNamedAndRemovedUntil(AppRoutes.authScreen,
        routePredicate: false);
  }
}
