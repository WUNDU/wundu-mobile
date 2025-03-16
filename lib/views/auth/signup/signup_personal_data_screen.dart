// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/utils/validation_functions.dart';
import 'package:wundu/views/auth/signup/bloc/signup_screen_bloc.dart';
import 'package:wundu/views/auth/signup/models/signup_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_field_text_form.dart';

class SignupPersonalDataScreen extends StatelessWidget {
  SignupPersonalDataScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupScreenBloc>(
      create: (context) => SignupScreenBloc(SignupScreenState(
        signupScreenModel: SignupScreenModel(),
      ))
        ..add(SignupScreenInitialEvent()),
      child: SignupPersonalDataScreen(),
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
              horizontal: 0.h,
              vertical: 16.h,
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
                          alignment: Alignment.topLeft,
                          children: [BackButtonIcon()],
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
              child: Column(
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
                    "Dados Pessoais",
                    style: CustomTextStyles.headlineSmallBluegray900Medium,
                  ),
                  SizedBox(height: 6.h),
                  SizedBox(
                    width: 320.h,
                    child: Text(
                      "Forneça  seus dados e seja cadastrado no nosso aplicativo.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeBluegray900.copyWith(
                        height: 1.56,
                      ),
                    ),
                  ),
                  SizedBox(height: 36.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nome",
                          style: theme.textTheme.titleSmall,
                        ),
                        BlocSelector<SignupScreenBloc, SignupScreenState,
                            TextEditingController?>(
                          selector: (state) => state.nameController,
                          builder: (context, nameController) {
                            return CustomTextFormField(
                              controller: nameController,
                              hintText: "Digite seu nome",
                              contentPadding:
                                  EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
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
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: theme.textTheme.titleSmall,
                        ),
                        BlocSelector<SignupScreenBloc, SignupScreenState,
                            TextEditingController?>(
                          selector: (state) => state.emailController,
                          builder: (context, emailtwoController) {
                            return CustomTextFormField(
                              controller: emailtwoController,
                              hintText: "Digite seu email",
                              textInputType: TextInputType.emailAddress,
                              contentPadding:
                                  EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
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
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "NºTelefónico",
                          style: theme.textTheme.titleSmall,
                        ),
                        BlocSelector<SignupScreenBloc, SignupScreenState,
                            TextEditingController?>(
                          selector: (state) => state.numberController,
                          builder: (context, numberController) {
                            return CustomTextFormField(
                              controller: numberController,
                              hintText: "Digite seu nº telefónico",
                              textInputAction: TextInputAction.done,
                              contentPadding:
                                  EdgeInsets.fromLTRB(22.h, 14.h, 22.h, 10.h),
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
                  SizedBox(height: 50.h),
                  CustomElevatedButton(
                    text: "Próximo",
                    buttonTextStyle: CustomTextStyles.titleLargeGray200,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final bloc = context.read<SignupScreenBloc>();
                        context
                            .read<SignupScreenBloc>()
                            .add(ChangeStepEvent(step: 1));

                        NavigatorService.pushNamed(
                            arguments: bloc,
                            AppRoutes.signupPasswordDataScreen);
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
  }
}
