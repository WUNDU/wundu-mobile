import 'package:flutter/material.dart';
import 'package:wundu/core/utils/validation_functions.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/auth/login/bloc/login_screen_bloc.dart';
import 'package:wundu/views/auth/login/models/login_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_field_text_form.dart';
import 'package:wundu/core/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginScreenBloc>(
      create: (context) => LoginScreenBloc(LoginScreenState(
        loginModelObj: LoginModel(),
        isEmailValid: true,
        isPasswordValid: true,
        hasError: false,
      ))
        ..add(LoginScreenInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginScreenBloc, LoginScreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 40.h,
                    right: 14.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.backgroundSmall,
                        height: 50.h,
                        width: 52.h,
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 68.h),
                      // Imagem que muda dependendo do estado de erro
                      CustomImageView(
                        imagePath: state.hasError
                            ? ImageConstant
                                .pana // Imagem de erro - Adicione essa imagem aos seus assets
                            : ImageConstant.cuate,
                        height: 102.h,
                        width: 108.h,
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        "faça seu login".toUpperCase(),
                        style: CustomTextStyles.titleLargePoppinsBluegray900,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        state.hasError
                            ? "Email ou senha incorretos, tente novamente"
                            : "Faça login e melhore a tua vida financeira",
                        style: state.hasError
                            ? CustomTextStyles
                                .titleMediumRed500cc // Estilo de erro - Adicione este estilo
                            : CustomTextStyles.titleMediumGray500cc,
                      ),
                      SizedBox(height: 38.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(height: 4.h),
                            BlocSelector<LoginScreenBloc, LoginScreenState,
                                TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                  controller: emailController,
                                  hintText: "Digite o seu email",
                                  textInputType: TextInputType.emailAddress,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      22.h, 14.h, 22.h, 10.h),
                                  borderDecoration: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: state.isEmailValid
                                          ? Colors.grey
                                          : Colors.red,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  fillColor: state.isEmailValid
                                      ? null
                                      : Colors.red[50],
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      context
                                          .read<LoginScreenBloc>()
                                          .add(EmailValidationErrorEvent());
                                      return "Por favor insere um email válido";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    context
                                        .read<LoginScreenBloc>()
                                        .add(EmailChangedEvent(value));
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 28.h),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Senha",
                              style: theme.textTheme.titleSmall,
                            ),
                            SizedBox(height: 4.h),
                            BlocSelector<LoginScreenBloc, LoginScreenState,
                                TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                  controller: passwordController,
                                  hintText: "Digite a sua senha",
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      22.h, 14.h, 22.h, 10.h),
                                  borderDecoration: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: state.isEmailValid
                                          ? Colors.grey
                                          : Colors.red,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  fillColor: state.isPasswordValid
                                      ? null
                                      : Colors.red[50],
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidPassword(value,
                                            isRequired: true))) {
                                      context
                                          .read<LoginScreenBloc>()
                                          .add(PasswordValidationErrorEvent());
                                      return "Por favor insere a sua senha";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    context
                                        .read<LoginScreenBloc>()
                                        .add(PasswordChangedEvent(value));
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            onTapTxtEsqueciminha(context);
                          },
                          child: Text(
                            "esqueci minha senha",
                            style: CustomTextStyles
                                .labelLargePoppinsBlack90001SemiBold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      CustomElevatedButton(
                        text: "Entrar",
                        buttonStyle: CustomButtonStyles.fillYellowA,
                        buttonTextStyle: CustomTextStyles.titleLargeSemiBold,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Aqui você adicionaria a lógica de autenticação
                            // Se a autenticação falhar, disparar o evento de erro
                            context
                                .read<LoginScreenBloc>()
                                .add(LoginFailedEvent());
                          }
                        },
                      ),
                      SizedBox(height: 60.h),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Não é registrado ? ",
                              style:
                                  CustomTextStyles.labelLargePoppinsGray90002_1,
                            ),
                            TextSpan(
                              text: " Crie uma conta",
                              style:
                                  CustomTextStyles.labelLargePoppinsGray90002_1,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 172.h,
                          child: Divider(
                            color: appTheme.whiteA700,
                            endIndent: 76.h,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the telaRedefiniODeSenhaFourScreen when the action is triggered.
  onTapTxtEsqueciminha(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the telaLoginOneScreen when the action is triggered.
  onTapColumnemail(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
