import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/control_panel/bloc/control_panel_bloc.dart';
import 'package:wundu/views/control_panel/models/control_panel_model.dart';

class ControlPanelScreen extends StatelessWidget {
  const ControlPanelScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ControlPanelBloc>(
      create: (context) => ControlPanelBloc(ControlPanelState(
        controlPanelModelObj: ControlPanelModel(),
      ))
        ..add(ControlPanelInitialEvent()),
      child: const ControlPanelScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBackButton(),
                const SizedBox(height: 16),
                buildExpenseCard(),
                const SizedBox(height: 20),
                buildExpenseGraph(),
                const SizedBox(height: 20),
                buildTimeFilterBar(),
                const SizedBox(height: 20),
                buildCategoriesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Back button row
  Widget buildBackButton() {
    return Row(
      children: [
        Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 24,
        ),
        const SizedBox(width: 8),
        Text(
          "Voltar",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Expense card with navigation buttons and amount
  Widget buildExpenseCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E1F45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.description, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.sync, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEBEB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.bar_chart, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E1F45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
          buildExpenseAmount(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Navy blue card with amount and navigation
  Widget buildExpenseAmount() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0E1F45),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF192B54),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Text(
                  "Todos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Gastos neste mês",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "100.000,00KZ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Monthly expense graph
  Widget buildExpenseGraph() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Despesas Mensais",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.1),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        );
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = 'Jan';
                            break;
                          case 1:
                            text = 'Fev';
                            break;
                          case 2:
                            text = 'Mar';
                            break;
                          case 3:
                            text = 'Abr';
                            break;
                          case 4:
                            text = 'Mai';
                            break;
                          case 5:
                            text = 'Jun';
                            break;
                          case 6:
                            text = 'Jul';
                            break;
                          case 7:
                            text = 'Ago';
                            break;
                          case 8:
                            text = 'Set';
                            break;
                          case 9:
                            text = 'Out';
                            break;
                          case 10:
                            text = 'Nov';
                            break;
                          case 11:
                            text = 'Dez';
                            break;
                          default:
                            text = '';
                        }
                        return Text(text, style: style);
                      },
                      reservedSize: 30,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 30),
                      FlSpot(1, 50),
                      FlSpot(2, 25),
                      FlSpot(3, 40),
                      FlSpot(4, 35),
                      FlSpot(5, 50),
                      FlSpot(6, 30),
                      FlSpot(7, 40),
                      FlSpot(8, 50),
                      FlSpot(9, 40),
                      FlSpot(10, 60),
                      FlSpot(11, 80),
                    ],
                    isCurved: true,
                    color: const Color(0xFFFE7062),
                    barWidth: 2,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: false,
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFFFE7062).withOpacity(0.1),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          return LineTooltipItem(
                            '${touchedSpot.y.toInt()}K',
                            const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          );
                        }).toList();
                      },
                      getTooltipColor: (LineBarSpot touchedSpot) =>
                          Colors.white),
                  handleBuiltInTouches: true,
                  getTouchedSpotIndicator: (barData, spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      return TouchedSpotIndicatorData(
                        FlLine(color: Colors.transparent),
                        FlDotData(
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 6,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: const Color(0xFFFE7062),
                            );
                          },
                        ),
                      );
                    }).toList();
                  },
                  touchCallback: (event, touchResponse) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Time period filter bar
  Widget buildTimeFilterBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                "1D",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                "1S",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF0E1F45),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                "1M",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                "6M",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                "1A",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Categories section with dropdown
  Widget buildCategoriesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Categorias",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          const SizedBox(height: 16),
          buildTransportCategory(),
          const Divider(height: 32),
          buildHealthCategory(),
          const Divider(height: 32),
          buildLaserCategory(),
        ],
      ),
    );
  }

  // Transport category item
  Widget buildTransportCategory() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF0E1F45),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "T",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tranporte",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "5 transações",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "KZ -11.000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "55%",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Health category item
  Widget buildHealthCategory() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFFDCF45),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "S",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saúde",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "2 transações",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "KZ -5.000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "25%",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Laser category item
  Widget buildLaserCategory() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF4CD97B),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "L",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Laser",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "4 transações",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "KZ -4.000",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "20%",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
