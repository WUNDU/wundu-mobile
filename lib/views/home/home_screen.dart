import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/activity_tracker.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/home/bloc/home_screen_bloc.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_icon_button.dart';
import 'package:wundu/widgets/custom_outlined_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ActivityTracker {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    final bool isTablet = ScreenUtil().screenWidth > 600;

    return BlocProvider<HomeScreenBloc>(
      create: (context) => HomeScreenBloc(HomeScreenState(
        homeScreenModelObj: HomeScreenModel(),
      ))
        ..add(HomeScreenInitialEvent()),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return SafeArea(
            top: false,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 12.w,
                    top: 16.w,
                    right: 12.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 14.w),
                      SizedBox(
                        height: isTablet ? 250.w : 192.w,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.rectangleCard,
                              height: isTablet ? 250.w : 192.w,
                              width: double.maxFinite,
                              radius: BorderRadius.circular(16.w),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: double.maxFinite,
                                margin: EdgeInsets.only(
                                  left: 10.w,
                                  top: 10.w,
                                  right: 10.w,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.menu,
                                      height: 24.w,
                                      width: 26.w,
                                      alignment: Alignment.centerRight,
                                      color: Colors.white,
                                      border: Border.all(),
                                      radius: BorderRadius.circular(18),
                                    ),
                                    CustomElevatedButton(
                                      height: isTablet ? 40.w : 34.w,
                                      text: "0 contas associadas",
                                      margin: EdgeInsets.only(
                                        left: isTablet ? 100.w : 84.w,
                                        right: isTablet ? 100.w : 82.w,
                                      ),
                                      buttonStyle:
                                          CustomButtonStyles.fillDeepOrange,
                                      buttonTextStyle: CustomTextStyles
                                          .bodyLargeDeeporange300,
                                    ),
                                    SizedBox(height: isTablet ? 16.w : 12.w),
                                    Text(
                                      "Valor total",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    SizedBox(height: 2.w),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.ayeOff,
                                          color: Colors.white,
                                          height: 24.w,
                                          width: 24.w,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                        Text(
                                          " ************",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isTablet ? 40.w : 30.w),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                          horizontal: 18.w,
                          vertical: isTablet ? 20.w : 10.w,
                        ),
                        decoration: AppDecoration.outlineGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder16,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: isTablet ? 15.w : 10.w),
                            SizedBox(
                              width: double.maxFinite,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Movimentações".toUpperCase(),
                                    style: CustomTextStyles
                                        .titleSmallInterBluegray900SemiBold,
                                  ),
                                  CustomIconButton(
                                    height: isTablet ? 50.w : 40.w,
                                    width: isTablet ? 50.w : 40.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: IconButtonStyleHelper.fillGray,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.filter,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: isTablet ? 24.w : 20.w),
                            SizedBox(
                              width: double.maxFinite,
                              child: Divider(),
                            ),
                            SizedBox(height: isTablet ? 24.w : 20.w),
                            _buildTransactionSection(context, state, isTablet),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionSection(
      BuildContext context, HomeScreenState state, bool isTablet) {
    bool hasTransactions =
        state.homeScreenModelObj?.transactions.isNotEmpty ?? false;

    if (!hasTransactions) {
      return _buildEmptyTransactionsView(isTablet);
    }

    final transactions = state.homeScreenModelObj?.transactions ?? [];
    final groupedTransactions = _groupTransactionsByDate(transactions);

    return Column(
      children: [
        // Lista de transações agrupadas por data
        ...groupedTransactions.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateSection(_formatDate(entry.key)), // Cabeçalho com a data
              SizedBox(height: isTablet ? 16.w : 12.w),

              // Lista de transações para esta data
              ...entry.value.map((transaction) {
                return Column(
                  children: [
                    _buildTransactionItem(
                      transaction: transaction,
                      isTablet: isTablet,
                    ),
                    SizedBox(height: isTablet ? 16.w : 12.w),
                    Divider(),
                    SizedBox(height: isTablet ? 16.w : 12.w),
                  ],
                );
              }),
            ],
          );
        }),

        // Botão "Ver mais"
        SizedBox(height: isTablet ? 24.w : 20.w),
        CustomOutlinedButton(
          height: isTablet ? 48.w : 40.w,
          width: isTablet ? 120.w : 108.w,
          text: "Ver mais",
          rightIcon: Container(
            margin: EdgeInsets.only(left: 8.w),
            child: CustomImageView(
              imagePath: ImageConstant.arrowRotate,
              height: isTablet ? 20.w : 16.w,
              width: isTablet ? 20.w : 16.w,
              fit: BoxFit.contain,
            ),
          ),
          buttonTextStyle: CustomTextStyles.labelLargePoppinsBlack90001,
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required TransactionModel transaction,
    required bool isTablet,
  }) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: isTablet ? 60.w : 50.w,
            width: isTablet ? 60.w : 50.w,
            padding: EdgeInsets.all(isTablet ? 14.w : 12.w),
            decoration: BoxDecoration(
              color: transaction.backgroundColor,
              borderRadius: BorderRadius.circular(isTablet ? 30.w : 24.w),
            ),
            child: transaction.iconPath != null
                ? CustomImageView(
                    imagePath: transaction.iconPath!,
                    fit: BoxFit.contain,
                  )
                : SizedBox(),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  transaction.description,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          // Botão ArrowRight melhorado
          SizedBox(
            height: isTablet ? 40.w : 22.w,
            width: isTablet ? 40.w : 22.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(isTablet ? 20.w : 16.w),
                onTap: () {
                  _navigateToTransactionDetails(context, transaction);
                },
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(isTablet ? 20.w : 16.w),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 0.5.w,
                    ),
                  ),
                  padding: EdgeInsets.all(isTablet ? 8.w : 2.w),
                  child: AnimatedScale(
                    duration: Duration(milliseconds: 150),
                    scale: 1.0,
                    child: CustomImageView(
                      imagePath: ImageConstant.arrowRight,
                      height: isTablet ? 16.w : 12.w,
                      width: isTablet ? 16.w : 12.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToTransactionDetails(
      BuildContext context, TransactionModel transaction) {
    NavigatorService.pushNamed(
      AppRoutes.transactionDetailsScreen,
      arguments: transaction,
    );
  }

  Widget _buildDateSection(String dateLabel) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.calendar,
            height: 16.w,
            width: 16.w,
            color: appTheme.blueGray900,
          ),
          SizedBox(width: 8.w),
          Text(
            dateLabel,
            style: CustomTextStyles.labelLargeBluegray900,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyTransactionsView(bool isTablet) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: isTablet ? 60.w : 44.w),
        child: Column(
          children: [
            Container(
              height: isTablet ? 100.w : 80.w,
              width: isTablet ? 100.w : 82.w,
              decoration: AppDecoration.fillBlack.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder40,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.moneyOff,
                    height: isTablet ? 50.w : 40.w,
                    width: isTablet ? 52.w : 42.w,
                  ),
                ],
              ),
            ),
            SizedBox(height: isTablet ? 16.w : 10.w),
            Text(
              "Sem movimentos para mostrar",
              style: CustomTextStyles.titleMediumBluegray900,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                "Registre um cartão e começe a ver seus movimentos",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: CustomTextStyles.bodySmallInterBluegray900.copyWith(
                  height: 2.08,
                ),
              ),
            ),
            SizedBox(height: isTablet ? 24.w : 20.w),
            // CustomElevatedButton(
            //   height: isTablet ? 48.w : 40.w,
            //   width: isTablet ? 200.w : 180.w,
            //   text: "Adicionar Cartão",
            //   buttonStyle: CustomButtonStyles.fillYellowA,
            //   buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
            //   onPressed: () {
            //     NavigatorService.pushNamed(AppRoutes.addCardManualScreen);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  // Função para agrupar transações por data
  Map<DateTime, List<TransactionModel>> _groupTransactionsByDate(
      List<TransactionModel> transactions) {
    final map = <DateTime, List<TransactionModel>>{};

    for (var transaction in transactions) {
      final date = DateTime(
          transaction.date.year, transaction.date.month, transaction.date.day);
      if (!map.containsKey(date)) {
        map[date] = [];
      }
      map[date]!.add(transaction);
    }

    // Ordenar por data (mais recente primeiro)
    final sortedKeys = map.keys.toList()..sort((a, b) => b.compareTo(a));
    final sortedMap = <DateTime, List<TransactionModel>>{};
    for (var key in sortedKeys) {
      sortedMap[key] = map[key]!;
    }

    return sortedMap;
  }

  // Função para formatar a data
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));

    if (date == today) return "Hoje";
    if (date == yesterday) return "Ontem";

    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }
}
