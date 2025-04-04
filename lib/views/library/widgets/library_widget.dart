import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import '../models/library_item_model.dart';

// ignore_for_file: must_be_immutable
class LibraryWidget extends StatelessWidget {
  LibraryWidget(this.libraryItemModelObj, {super.key});

  LibraryItemModel libraryItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.h),
            ),
            child: CustomImageView(
              imagePath: libraryItemModelObj.image!,
              height: 96.h,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Text(
              libraryItemModelObj.title!,
              style: CustomTextStyles.labelLargeGray90001SemiBold,
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              right: 10.h,
            ),
            child: Text(
              libraryItemModelObj.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmallInter1Gray50001.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  libraryItemModelObj.actionText!,
                  style: CustomTextStyles.labelSmallGray90002,
                ),
                CustomImageView(
                  imagePath: ImageConstant.arrowRight2,
                  height: 16.h,
                  width: 16.h,
                  margin: EdgeInsets.only(left: 4.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
