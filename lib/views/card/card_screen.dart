import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/bloc/card_screen_bloc.dart';
import 'package:wundu/views/card/models/card_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardScreenBloc>(
      create: (context) => CardScreenBloc(CardScreenState(
        cardScreenModelObj: CardScreenModel(),
      ))
        ..add(CardScreenInitialEvent()),
      child: BlocBuilder<CardScreenBloc, CardScreenState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 4.h,
                top: 18.h,
                right: 4.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 8.h,
                        top: 100.h,
                        right: 8.h,
                      ),
                      decoration: AppDecoration.fillWhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: GestureDetector(
                              onTap: () {
                                // Método para adicionar cartão por foto
                              },
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(16),
                                color: Color.fromRGBO(255, 138, 122, 1),
                                strokeWidth: 2,
                                dashPattern: [8, 4],
                                child: Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(vertical: 68.h),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder16,
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromRGBO(255, 212, 0, 1),
                                              Color.fromRGBO(255, 114, 94, 1),
                                              Color.fromRGBO(229, 148, 0, 1),
                                            ],
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "Pressione o botão acima para adicionar um novo cartão a ser gerenciado",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyLargeBluegray900
                                  .copyWith(
                                height: 1.56,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            "ou",
                            style: CustomTextStyles.titleMediumSemiBold,
                          ),
                          SizedBox(height: 24.h),
                          CustomElevatedButton(
                            text: "Adicionar de forma manual",
                            onPressed: () {
                              // Método para adicionar cartão manualmente
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
