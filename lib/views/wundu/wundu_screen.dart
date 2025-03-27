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

        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
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
    return SizedBox(
      height: 200.w,
      child: PieChart(
        PieChartData(
          sections: categoryTotals.entries.map((entry) {
            final index = categoryTotals.keys.toList().indexOf(entry.key);
            return PieChartSectionData(
              color: _getColor(index),
              value: entry.value,
              title: "${entry.key}\n${entry.value.toStringAsFixed(2)}Kz",
              radius: 50.w,
              titleStyle: TextStyle(fontSize: 12.fSize, color: Colors.white),
            );
          }).toList(),
          sectionsSpace: 2,
          centerSpaceRadius: 40.w,
        ),
      ),
    );
  }

  Widget _buildBarChart(Map<String, double> categoryTotals) {
    return SizedBox(
      height: 300.w,
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
                  width: 20.w,
                ),
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final category = categoryTotals.keys.elementAt(value.toInt());
                  return Text(category, style: TextStyle(fontSize: 12.fSize));
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40.w),
            ),
          ),
        ),
      ),
    );
  }

  Color _getColor(int index) {
    const colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
    ];
    return colors[index % colors.length];
  }
}
