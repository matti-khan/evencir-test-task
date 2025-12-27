import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../controllers/mood_controller.dart';

class MoodScreen extends StatelessWidget {
  final MoodController controller = Get.put(MoodController());

  MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -150,
          left: 50,
          right: 50,
          height: 150,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF83ABF6),
                  blurRadius: 100,
                  spreadRadius: 0,
                  offset: Offset(0, 100),
                ),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Mood", style: context.textTheme.headlineMedium),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  _buildHeader(context),
                  const Spacer(),
                  _buildSlider(context),
                  const Spacer(),
                  _buildFooter(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Start your day", style: context.textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(
          "How are you feeling at the\nMoment?",
          style: context.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(BuildContext context) {
    const gradientColors = [
      Color(0xFF6DD5C3),
      Color(0xFF6DD5C3),
      Color(0xFFC3A5EC),
      Color(0xFFC3A5EC),
      Color(0xFFFF95AB),
      Color(0xFFFF95AB),
      Color(0xFFFFB386),
      Color(0xFFFFB386),
      Color(0xFF6DD5C3),
    ];

    return SizedBox(
      height: 350,
      width: 300,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const SweepGradient(
                colors: gradientColors,
                tileMode: TileMode.clamp,
                startAngle: 0.0,
                endAngle: 3.14 * 2,
                transform: GradientRotation(-3.14 / 3),
              ).createShader(bounds);
            },
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 20, color: Colors.white),
              ),
            ),
          ),
          Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: controller.sliderValue.value,
                  appearance: CircularSliderAppearance(
                    angleRange: 360,
                    startAngle: 270,
                    size: 250,
                    customWidths: CustomSliderWidths(
                      trackWidth: 20,
                      progressBarWidth: 20,
                      handlerSize: 22,
                      shadowWidth: 0,
                    ),
                    customColors: CustomSliderColors(
                      trackColor: Colors.transparent,
                      progressBarColor: Colors.transparent,
                      hideShadow: true,
                      dotColor: Colors.white,
                    ),
                  ),
                  onChange: controller.updateSliderValue,
                  innerWidget: (_) {
                    return Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            FadeTransition(opacity: animation, child: child),
                        child: Image.asset(
                          controller.moodImageAsset,
                          key: ValueKey<String>(controller.moodImageAsset),
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    controller.moodLabel,
                    key: ValueKey<String>(controller.moodLabel),
                    style: context.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 49),
          maximumSize: const Size(double.infinity, 60),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}