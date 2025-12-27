import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../core/colors/app_colors.dart';

class HomeController extends GetxController {
  final selectedDate = DateTime.now().obs;

  List<DateTime> get currentWeek {
    DateTime date = selectedDate.value;
    DateTime startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  String get formattedHeaderDate {
    DateTime now = DateTime.now();
    DateTime date = selectedDate.value;

    if (isSameDay(date, now)) {
      return "Today, ${DateFormat('d MMM y').format(date)}";
    } else if (isSameDay(date, now.subtract(const Duration(days: 1)))) {
      return "Yesterday, ${DateFormat('d MMM y').format(date)}";
    } else if (isSameDay(date, now.add(const Duration(days: 1)))) {
      return "Tomorrow, ${DateFormat('d MMM y').format(date)}";
    } else {
      return DateFormat('EEE, d MMM y').format(date);
    }
  }

  String get weekTrackerText {
    final date = selectedDate.value;
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    int firstDayOffset = firstDayOfMonth.weekday - 1;
    int currentWeek = ((date.day + firstDayOffset - 1) ~/ 7) + 1;
    int totalWeeks = ((lastDayOfMonth.day + firstDayOffset - 1) ~/ 7) + 1;

    return "Week $currentWeek/$totalWeeks";
  }

  bool get isDayTime {
    final int currentHour = DateTime.now().hour;
    return currentHour >= 6 && currentHour < 18;
  }

  bool isDateSelected(DateTime date) {
    return isSameDay(date, selectedDate.value);
  }

  String getDayNameAbbreviation(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'M';
      case 2:
        return 'TU';
      case 3:
        return 'W';
      case 4:
        return 'TH';
      case 5:
        return 'F';
      case 6:
        return 'SA';
      case 7:
        return 'SU';
      default:
        return '';
    }
  }

  void openDateSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.cardTheme.color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 400,
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: selectedDate.value,
          currentDay: DateTime.now(),
          selectedDayPredicate: (day) => isSameDay(selectedDate.value, day),
          calendarFormat: CalendarFormat.month,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: TextStyle(
              color: context.theme.colorScheme.onSurface,
              fontSize: 18,
            ),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: context.theme.colorScheme.onSurface,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: context.theme.colorScheme.onSurface,
            ),
          ),
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryAccent),
            ),
            todayDecoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle,
            ),
            defaultTextStyle: TextStyle(
              color: context.theme.colorScheme.onSurface,
            ),
            weekendTextStyle: TextStyle(
              color: context.theme.colorScheme.onSurface,
            ),
            weekNumberTextStyle: TextStyle(
              color: context.theme.colorScheme.onSurface,
            ),
            outsideTextStyle: const TextStyle(color: Colors.grey),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: context.theme.colorScheme.onSurface,
            ),
            weekendStyle: TextStyle(
              color: context.theme.colorScheme.onSurface,
            ),
          ),
          onDaySelected: (selected, focused) {
            selectedDate.value = selected;
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}