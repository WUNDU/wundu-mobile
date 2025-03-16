// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/utils/validation_functions.dart';
import 'package:wundu/views/auth/signup/bloc/signup_screen_bloc.dart';
import 'package:wundu/views/auth/signup/models/signup_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_field_text_form.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupScreenBloc>(
      create: (context) => SignupScreenBloc(SignupScreenState(
        signupScreenModel: SignupScreenModel(),
        currentStep: 0,
      ))
        ..add(SignupScreenInitialEvent()),
      child: SignupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupScreenBloc, SignupScreenState>(
      listener: (context, state) {
        if (state.isRegistrationComplete) {
          Navigator.pushReplacementNamed(context, '/success');
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 56.h,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              title: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.h,
                  vertical: 16.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Voltar para o passo anterior ou fechar a tela
                              if (state.currentStep > 0) {
                                context.read<SignupScreenBloc>().add(
                                    ChangeStepEvent(
                                        step: state.currentStep - 1));
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: SizedBox(
                              height: 14.h,
                              width: 22.h,
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [BackButtonIcon()],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Voltar",
                              style: CustomTextStyles.titleMediumBluegray700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              top: false,
              child: Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 14.h,
                    top: 32.h,
                    right: 14.h,
                  ),
                  child: state.isRegistrationComplete
                      ? _buildSuccessScreen(context)
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.logo,
                              height: 52.h,
                              width: 54.h,
                            ),
                            SizedBox(height: 26.h),
                            Text(
                              state.currentStep == 0
                                  ? "Dados Pessoais"
                                  : "Crie sua senha",
                              style: CustomTextStyles
                                  .headlineSmallBluegray900Medium,
                            ),
                            SizedBox(height: 6.h),
                            SizedBox(
                              width: 320.h,
                              child: Text(
                                state.currentStep == 0
                                    ? "Forneça seus dados e seja cadastrado no nosso aplicativo."
                                    : "Crie uma senha segura para proteger sua conta.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodyLargeBluegray900
                                    .copyWith(
                                  height: 1.56,
                                ),
                              ),
                            ),
                            SizedBox(height: 36.h),
                            // Mostra o formulário dependendo do passo atual
                            state.currentStep == 0
                                ? _buildPersonalDataForm(context, state)
                                : _buildPasswordForm(context, state),
                            SizedBox(height: 50.h),
                            // Substitua este trecho no método build do arquivo SignupScreen
                            CustomElevatedButton(
                              text: state.currentStep == 0
                                  ? "Próximo"
                                  : "Finalizar",
                              buttonTextStyle:
                                  CustomTextStyles.titleLargeGray200,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (state.currentStep == 0) {
                                    // Avançar para o próximo passo
                                    context.read<SignupScreenBloc>().add(
                                        ChangeStepEvent(
                                            step: state.currentStep + 1));
                                  } else {
                                    // Finalizar o registro
                                    final password =
                                        state.passwordController?.text ?? '';
                                    final confirmPassword =
                                        state.confirmPasswordController?.text ??
                                            '';

                                    if (password == confirmPassword) {
                                      context
                                          .read<SignupScreenBloc>()
                                          .add(CompleteRegistrationEvent());
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "As senhas não coincidem. Tente novamente."),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  }
                                }
                              },
                            ),
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

  Widget _buildPersonalDataForm(BuildContext context, SignupScreenState state) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nome",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 4.h),
              BlocSelector<SignupScreenBloc, SignupScreenState,
                  TextEditingController?>(
                selector: (state) => state.nameController,
                builder: (context, nameController) {
                  return CustomTextFormField(
                    controller: nameController,
                    hintText: "Digite seu nome",
                    contentPadding: EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite seu nome";
                      }
                      return null;
                    },
                    onChanged: (value) {},
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
                "Email",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 4.h),
              BlocSelector<SignupScreenBloc, SignupScreenState,
                  TextEditingController?>(
                selector: (state) => state.emailController,
                builder: (context, emailController) {
                  return CustomTextFormField(
                    controller: emailController,
                    hintText: "Digite seu email",
                    textInputType: TextInputType.emailAddress,
                    contentPadding: EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Por favor insira o seu email";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 26.h),
        SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nº Telefónico",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 4.h),
              BlocSelector<SignupScreenBloc, SignupScreenState,
                  TextEditingController?>(
                selector: (state) => state.numberController,
                builder: (context, numberController) {
                  return CustomTextFormField(
                    controller: numberController,
                    hintText: "Digite seu nº telefónico",
                    textInputAction: TextInputAction.done,
                    contentPadding: EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPhone(value, isRequired: true))) {
                        return "Por favor insira um número correcto";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordForm(BuildContext context, SignupScreenState state) {
    // Certifique-se de que os controladores de senha estão vazios quando entrar nesta tela
    state.passwordController?.clear();
    state.confirmPasswordController?.clear();
    return Column(
      children: [
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
              BlocSelector<SignupScreenBloc, SignupScreenState,
                  TextEditingController?>(
                selector: (state) => state.passwordController,
                builder: (context, passwordController) {
                  return CustomTextFormField(
                    controller: passwordController,
                    hintText: "Digite sua senha",
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    contentPadding: EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, digite sua senha";
                      }
                      if (value.length < 6) {
                        return "A senha deve ter no mínimo 6 caracteres";
                      }
                      return null;
                    },
                    onChanged: (value) {},
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
                "Confirmar Senha",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 4.h),
              BlocSelector<SignupScreenBloc, SignupScreenState,
                  TextEditingController?>(
                selector: (state) => state.confirmPasswordController,
                builder: (context, confirmPasswordController) {
                  return CustomTextFormField(
                    controller: confirmPasswordController,
                    hintText: "Repita sua senha",
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    contentPadding: EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
                    validator: (value) {
                      final password = state.passwordController?.text ?? '';

                      if (value == null || value.isEmpty) {
                        return "Por favor, confirme sua senha";
                      }
                      if (value != password) {
                        return "As senhas não coincidem";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessScreen(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.logo,
          height: 80.h,
          width: 80.h,
        ),
        SizedBox(height: 30.h),
        Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 80.h,
        ),
        SizedBox(height: 20.h),
        Text(
          "Cadastro realizado com sucesso!",
          style: CustomTextStyles.headlineSmallBluegray900Medium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 280.h,
          child: Text(
            "Seu cadastro foi concluído com sucesso! Agora você pode acessar todos os recursos do nosso aplicativo.",
            style: CustomTextStyles.bodyLargeBluegray900.copyWith(
              height: 1.56,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40.h),
        CustomElevatedButton(
          text: "Ir para login",
          buttonTextStyle: CustomTextStyles.titleLargeGray200,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    );
  }
}
