import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/transaction_details/add_category/models/add_category_model.dart';
import 'package:wundu/views/transaction_details/add_category/widget/view_category_item_widget.dart';
import 'package:wundu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:wundu/widgets/app_bar/custom_app_bar.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_icon_button.dart';
import 'package:wundu/widgets/custom_text_form_field.dart';
import 'bloc/add_category_bloc.dart';
import 'models/view_category_item_model.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCategoryBloc>(
      create: (context) => AddCategoryBloc(
        AddCategoryState(
          addCategoryModelObj: AddCategoryModel(),
        ),
      )..add(AddCategoryInitialEvent()),
      child: const AddCategoryScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.blueGray50,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 14.h,
                top: 8.h,
                right: 14.h,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                      left: 12.h,
                      top: 10.h,
                      right: 12.h,
                    ),
                    decoration: AppDecoration.fillWhiteA700.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "1bl_categ_rias",
                          style: CustomTextStyles.headlineSmallBluegray900,
                        ),
                        SizedBox(height: 22.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Divider(
                            color: appTheme.gray30003.withValues(
                              alpha: 0.4,
                            ),
                            indent: 6.h,
                            endIndent: 6.h,
                          ),
                        ),
                        SizedBox(height: 48.h),
                        _buildCategorySection(context),
                        SizedBox(height: 18.h),
                        _buildDescriptionSection(context),
                        SizedBox(height: 110.h),
                        CustomElevatedButton(
                          height: 56.h,
                          text: "1bl_guardar",
                          margin: EdgeInsets.only(left: 2.h),
                          buttonStyle: CustomButtonStyles.fillYellowA,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumWhiteA700SemiBold,
                          onPressed: () {
                            onTapGuardar(context);
                          },
                        ),
                        SizedBox(height: 18.h),
                        SizedBox(height: 42.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 56.h,
      leadingWidth: 41.h,
      leading: Container(
        height: 14.h,
        width: 21.h,
        margin: EdgeInsets.only(left: 20.h),
        child: Stack(
          children: [
            CustomImageView(
              imagePath: ImageConstant.logo,
              height: 1.h,
              width: double.maxFinite,
            ),
            CustomImageView(
              imagePath: ImageConstant.logo,
              height: 14.h,
              width: 8.h,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 14.h),
            ),
          ],
        ),
      ),
      title: AppbarSubtitleOne(
        text: "1bl_voltar",
        margin: EdgeInsets.only(left: 15.h),
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "msg_categorias_padr_o",
            style: theme.textTheme.titleSmall,
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 2.h,
              vertical: 6.h,
            ),
            decoration: AppDecoration.outlineGray30003.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: BlocSelector<AddCategoryBloc, AddCategoryState,
                      AddCategoryModel?>(
                    selector: (state) => state.addCategoryModelObj,
                    builder: (context, addCategoryModelObj) {
                      return Wrap(
                        runSpacing: 7.h,
                        spacing: 7.h,
                        children: List<Widget>.generate(
                          addCategoryModelObj?.viewCategoryItemList.length ?? 0,
                          (index) {
                            ViewCategoryItemModel model = addCategoryModelObj
                                    ?.viewCategoryItemList[index] ??
                                ViewCategoryItemModel();
                            return ViewCategoryItemWidget(
                              model,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.h),
                  child: DottedBorder(
                    color: appTheme.indigo900,
                    padding: EdgeInsets.only(
                      left: 1.h,
                      top: 1.h,
                      right: 1.h,
                      bottom: 1.h,
                    ),
                    strokeWidth: 1.h,
                    radius: Radius.circular(24),
                    borderType: BorderType.RRect,
                    dashPattern: [2, 2],
                    child: CustomIconButton(
                      height: 50.h,
                      width: 50.h,
                      padding: EdgeInsets.all(12.h),
                      decoration: IconButtonStyleHelper.outlineIndigo,
                      child: CustomImageView(
                        imagePath: ImageConstant.circlePlus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 10.h,
        right: 6.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1bl_descric_o",
            style: theme.textTheme.titleSmall,
          ),
          BlocSelector<AddCategoryBloc, AddCategoryState,
              TextEditingController?>(
            selector: (state) => state.descriptionController,
            builder: (context, descriptionController) {
              return CustomTextFormField(
                controller: descriptionController,
                hintText: "msg_utilizei_este_dinheiro",
                hintStyle: CustomTextStyles.bodyMediumPoppins1Black90001,
                textInputAction: TextInputAction.done,
                maxLines: 5,
                contentPadding: EdgeInsets.fromLTRB(16.h, 14.h, 16.h, 12.h),
              );
            },
          ),
        ],
      ),
    );
  }

  void onTapGuardar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // content: .builder(context),
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
      ),
    );
  }
}
