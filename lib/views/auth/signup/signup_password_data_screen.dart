import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/auth/signup/bloc/signup_screen_bloc.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_field_text_form.dart';

class SignupPasswordDataScreen extends StatelessWidget {
  SignupPasswordDataScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    final SignupScreenBloc bloc =
        ModalRoute.of(context)!.settings.arguments as SignupScreenBloc;
    return BlocProvider.value(
      value: bloc,
      child: SignupPasswordDataScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              horizontal: 20.h,
              vertical: 18.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 14.h,
                        width: 22.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [BackButtonIcon()],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Text(
                          "Voltar",
                          style: CustomTextStyles.titleMediumGray90002,
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
          child: BlocListener<SignupScreenBloc, SignupScreenState>(
            listener: (context, state) {
              // Handle navigation after successful registration
              if (!state.isLoading &&
                  state.errorMessage == null &&
                  state.currentStep == 1) {
                // Navigate to success screen
                NavigatorService.pushNamed(AppRoutes.signupConfirmScreenScreen);
              }
            },
            child: BlocBuilder<SignupScreenBloc, SignupScreenState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.h,
                      vertical: 40.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.logo,
                        ),
                        SizedBox(height: 26.h),
                        Text(
                          "Segurança",
                          style:
                              CustomTextStyles.headlineSmallBluegray900Medium,
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          width: 300.h,
                          child: Text(
                            "Crie uma senha e mantenha seu dados seguros.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                CustomTextStyles.bodyLargeBluegray900.copyWith(
                              height: 1.56,
                            ),
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Crie uma senha",
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 4.h),
                              BlocSelector<SignupScreenBloc, SignupScreenState,
                                      TextEditingController?>(
                                  selector: (state) => state.passwordController,
                                  builder: (context, passwordController) {
                                    return CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "Digite a sua senha",
                                      obscureText: true,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          22.h, 14.h, 22.h, 10.h),
                                      onChanged: (value) {},
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Por favor, digite sua senha";
                                        }
                                        if (value.length < 6) {
                                          return "A senha deve ter pelo menos 6 caracteres";
                                        }
                                        return null;
                                      },
                                    );
                                  }),
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
                                "Repita a senha",
                                style: theme.textTheme.titleSmall,
                              ),
                              SizedBox(height: 2.h),
                              BlocSelector<SignupScreenBloc, SignupScreenState,
                                  TextEditingController?>(
                                selector: (state) =>
                                    state.confirmPasswordController,
                                builder: (context, confirmPasswordController) {
                                  final bloc = context.read<SignupScreenBloc>();
                                  final passwordController =
                                      bloc.state.passwordController;

                                  return CustomTextFormField(
                                    controller: confirmPasswordController,
                                    hintText: "Confirme a sua senha",
                                    textInputAction: TextInputAction.done,
                                    obscureText: true,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    contentPadding: EdgeInsets.fromLTRB(
                                        22.h, 14.h, 22.h, 10.h),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Por favor, confirme sua senha";
                                      }
                                      if (value != passwordController?.text) {
                                        return "As senhas não correspondem";
                                      }
                                      return null;
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        // Display error message if there is one
                        if (state.errorMessage != null) ...[
                          SizedBox(height: 16.h),
                          Text(
                            state.errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                        Spacer(
                          flex: 48,
                        ),
                        CustomElevatedButton(
                          text: state.isLoading
                              ? "Carregando..."
                              : "Finalizar cadastro",
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  onTapFinalizar(context);
                                },
                        ),
                        Spacer(
                          flex: 52,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the success screen when registration is complete
  onTapFinalizar(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignupScreenBloc>().add(CompleteRegistrationEvent());
      // Navigation is handled in the BlocListener
    }
  }
}
