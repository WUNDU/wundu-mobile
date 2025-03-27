import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/card/bloc/card_screen_bloc.dart';
import 'package:wundu/views/card/models/card_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart'; // Import GetX for localization

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<CardScreenBloc>(
      create: (context) => CardScreenBloc(
        CardScreenState(
          cardScreenModelObj: CardScreenModel(),
        ),
      )..add(CardScreenInitialEvent()),
      child: const ConfirmDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency, // This makes the material transparent
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 20.h), // Add some margin
          padding: EdgeInsets.symmetric(
            horizontal: 36.h,
            vertical: 32.h,
          ),
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Container(
                height: 54.h,
                width: 60.h,
                decoration: AppDecoration.fillTeal300.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder28,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.roundDone,
                      height: 30.h,
                      width: 32.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Text(
                  "Cartão adicionado com sucesso",
                  style: CustomTextStyles.titleSmallBlack90001_2,
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.h,
                  right: 10.h,
                ),
                child: Text(
                  "Agora você pode aproveitar e gerenciar o seu dinheiro de forma simples.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodySmallInterBlack90001.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              CustomElevatedButton(
                height: 36.h,
                text: "Continuar",
                buttonStyle: CustomButtonStyles.fillGrayTL8,
                buttonTextStyle: CustomTextStyles.labelLargePoppinsWhiteA700,
                onPressed: () {
                  onTapContinuar(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the telaVisualizaODeContasTwoScreen when the action is triggered.
  onTapContinuar(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.mainScreen,
    );
  }
}
