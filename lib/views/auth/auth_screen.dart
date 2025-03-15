import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/auth/bloc/auth_screen_bloc.dart';
import 'package:wundu/views/auth/models/auth_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_outlined_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AuthScreenBloc>(
      create: (context) => AuthScreenBloc(AuthScreenState(
        authScreenModelObj: AuthScreenModel(),
      ))
        ..add(AuthScreenInitialEvent()),
      child: AuthScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenBloc, AuthScreenState>(
        builder: (context, state) {
      return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: AppDecoration.fillWhiteA,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 50.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.logo,
                    height: 52.h,
                    width: 54.h,
                  ),
                  Spacer(
                    flex: 65,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 294.h,
                          child: Text(
                            "Acompanhe seus gastos sem esforço",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.displayMedium!.copyWith(
                              height: 1.20,
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 24.h,
                              width: 24.h,
                              margin: EdgeInsets.only(
                                left: 1.h,
                                top: 130.h,
                              ),
                              decoration: BoxDecoration(
                                color: appTheme.yellowA700,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 332.h,
                    child: Text(
                      "Gerencie suas finanças facilmente usando nossa interface intuitiva e amigável, defina metas financeiras e monitore seu progresso",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeBluegray900.copyWith(
                        height: 1.56,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 34,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            height: 48.h,
                            text: "Cadastre-se",
                            buttonTextStyle:
                                CustomTextStyles.titleSmallInterGray200,
                            onPressed: () {
                              onTapFaasignup(context);
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Expanded(
                          child: CustomOutlinedButton(
                            height: 48.h,
                            text: "Faça login",
                            buttonStyle: CustomButtonStyles.outlineGray,
                            buttonTextStyle:
                                CustomTextStyles.titleSmallInterGray90001,
                            onPressed: () {
                              onTapFaalogin(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  /// Navigates to the telaLoginFourScreen when the action is triggered.
  onTapFaalogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  onTapFaasignup(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signup,
    );
  }
}
