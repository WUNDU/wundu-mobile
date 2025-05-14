// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Importe o flutter_screenutil
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/utils/phone_number_formatter.dart';
import 'package:wundu/core/utils/validation_functions.dart';
import 'package:wundu/views/auth/signup/bloc/signup_screen_bloc.dart';
import 'package:wundu/views/auth/signup/models/signup_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_text_form_field.dart';

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
    // Inicialize o flutter_screenutil
    ScreenUtil.init(context, designSize: const Size(360, 800));

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        resizeToAvoidBottomInset:
            true, // Permite que a tela se ajuste ao teclado
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 56.w,
          backgroundColor:
              appTheme.whiteA700, // Altere para a mesma cor do Scaffold
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              // Adicione SingleChildScrollView
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Ajusta o padding para o teclado
              ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 14.w,
                  top: 32.w,
                  right: 14.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.logo,
                    ),
                    SizedBox(height: 26.w),
                    Text(
                      "Dados Pessoais",
                      style: CustomTextStyles.headlineSmallBluegray900Medium,
                    ),
                    SizedBox(height: 6.w),
                    SizedBox(
                      width: 320.w,
                      child: Text(
                        "Forneça seus dados e seja cadastrado no nosso aplicativo.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyLargeBluegray900.copyWith(
                          height: 1.56,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.w),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nome",
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(
                              height:
                                  4.w), // Espaçamento entre o texto e o campo
                          BlocSelector<SignupScreenBloc, SignupScreenState,
                              TextEditingController?>(
                            selector: (state) => state.nameController,
                            builder: (context, nameController) {
                              return CustomTextFormField(
                                controller: nameController,
                                hintText: "Digite seu nome",
                                contentPadding:
                                    EdgeInsets.fromLTRB(22.w, 14.w, 22.w, 10.w),
                                onChanged: (value) {},
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
                            "Email",
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(
                              height:
                                  4.w), // Espaçamento entre o texto e o campo
                          BlocSelector<SignupScreenBloc, SignupScreenState,
                              TextEditingController?>(
                            selector: (state) => state.emailController,
                            builder: (context, emailtwoController) {
                              return CustomTextFormField(
                                controller: emailtwoController,
                                hintText: "Digite seu email",
                                textInputType: TextInputType.emailAddress,
                                contentPadding:
                                    EdgeInsets.fromLTRB(22.w, 14.w, 22.w, 10.w),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
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
                    SizedBox(height: 26.w),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nº Telefónico",
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(
                              height:
                                  4.w), // Espaçamento entre o texto e o campo
                          BlocSelector<SignupScreenBloc, SignupScreenState,
                              TextEditingController?>(
                            selector: (state) => state.numberController,
                            builder: (context, numberController) {
                              return CustomTextFormField(
                                controller: numberController,
                                hintText: "Digite seu nº telefónico",
                                textInputType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                contentPadding:
                                    EdgeInsets.fromLTRB(22.w, 14.w, 22.w, 10.w),
                                inputFormatters: [
                                  PhoneNumberFormatter(),
                                  LengthLimitingTextInputFormatter(
                                      16), // +244 999 999 999
                                ],
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPhone(value,
                                          isRequired: true))) {
                                    return "Número inválido. Exemplo: +244 923 456 789";
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.w),
                    CustomElevatedButton(
                      text: "Próximo",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final bloc = context.read<SignupScreenBloc>();

                          // Obtenha o número de telefone formatado
                          final formattedPhoneNumber =
                              bloc.state.numberController?.text;

                          // Processe o número para o formato necessário para o backend
                          // sem alterar o que o usuário vê no campo
                          final rawPhone = formattedPhoneNumber
                              ?.replaceAll(' ', '')
                              .substring(0);

                          // Armazene o valor processado em algum lugar no bloc sem atualizar o controlador
                          bloc.add(PreparePhoneNumberEvent(
                              phoneNumber: rawPhone ?? ''));
                          // Continue com o fluxo normal
                          bloc.add(ChangeStepEvent(step: 1));
                          NavigatorService.pushNamed(
                              arguments: bloc,
                              AppRoutes.signupPasswordDataScreen);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
