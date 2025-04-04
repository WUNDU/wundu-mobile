import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/core/session/activity_tracker.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/home/bloc/home_screen_bloc.dart';
import 'package:wundu/views/home/models/home_screen_model.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
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
      create: (context) =>
          HomeScreenBloc(HomeScreenState())..add(HomeScreenInitialEvent()),
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          final model = state.homeScreenModelObj ?? HomeScreenModel();
          final cardCount = model.cards.length;
          final totalBalance = model.totalBalance;
          final isBalanceVisible = model.isBalanceVisible;

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
                      _buildCardSection(
                        context,
                        cardCount: cardCount,
                        totalBalance: totalBalance,
                        isBalanceVisible: isBalanceVisible,
                        isTablet: isTablet,
                      ),
                      SizedBox(height: isTablet ? 40.w : 30.w),
                      _buildMovimentacoesSection(context, state, isTablet),
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

  Widget _buildCardSection(
    BuildContext context, {
    required int cardCount,
    required double totalBalance,
    required bool isBalanceVisible,
    required bool isTablet,
  }) {
    return SizedBox(
      height: isTablet ? 250.w : 192.w,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background card image
          CustomImageView(
            imagePath: ImageConstant.rectangleCard,
            height: isTablet ? 250.w : 192.w,
            width: double.maxFinite,
            radius: BorderRadius.circular(16.w),
          ),
          // Menu button with animation
          Positioned(
            top: 10.w,
            right: 10.w,
            child: _AnimatedIconButton(
              icon: ImageConstant.menu,
              height: 32.w,
              width: 32.w,
              backgroundColor: Colors.grey.withValues(alpha: 0.6),
              onTap: () {},
              iconColor: Colors.white,
            ),
          ),
          // Card content
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
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.only(top: 27.w)),
                  CustomElevatedButton(
                    height: isTablet ? 40.w : 34.w,
                    text: "$cardCount contas associadas",
                    margin: EdgeInsets.symmetric(horizontal: 78.w),
                    buttonStyle: cardCount == 0
                        ? CustomButtonStyles.fillDeepOrange
                        : CustomButtonStyles.fillWhiteA,
                    buttonTextStyle: cardCount == 0
                        ? CustomTextStyles.bodyLargeDeeporange300
                        : theme.textTheme.bodyLarge,
                  ),
                  SizedBox(
                      height: isTablet
                          ? 24.w
                          : 20.w), // Adjusted spacing to match menu button area
                  Text(
                    "Valor total",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 2.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<HomeScreenBloc>()
                              .add(ToggleBalanceVisibilityEvent());
                        },
                        child: CustomImageView(
                          imagePath: isBalanceVisible
                              ? ImageConstant.view
                              : ImageConstant.viewOff,
                          color: Colors.white,
                          height: 24.w,
                          width: 24.w,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        isBalanceVisible
                            ? "${totalBalance.toStringAsFixed(2)} Kz"
                            : " ************",
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovimentacoesSection(
      BuildContext context, HomeScreenState state, bool isTablet) {
    return Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Movimentações".toUpperCase(),
                  style: CustomTextStyles.titleSmallInterBluegray900SemiBold,
                ),
                _AnimatedIconButton(
                  icon: ImageConstant.filter,
                  height: 40.w,
                  width: 40.w,
                  onTap: () {},
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
        ...groupedTransactions.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateSection(_formatDate(entry.key)),
              SizedBox(height: isTablet ? 16.w : 12.w),
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
          onPressed: () {
            context.read<HomeScreenBloc>().add(LoadMoreTransactionsEvent());
          },
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
                  style: CustomTextStyles.titleMediumPoppinsBlack90001,
                ),
                Text(
                  transaction.description,
                  style: CustomTextStyles.labelLargeGray90001,
                ),
              ],
            ),
          ),
          _AnimatedIconButton(
            icon: ImageConstant.arrowRight,
            height: isTablet ? 40.w : 26.w, // Increased from 32.w
            width: isTablet ? 40.w : 26.w, // Increased from 32.w
            onTap: () {
              _navigateToTransactionDetails(context, transaction);
            },
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
              "Sem movimentações para mostrar",
              style: CustomTextStyles.titleMediumBluegray900,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                "Registre um cartão e comece a ver seus movimentos",
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

  Map<DateTime, List<TransactionModel>> _groupTransactionsByDate(
      List<TransactionModel> transactions) {
    final map = <DateTime, List<TransactionModel>>{};
    for (var transaction in transactions) {
      final date = DateTime(
          transaction.date.year, transaction.date.month, transaction.date.day);
      map.putIfAbsent(date, () => []).add(transaction);
    }
    final sortedKeys = map.keys.toList()..sort((a, b) => b.compareTo(a));
    return Map.fromEntries(sortedKeys.map((key) => MapEntry(key, map[key]!)));
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    if (date == today) return "Hoje";
    if (date == yesterday) return "Ontem";
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }
}

// Animated Icon Button Widget
class _AnimatedIconButton extends StatefulWidget {
  final String icon;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final Color? iconColor;

  const _AnimatedIconButton({
    required this.icon,
    required this.height,
    required this.width,
    // ignore: unused_element_parameter
    this.borderColor,
    required this.onTap,
    // ignore: unused_element_parameter
    this.backgroundColor,
    this.iconColor,
  });

  @override
  State<_AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<_AnimatedIconButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => isPressed = true);
      },
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => isPressed = false);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        transform:
            isPressed ? (Matrix4.identity()..scale(0.9)) : Matrix4.identity(),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: widget.backgroundColor ?? appTheme.gray30003.withOpacity(1),
            borderRadius: BorderRadius.circular(widget.height / 2),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor!, width: 0.5.w)
                : null,
          ),
          padding: EdgeInsets.all(widget.height * 0.2),
          child: CustomImageView(
            imagePath: widget.icon,
            height: widget.height * 0.6,
            width: widget.width * 0.6,
            color: widget.iconColor ?? Colors.black,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
