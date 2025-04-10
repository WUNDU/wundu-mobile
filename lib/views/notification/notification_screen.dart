import 'package:flutter/material.dart';
import 'package:wundu/views/notification/model/notification_item_model.dart';
import 'package:wundu/views/notification/model/notification_model.dart';
import 'package:wundu/widgets/app_bar/custom_app_bar.dart';
import '../../../core/app_export.dart';
import 'bloc/notification_bloc.dart';
import 'widgets/notification_item_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc(
        NotificationState(
          notificationModelObj: const NotificationModel(),
        ),
      )..add(const NotificationInitialEvent()),
      child: const NotificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.blueGray50,
      appBar: _buildAppbar(context),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 14.h,
            top: 18.h,
            right: 14.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(10.h),
                  decoration: AppDecoration.outlineGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Column(
                    spacing: 24,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1bl_notifica_es".tr,
                        style: CustomTextStyles.headlineSmallBluegray900,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Divider(
                          indent: 8.h,
                          endIndent: 8.h,
                        ),
                      ),
                      _buildNotificationList(context),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      height: 56.h,
      leadingWidth: 57.h,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: appTheme.blueGray900,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationList(BuildContext context) {
    return Expanded(
      child:
          BlocSelector<NotificationBloc, NotificationState, NotificationModel?>(
        selector: (state) => state.notificationModelObj,
        builder: (context, notificationModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0.h),
                child: Divider(
                  height: 1.h,
                  thickness: 1.h,
                  color: appTheme.gray30003.withValues(alpha: 0.4),
                ),
              );
            },
            itemCount: notificationModelObj?.notificationItemList.length ?? 0,
            itemBuilder: (context, index) {
              final model = notificationModelObj?.notificationItemList[index] ??
                  NotificationItemModel();
              return NotificationItemWidget(model);
            },
          );
        },
      ),
    );
  }
}
