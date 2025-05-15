import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/wundu/bloc/wundu_bloc.dart';

class WunduScreen extends StatelessWidget {
  const WunduScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<WunduBloc>(
      create: (context) =>
          WunduBloc(WunduInitialState())..add(WunduInitialEvent()),
      child: const WunduScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));

    return BlocBuilder<WunduBloc, WunduState>(
      builder: (context, state) {
        final categoryTotals = state.wunduModelObj?.categoryTotals ?? {};
        final topCategory = state.wunduModelObj?.topCategory;
        final topCategoryAmount = state.wunduModelObj?.topCategoryAmount;

        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (topCategory != null && topCategoryAmount != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.w),
                      child: Text(
                        "Categoria que mais gasta: $topCategory (${topCategoryAmount.toStringAsFixed(2)} Kz)",
                        style: CustomTextStyles.titleMediumBluegray900SemiBold,
                      ),
                    ),
                  SizedBox(height: 32.w),
                  _buildPieChart(categoryTotals),
                  SizedBox(height: 32.w),
                  _buildBarChart(categoryTotals),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPieChart(Map<String, double> categoryTotals) {
    return Container(
      height: 220.w,
      decoration: AppDecoration.fillwhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5001,
            spreadRadius: 2.w,
            blurRadius: 4.w,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: PieChart(
        PieChartData(
          sections: categoryTotals.entries.map((entry) {
            final index = categoryTotals.keys.toList().indexOf(entry.key);
            return PieChartSectionData(
              color: _getColor(index),
              value: entry.value,
              title: "${entry.key}\n${entry.value.toStringAsFixed(2)} Kz",
              radius: 60.w,
              titleStyle: CustomTextStyles.labelLargeWhiteA700.copyWith(
                fontSize: 12.fSize, // Reduced size to prevent overlap
                fontWeight: FontWeight.bold,
              ),
              titlePositionPercentageOffset: 0.55, // Adjust position of title
              // Removed badgeWidget to eliminate rectangles
            );
          }).toList(),
          sectionsSpace: 4,
          centerSpaceRadius: 50.w,
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  Widget _buildBarChart(Map<String, double> categoryTotals) {
    return Container(
      height: 320.w,
      decoration: AppDecoration.fillwhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
        boxShadow: [
          BoxShadow(
            color: appTheme.gray5001,
            spreadRadius: 2.w,
            blurRadius: 4.w,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: categoryTotals.entries.map((entry) {
            final index = categoryTotals.keys.toList().indexOf(entry.key);
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  color: _getColor(index),
                  width: 24.w,
                  borderRadius: BorderRadius.circular(4.w),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: categoryTotals.values.reduce((a, b) => a > b ? a : b) *
                        1.2,
                    color: appTheme.gray300.withValues(alpha: 51),
                  ),
                ),
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.w,
                getTitlesWidget: (value, meta) {
                  final category = categoryTotals.keys.elementAt(value.toInt());
                  return Padding(
                    padding: EdgeInsets.only(top: 8.w),
                    child: Text(
                      category,
                      style: CustomTextStyles.titleSmallBlack90001.copyWith(
                        fontSize: 12.fSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50.w,
                getTitlesWidget: (value, meta) => Text(
                  "${value.toInt()} Kz",
                  style: CustomTextStyles.bodySmallBlack90001,
                ),
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => FlLine(
              color: appTheme.gray300.withValues(alpha: 128),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    final colors = [
      appTheme.blueA400,
      appTheme.redA200,
      appTheme.green100,
      appTheme.yellowA700,
      appTheme.indigoA200,
      appTheme.teal300,
    ];
    return colors[index % colors.length];
  }
}
