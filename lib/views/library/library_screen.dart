import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/routes/protected_route.dart';
import 'package:wundu/views/library/bloc/library_bloc.dart';
import 'package:wundu/views/library/models/library_model.dart';
import 'package:wundu/views/library/models/grid_item_model.dart';
import 'package:wundu/views/library/models/library_item_model.dart';
import 'package:wundu/views/library/widgets/library_widget.dart';
import 'package:wundu/widgets/custom_icon_button.dart';
import 'package:wundu/widgets/custom_outlined_button.dart';
import 'package:wundu/widgets/custom_search_view.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<LibraryBloc>(
      create: (context) => LibraryBloc(LibraryState(
        libraryModelObj: LibraryModel(),
      ))
        ..add(LibraryInitialEvent()),
      child: LibraryScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProtectedRoute(
      child: Scaffold(
        backgroundColor: appTheme.blueGray50,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: appTheme.whiteA700,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 14.h,
                  top: 26.h,
                  right: 14.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 16.h,
                        top: 12.h,
                        right: 16.h,
                        bottom: 12.h,
                      ),
                      decoration: AppDecoration.fillwhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder20,
                      ),
                      child: Column(
                        spacing: 24,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 8.h),
                          _buildRowsearch(context),
                          _buildRowfinanas(context),
                          _buildColumnartigosno(context),
                          CustomOutlinedButton(
                            height: 40.h,
                            width: 108.h,
                            text: "lbl_ver_mais".tr,
                            rightIcon: Container(
                              margin: EdgeInsets.only(left: 8.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.arrowRotate,
                                height: 16.h,
                                width: 16.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            buttonTextStyle:
                                CustomTextStyles.labelLargePoppinsBlack90001,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowsearch(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:
                BlocSelector<LibraryBloc, LibraryState, TextEditingController?>(
              selector: (state) => state.searchController,
              builder: (context, searchController) {
                return CustomSearchView(
                  controller: searchController,
                  hintText: "msg_pesquisar_por_um".tr,
                  contentPadding: EdgeInsets.fromLTRB(14.h, 8.h, 12.h, 8.h),
                  borderDecoration: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.h),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 0.5,
                    ),
                  ),
                  suffix: null,
                  showClearButton: false,
                );
              },
            ),
          ),
          SizedBox(width: 8.h),
          Container(
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: CustomIconButton(
              height: 40.h,
              width: 40.h,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.fillGray,
              child: CustomImageView(
                imagePath: ImageConstant.filter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowfinanas(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 8.h,
            ),
            decoration: AppDecoration.outlineBluegray1001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_finan_as".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeGray90001_1,
            ),
          ),
          SizedBox(width: 8.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.h,
              vertical: 10.h,
            ),
            decoration: AppDecoration.outlineBluegray1001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_investimentos".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeGray90001_1,
            ),
          ),
          SizedBox(width: 8.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 8.h,
            ),
            decoration: AppDecoration.outlineBluegray1001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_poupan_a".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeGray90001_1,
            ),
          ),
          SizedBox(width: 8.h),
          Container(
            padding: EdgeInsets.all(10.h),
            decoration: AppDecoration.outlineBluegray1001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Text(
              "lbl_gest_o".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.labelLargeGray90001_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnartigosno(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
            width: 84.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "lbl_artigos_novos".tr,
                  style: CustomTextStyles.labelLargeGray90001_1,
                ),
              ],
            ),
          ),
          BlocSelector<LibraryBloc, LibraryState, LibraryModel?>(
            selector: (state) => state.libraryModelObj,
            builder: (context, libraryModelObj) {
              return ResponsiveGridListBuilder(
                minItemWidth: 1,
                minItemsPerRow: 2,
                maxItemsPerRow: 2,
                horizontalGridSpacing: 20.h,
                verticalGridSpacing: 20.h,
                builder: (context, items) => ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: items,
                ),
                gridItems: List.generate(
                  libraryModelObj!.gridItemList?.length ?? 0,
                  (index) {
                    GridItemModel gridModel =
                        libraryModelObj.gridItemList?[index] ?? GridItemModel();
                    LibraryItemModel libraryModel = LibraryItemModel(
                      image: gridModel.image,
                      title: gridModel.title,
                      description: gridModel.subtitle,
                      actionText: gridModel.actionText,
                    );
                    return LibraryWidget(
                      libraryModel,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// Section Widge
}
