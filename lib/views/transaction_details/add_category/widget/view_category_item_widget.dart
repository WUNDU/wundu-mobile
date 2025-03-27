import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/transaction_details/add_category/models/view_category_item_model.dart';

// ignore_for_file: must_be_immutable
class ViewCategoryItemWidget extends StatelessWidget {
  const ViewCategoryItemWidget(this.viewCategoryItemModelObj,
      {super.key, this.onSelectedChipView});

  final ViewCategoryItemModel viewCategoryItemModelObj;
  final Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: RawChip(
        padding: EdgeInsets.all(10.h),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          viewCategoryItemModelObj.transporteOne!,
          style: TextStyle(
            color: (viewCategoryItemModelObj.isSelected ?? false)
                ? appTheme.whiteA700
                : appTheme.blueGray900,
            fontSize: 12.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (viewCategoryItemModelObj.isSelected ?? false),
        backgroundColor: Colors.transparent,
        selectedColor: appTheme.amber400,
        shape: (viewCategoryItemModelObj.isSelected ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(20.h),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.gray30003,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(20.h),
              ),
        onSelected: (value) {
          onSelectedChipView?.call(value);
        },
      ),
    );
  }
}
