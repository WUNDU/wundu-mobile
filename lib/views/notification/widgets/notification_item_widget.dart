import 'package:flutter/material.dart';
import 'package:wundu/views/notification/model/notification_item_model.dart';
import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget(this.notificationItemModelObj, {super.key});

  final NotificationItemModel notificationItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60.h,
          width: 48.h,
          decoration: AppDecoration.outlineBlack900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: notificationItemModelObj.transferNcia!,
                height: 34.h,
                width: 36.h,
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(right: 10.h)),
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        notificationItemModelObj.transferncia1!,
                        style: CustomTextStyles.titleSmallBlack90001SemiBold,
                      ),
                    ),
                    Text(
                      notificationItemModelObj.time!,
                      style: CustomTextStyles.bodySmallBlack9000110,
                    ),
                  ],
                ),
              ),
              Text(
                notificationItemModelObj.recebeuuma!,
                style: CustomTextStyles.bodySmallBlack90001,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
