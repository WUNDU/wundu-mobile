import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context, designSize: const Size(360, 800));

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700, // Cor de fundo do Scaffold
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 56.w,
          backgroundColor:
              appTheme.whiteA700, // Cor de fundo sólida para a AppBar
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Volta para a tela anterior
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 18.w,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 14.w,
                    width: 22.w,
                    child: const Stack(
                      alignment: Alignment.bottomCenter,
                      children: [BackButtonIcon()],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.w),
                    child: Text(
                      "Voltar",
                      style: CustomTextStyles.titleMediumGray90002,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: BlocListener<SignupScreenBloc, SignupScreenState>(
            listener: (context, state) {
              if (!state.isLoading &&
                  state.errorMessage == null &&
                  state.currentStep == 1) {
                NavigatorService.pushNamed(AppRoutes.signupConfirmScreenScreen);
              }
            },
            child: BlocBuilder<SignupScreenBloc, SignupScreenState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    physics:
                        const ClampingScrollPhysics(), // Evita efeitos indesejados ao rolar
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context)
                          .viewInsets
                          .bottom, // Ajusta o padding para o teclado
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context)
                            .size
                            .height, // Garante que o Container ocupe toda a altura da tela
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 40.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.logo,
                          ),
                          SizedBox(height: 26.w),
                          Text(
                            "Segurança",
                            style:
                                CustomTextStyles.headlineSmallBluegray900Medium,
                          ),
                          SizedBox(height: 4.w),
                          SizedBox(
                            width: 300.w,
                            child: Text(
                              "Crie uma senha e mantenha seu dados seguros.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyLargeBluegray900
                                  .copyWith(
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
                                  "Crie uma senha",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.w),
                                BlocSelector<SignupScreenBloc,
                                    SignupScreenState, TextEditingController?>(
                                  selector: (state) => state.passwordController,
                                  builder: (context, passwordController) {
                                    return CustomTextFormField(
                                      controller: passwordController,
                                      hintText: "Digite a sua senha",
                                      obscureText: true,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          22.w, 14.w, 22.w, 10.w),
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
                                  "Repita a senha",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 2.w),
                                BlocSelector<SignupScreenBloc,
                                    SignupScreenState, TextEditingController?>(
                                  selector: (state) =>
                                      state.confirmPasswordController,
                                  builder:
                                      (context, confirmPasswordController) {
                                    final bloc =
                                        context.read<SignupScreenBloc>();
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
                                          22.w, 14.w, 22.w, 10.w),
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
                                ),
                              ],
                            ),
                          ),
                          if (state.errorMessage != null) ...[
                            SizedBox(height: 16.w),
                            Text(
                              state.errorMessage!,
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                          SizedBox(height: 20.w), // Espaçamento fixo
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
                          SizedBox(height: 20.w), // Espaçamento fixo
                        ],
                      ),
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

  onTapFinalizar(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignupScreenBloc>().add(CompleteRegistrationEvent());
    }
  }
}
