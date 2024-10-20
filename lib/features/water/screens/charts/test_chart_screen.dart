import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gap/gap.dart';
import '../../../../core/core.dart';
import '../../water.dart';
import 'chart_factory.dart';

List<WaterLog> generateSampleWaterLogs() {
  final Random random = Random();
  final List<WaterLog> logs = [];

  DateTime startDate = DateTime(2024, 8, 12); // Monday 12 August 2024
  DateTime endDate = DateTime(2024, 8, 20); // Tuesday 20 August 2024

  for (DateTime date = startDate;
      date.isBefore(endDate);
      date = date.add(const Duration(days: 1))) {
    int logsPerDay = random.nextInt(5) + 3; // 3 to 8 logs

    for (int i = 0; i < logsPerDay; i++) {
      int hourOffset = random.nextInt(24); //Random hours int the day
      DateTime logTime = date.add(Duration(hours: hourOffset));

      int amountStep =
          random.nextInt(9) + 2; // 2 to 10 steps (200ml to 1000 ml)
      double amount = amountStep * 100;

      logs.add(WaterLog(
          timestamp: logTime, amount: amount, unit: Units.millilitres));
    }
  }

  //Sort logs by timestamp
  logs.sort((a, b) => a.timestamp.compareTo(b.timestamp));

  return logs;
}

final List<WaterLog> sampleLogs = generateSampleWaterLogs();

class TestWaterChartScreen extends StatelessWidget {
  const TestWaterChartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Intake Charts')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(kPadding32),
              AspectRatio(
                aspectRatio: 2,
                child: ChartFactory.createChart(
                  type: ChartType.line,
                  data: sampleLogs
                      .filter((element) =>
                          element.timestamp.isAfter(DateTime(2024, 08, 19)) &&
                          element.timestamp.isBefore(DateTime(2024, 08, 20)))
                      .toList(),
                ),
              ),
              const Gap(kPadding32),
              AspectRatio(
                aspectRatio: 2,
                child: ChartFactory.createChart(
                  type: ChartType.cumulativeLine,
                  data: sampleLogs
                      .filter((element) =>
                          element.timestamp.isAfter(DateTime(2024, 08, 18)) &&
                          element.timestamp.isBefore(DateTime(2024, 08, 19)))
                      .toList(),
                ),
              ),
              const Gap(kPadding32),
              AspectRatio(
                aspectRatio: 2,
                child: ChartFactory.createChart(
                  type: ChartType.bar,
                  data: sampleLogs,
                ),
              ),
              const Gap(kPadding32),
            ],
          ),
        ),
      ),
    );
  }
}
