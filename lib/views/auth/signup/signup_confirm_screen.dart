import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/auth/signup/bloc/signup_screen_bloc.dart';
import 'package:wundu/views/auth/signup/models/signup_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';

class SignupConfirmScreen extends StatelessWidget {
  const SignupConfirmScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupScreenBloc>(
      create: (context) => SignupScreenBloc(SignupScreenState(
        signupScreenModel: SignupScreenModel(),
      ))
        ..add(SignupScreenInitialEvent()),
      child: SignupConfirmScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupScreenBloc, SignupScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.whiteA700,
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 156.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 24.h),
                        Container(
                          height: 100.h,
                          width: 102.h,
                          padding: EdgeInsets.only(
                            top: 12.h,
                            right: 2.h,
                          ),
                          decoration: AppDecoration.primarycolor.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder50,
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.confirm,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 44.h),
                        Text(
                          "Cadastro finalizado com \n sucesso",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:
                              CustomTextStyles.headlineMediumSemiBold.copyWith(
                            height: 1.50,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Bem-vindo a Wundu \n",
                                style:
                                    CustomTextStyles.titleSmallInterGray600Bold,
                              ),
                              TextSpan(
                                text: "O caminho para liberdade financeira",
                                style:
                                    CustomTextStyles.titleSmallInterGray60015,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    text: "Continuar",
                    onPressed: () {
                      onTapContinuar(context);
                    },
                  ),
                  SizedBox(height: 52.h)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the telaLoginFourScreen when the action is triggered.
  onTapContinuar(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
