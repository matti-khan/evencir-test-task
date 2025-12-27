import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../utils/app_colors.dart';
import 'package:test_task/core/components/custom_strip_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SvgPicture.asset(
            "assets/icons/notification-bell.svg",
            width: 10,
          ),
        ),
        leadingWidth: 44,
        centerTitle: true,
        title: GestureDetector(
          onTap: () => controller.openDateSelector(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset("assets/icons/week-icon.svg"),
              const SizedBox(width: 8),
              Obx(
                    () => Text(
                  controller.weekTrackerText,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down_rounded,
                size: 32,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        actions: const [
          SizedBox(width: 44),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                    () => Text(
                  controller.formattedHeaderDate,
                  style: context.textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 30),
              _buildDateStrip(context),
              const SizedBox(height: 30),
              _buildWorkoutsHeader(context),
              const SizedBox(height: 20),
              _buildWorkoutCard(context),
              const SizedBox(height: 30),
              Text("My Insights", style: context.textTheme.headlineMedium),
              const SizedBox(height: 20),
              _buildInsightsRow(context),
              const SizedBox(height: 20),
              _buildHydrationCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateStrip(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(() {
        final weekDates = controller.currentWeek;
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: weekDates.length,
          separatorBuilder: (_, __) => const SizedBox(width: 15),
          itemBuilder: (context, index) {
            final date = weekDates[index];
            final isSelected = controller.isDateSelected(date);
            final displayDayName = controller.getDayNameAbbreviation(date);

            return GestureDetector(
              onTap: () => controller.selectedDate.value = date,
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      displayDayName,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: context.theme.cardTheme.color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? context.theme.colorScheme.primary
                              : Colors.transparent,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        date.day.toString(),
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (isSelected)
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: context.theme.colorScheme.primary,
                      )
                    else
                      const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildWorkoutCard(BuildContext context) {
    return CustomStripCard(
      leadingColor: AppColors.accentBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "December 22 - 25m - 30m",
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Text("Upper Body", style: context.textTheme.headlineMedium),
            ],
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: context.theme.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsRow(BuildContext context) {
    const double progressValue = 550 / 2500;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 160,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.theme.cardTheme.color ?? const Color(0xFF18181C),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "550",
                      style: context.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Calories",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "1950 Remaining",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "2500",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 6,
                    width: double.infinity,
                    color: Colors.grey.withValues(alpha: 0.2),
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          widthFactor: progressValue.clamp(0.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7BBDE2),
                                  Color(0xFF69C0B1),
                                  Color(0xFF60C198),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Container(
            height: 160,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.theme.cardTheme.color ?? const Color(0xFF18181C),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "75",
                      style: context.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "kg",
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_outward_rounded,
                        color: Colors.green,
                        size: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "+1.6kg",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "Weight",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHydrationCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.cardTheme.color ?? const Color(0xFF18181C),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0%",
                          style: context.textTheme.displayLarge?.copyWith(
                            color: const Color(0xFF48A4E5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "Hydration",
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Log Now",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              child: Text(
                                "2 L",
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 16,
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFF48A4E5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Column(
                              children: [
                                for (int i = 0; i < 9; i++)
                                  i == 4
                                      ? Container(
                                    width: 16,
                                    height: 6,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF48A4E5),
                                      borderRadius:
                                      BorderRadius.circular(3),
                                    ),
                                  )
                                      : Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    width: 4,
                                    height: 2,
                                    color: const Color(0xFF2C3E50),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              child: Text(
                                "0 L",
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 16,
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFF48A4E5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                color: Colors.white12,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: Text(
                                "0ml",
                                style:
                                context.textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: const Color(0xFF1B3D45),
              alignment: Alignment.center,
              child: Text(
                "500 ml added to water log",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutsHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Workouts",
          style: context.textTheme.headlineMedium,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Transform.rotate(
                angle: 12,
                child: Icon(
                  controller.isDayTime
                      ? Icons.wb_sunny_rounded
                      : Icons.nightlight_outlined,
                  color: context.theme.colorScheme.onSurface,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              "9°",
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}