import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wundu/core/utils/validation_functions.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/auth/login/bloc/login_screen_bloc.dart';
import 'package:wundu/views/auth/login/models/login_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_field_text_form.dart';
import 'package:wundu/core/app_export.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginScreenBloc>(
      create: (context) => LoginScreenBloc(LoginScreenState(
        loginModelObj: LoginScreenModel(),
        isEmailValid: true,
        isPasswordValid: true,
        hasError: false,
        isLoading: false,
      ))
        ..add(LoginScreenInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    return BlocConsumer<LoginScreenBloc, LoginScreenState>(
      listener: (context, state) {
        // Handle navigation on successful login
        if (!state.isLoading &&
            !state.hasError &&
            state.emailController != null &&
            state.emailController!.text.isNotEmpty &&
            state.passwordController != null &&
            state.passwordController!.text.isNotEmpty &&
            _formKey.currentState!.validate()) {
          // Adiciona verificação de validação
          // Check if this is after a successful login attempt
          final currentRoute = ModalRoute.of(context)?.settings.name;
          if (currentRoute == AppRoutes.loginScreen) {
            NavigatorService.pushNamedAndRemovedUntil(
              AppRoutes.homeScreen, // Replace with your home/dashboard route
            );
          }
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 14.w,
                      top: 40.w,
                      right: 14.w,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.backgroundSmall,
                          height: 50.w,
                          width: 52.w,
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(height: 68.w),
                        // Image that changes depending on error state
                        CustomImageView(
                          imagePath: state.hasError
                              ? ImageConstant.pana
                              : ImageConstant.cuate,
                          height: 102.w,
                          width: 108.w,
                        ),
                        SizedBox(height: 18.w),
                        Text(
                          "faça seu login".toUpperCase(),
                          style: CustomTextStyles.titleLargePoppinsBluegray900,
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          state.hasError
                              ? state.errorMessage ??
                                  "Email ou senha incorretos, tente novamente"
                              : "Faça login e melhore a tua vida financeira",
                          style: state.hasError
                              ? CustomTextStyles.titleMediumPoppinsRedA200
                                  .copyWith(height: 1.50)
                              : CustomTextStyles.titleMediumGray500cc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 38.w),
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 4.w),
                              BlocSelector<LoginScreenBloc, LoginScreenState,
                                  TextEditingController?>(
                                selector: (state) => state.emailController,
                                builder: (context, emailController) {
                                  return CustomTextFormField(
                                    controller: emailController,
                                    hintText: "Digite o seu email",
                                    textInputType: TextInputType.emailAddress,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        22.w, 14.w, 22.w, 10.w),
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
                                      if (value == null || value.isEmpty) {
                                        context
                                            .read<LoginScreenBloc>()
                                            .add(EmailValidationErrorEvent());
                                        return "Campo obrigatório";
                                      }
                                      if (!isValidEmail(value)) {
                                        context
                                            .read<LoginScreenBloc>()
                                            .add(EmailValidationErrorEvent());
                                        return "Formato de email inválido";
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
                        SizedBox(height: 28.w),
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Senha",
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 4.w),
                              BlocSelector<LoginScreenBloc, LoginScreenState,
                                  TextEditingController?>(
                                selector: (state) => state.passwordController,
                                builder: (context, passwordController) {
                                  return CustomTextFormField(
                                    controller: passwordController,
                                    hintText: "Digite a sua senha",
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        22.w, 14.w, 22.w, 10.w),
                                    borderDecoration: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: state.isPasswordValid
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
                                        context.read<LoginScreenBloc>().add(
                                            PasswordValidationErrorEvent());
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
                        SizedBox(height: 14.w),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              onTapForgetPassword(context);
                            },
                            child: Text(
                              "esqueci minha senha",
                              style: CustomTextStyles
                                  .labelLargePoppinsBlack90001SemiBold,
                            ),
                          ),
                        ),
                        SizedBox(height: 40.w),
                        BlocSelector<LoginScreenBloc, LoginScreenState, bool>(
                          selector: (state) => state.isLoading,
                          builder: (context, isLoading) {
                            return isLoading
                                ? CircularProgressIndicator(
                                    color: appTheme.yellowA700,
                                  )
                                : CustomElevatedButton(
                                    text: "Entrar",
                                    buttonStyle: CustomButtonStyles.fillYellowA,
                                    buttonTextStyle:
                                        CustomTextStyles.titleLargeSemiBold,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Dispatch the SubmitLoginEvent to the bloc
                                        context
                                            .read<LoginScreenBloc>()
                                            .add(SubmitLoginEvent());
                                      }
                                    },
                                  );
                          },
                        ),
                        SizedBox(height: 60.w),
                        GestureDetector(
                          onTap: () {
                            onTapSignup(context);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Não é registrado ? ",
                                  style: CustomTextStyles
                                      .labelLargePoppinsGray90002_1,
                                ),
                                TextSpan(
                                  text: " Crie uma conta",
                                  style: CustomTextStyles
                                      .labelLargePoppinsBlack90001SemiBold_1,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 172.w,
                            child: Divider(
                              color: appTheme.whiteA700,
                              endIndent: 76.w,
                            ),
                          ),
                        )
                      ],
                    ),
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
  onTapForgetPassword(BuildContext context) {
    // NavigatorService.pushNamed(
    //   AppRoutes.forgotPasswordScreen, // Change to your forgot password route
    // );
  }

  onTapSignup(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupPersonalDataScreen,
    );
  }
}
