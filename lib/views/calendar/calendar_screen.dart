import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task/core/components/custom_strip_card.dart';


class CalendarScreen extends StatelessWidget {

  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Training Calendar",
          style: context.textTheme.headlineMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Save",
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(children: [Expanded(child: _buildScheduleList(context))]),
      ),
    );
  }


  final Widget divider = const Divider(
    color: Colors.white24,
    height: 0,
  );

  Widget _buildScheduleList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      children: [
        _buildWeekHeader(
            context,
            title: "Week 2/8",
            dateRange: "December 8-14",
            totalTime: "Total: 60min",
            color: const Color(0xFF4855DF)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              _buildDayRow(
                context,
                day: "Mon",
                date: "8",
                child: CustomStripCard(
                  leadingColor: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4.0, right: 12.0),
                        child: Icon(
                          Icons.drag_indicator_rounded,
                          color: Color(0xFF66667E),
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF20B76F)
                                    .withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/arms-workout-icon.svg",
                                      width: 12),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "Arms Workout",
                                    style: TextStyle(
                                      color: Color(0xFF20B76F),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Arm Blaster",
                                  style:
                                      context.textTheme.headlineSmall?.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "25m - 30m",
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              divider,
              _buildDayRow(context, day: "Tue", date: "9", child: null),
              divider,
              _buildDayRow(context, day: "Wed", date: "10", child: null),
              divider,
              _buildDayRow(
                context,
                day: "Thu",
                date: "11",
                child: CustomStripCard(
                  leadingColor: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4.0, right: 12.0),
                        child: Icon(
                          Icons.drag_indicator_rounded,
                          color: Color(0xFF66667E),
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4855DF)
                                    .withValues(alpha: 0.16),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/leg-workout-icon.svg",
                                      width: 12),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "Leg Workout",
                                    style: TextStyle(
                                      color: Color(0xFF4855DF),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Leg Day Blitz",
                                  style:
                                      context.textTheme.headlineSmall?.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "25m - 30m",
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              divider,
              _buildDayRow(context, day: "Fri", date: "12", child: null),
              divider,
              _buildDayRow(context, day: "Sat", date: "13", child: null),
              divider,
              _buildDayRow(context, day: "Sun", date: "14", child: null),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildWeekHeader(
            context,
            title: "Week 3/8",
            dateRange: "December 15-21",
            totalTime: "Total: 0min",
            color: const Color(0xFF18AA99)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _buildDayRow(context, day: "Mon", date: "15", child: null),
              divider,
              _buildDayRow(context, day: "Tue", date: "16", child: null),
              divider,
              _buildDayRow(context, day: "Wed", date: "17", child: null),
              divider,
              _buildDayRow(context, day: "Thu", date: "18", child: null),
              divider,
              _buildDayRow(context, day: "Fri", date: "19", child: null),
              divider,
              _buildDayRow(context, day: "Sat", date: "20", child: null),
              divider,
              _buildDayRow(context, day: "Sun", date: "21", child: null),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayRow(
    BuildContext context, {
    required String day,
    required String date,
    Widget? child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: child ?? const SizedBox(height: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekHeader(
    BuildContext context, {
    required String title,
    required String dateRange,
    required String totalTime,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 4,
          color: color,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          color: context.theme.cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateRange,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF66667E),
                    ),
                  ),
                  Text(
                    totalTime,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF66667E),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
