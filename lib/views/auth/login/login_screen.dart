import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:wundu/core/utils/validation_functions.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/auth/login/bloc/login_screen_bloc.dart';
import 'package:wundu/views/auth/login/models/login_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/widgets/custom_text_form_field.dart';

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
        isPasswordVisible: false,
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
        if (state is LoginSuccessState) {
          NavigatorService.pushNamedAndRemovedUntil(
            AppRoutes.mainScreen,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: true,
            body: Form(
              key: _formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = MediaQuery.of(context).size.width > 600;
                  return Center(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: isTablet ? 40.w : 14.w,
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isTablet ? 600 : double.infinity,
                        ),
                        child: _buildContent(context, state),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, LoginScreenState state) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImageView(
          imagePath: ImageConstant.logo,
          alignment: Alignment.centerLeft,
          height: isTablet ? 60.w : 40.w,
        ),
        SizedBox(height: isTablet ? 32.w : 16.w),
        Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.backgroundSmall,
              height: isTablet ? 300.w : 200.w,
              width: isTablet ? 450.w : 300.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImageView(
                  imagePath:
                      state.hasError ? ImageConstant.pana : ImageConstant.cuate,
                  height: isTablet ? 120.w : 90.w,
                  width: isTablet ? 120.w : 90.w,
                ),
                SizedBox(height: isTablet ? 16.w : 12.w),
                if (state.hasError)
                  Text(
                    state.errorMessage ??
                        "Email ou senha incorretos, tente novamente",
                    style: CustomTextStyles.titleMediumPoppinsRedA200
                        .copyWith(height: 1.50),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  )
                else
                  Column(
                    children: [
                      Text(
                        "faça seu login".toUpperCase(),
                        style: CustomTextStyles.titleLargePoppinsBluegray900,
                      ),
                      SizedBox(height: 2.w),
                      Text(
                        "Faça login e melhore a tua vida financeira",
                        style: CustomTextStyles.titleMediumGray500cc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
        SizedBox(height: isTablet ? 40.w : 24.w),
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
                  // Set initial text if lastUsedEmail is available
                  if (state.lastUsedEmail != null &&
                      emailController != null &&
                      emailController.text.isEmpty) {
                    emailController.text = state.lastUsedEmail ?? '';
                  }
                  return CustomTextFormField(
                    controller: emailController,
                    hintText: "Digite o seu email",
                    textInputType: TextInputType.emailAddress,
                    contentPadding: EdgeInsets.fromLTRB(22.w, 14.w, 22.w, 10.w),
                    borderDecoration: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: state.errorMessage != null
                            ? Colors.red
                            : (state.isPasswordValid
                                ? Colors.grey
                                : Colors.red),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: state.isEmailValid ? null : Colors.red[50],
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
              )
            ],
          ),
        ),
        SizedBox(height: isTablet ? 36.w : 28.w),
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
                      textInputType: TextInputType.visiblePassword,
                      obscureText: !state.isPasswordVisible,
                      contentPadding:
                          EdgeInsets.fromLTRB(22.w, 14.w, 22.w, 10.w),
                      borderDecoration: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: state.errorMessage != null
                              ? Colors.red
                              : (state.isPasswordValid
                                  ? Colors.grey
                                  : Colors.red),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: state.isPasswordValid ? null : Colors.red[50],
                      suffix: IconButton(
                        icon: HugeIcon(
                            icon: state.isPasswordVisible
                                ? HugeIcons.strokeRoundedView
                                : HugeIcons.strokeRoundedViewOffSlash,
                            color: Colors.grey),
                        onPressed: () {
                          context
                              .read<LoginScreenBloc>()
                              .add(TogglePasswordVisibilityEvent());
                        },
                      ),
                      validator: (value) {
                        if (value == null ||
                            (!isValidPassword(value, isRequired: true))) {
                          context
                              .read<LoginScreenBloc>()
                              .add(PasswordValidationErrorEvent());
                          return "Por favor insere a sua senha";
                        }
                        if (value.length < 8) {
                          return "A senha deve ter pelo menos 8 caracteres";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        context
                            .read<LoginScreenBloc>()
                            .add(PasswordChangedEvent(value));
                      },
                    );
                  }),
            ],
          ),
        ),
        SizedBox(height: isTablet ? 24.w : 20.w),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              onTapForgetPassword(context);
            },
            child: Text(
              "esqueci minha senha",
              style: CustomTextStyles.labelLargePoppinsBlack90001SemiBold,
            ),
          ),
        ),
        SizedBox(height: isTablet ? 40.w : 30.w),
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
                    buttonTextStyle: CustomTextStyles.titleLargeSemiBold,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginScreenBloc>().add(SubmitLoginEvent());
                      }
                    },
                  );
          },
        ),
        SizedBox(height: isTablet ? 50.w : 40.w),
        GestureDetector(
          onTap: () {
            onTapSignup(context);
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Não é registrado ? ",
                  style: CustomTextStyles.labelLargePoppinsGray90002_1,
                ),
                TextSpan(
                  text: " Crie uma conta",
                  style: CustomTextStyles.labelLargePoppinsBlack90001SemiBold,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
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
