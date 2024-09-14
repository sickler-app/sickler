import 'package:flutter/cupertino.dart';
import 'package:sickler/screens/water/charts/bar_chart_widget.dart';
import 'package:sickler/screens/water/charts/chart_data_transformer.dart';
import 'package:sickler/screens/water/charts/line_chart_widget.dart';

import '../../../models/water/water_log.dart';

enum ChartType { line, bar, cumulativeLine }

class ChartFactory {
  static Widget createChart({
    required ChartType type,
    required List<WaterLog> data,
    Color? barColor,
    double? barWidth,
  }) {
    switch (type) {
      case ChartType.line:
        final spots =
            ChartDataTransformer.transformForDailyTrend(data, windowSize: 5);
        return LineChartWidget(
          spots: spots,
        );

      case ChartType.cumulativeLine:
        final spots =
            ChartDataTransformer.transformForCumulativeDailyTrend(data);
        return LineChartWidget(
          spots: spots,
        );

      case ChartType.bar:
        final barGroups = ChartDataTransformer.transformForWeeklyTotals(
            logs: data, barColor: barColor, barWidth: barWidth);
        return BarChartWidget(
          timeScale: ChartTimeScale.week,
          barGroups: barGroups,
        );
    }
  }
}
