import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/control_panel/models/list_item_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget(this.listItemModelObj, {super.key});

  final ListItemModel listItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 44.h,
            height: 44.h,
            alignment: Alignment.center,
            decoration: AppDecoration.fillBluegray900.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder24,
            ),
            child: Text(
              listItemModelObj.t,
              textAlign: TextAlign.center,
              style: CustomTextStyles
                  .headlineMediumSemiBold, //headlineSmallPoppins2
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listItemModelObj.tranporte,
                  style: CustomTextStyles
                      .titleSmallInter1Bluegray900, //titleSmallInter4Bluegray900
                ),
                Text(
                  listItemModelObj.transaEscount,
                  style: CustomTextStyles
                      .bodySmallInter1Black90001, // bodySmallInter4Bluegray900
                ),
              ],
            ),
          ),
          Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listItemModelObj.kz11000,
                style: CustomTextStyles.labelLargeBluegray90001,
              ),
              Text(
                listItemModelObj.fiftyfive,
                style: CustomTextStyles.bodySmallInterBluegray900,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
