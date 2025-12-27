import 'package:get/get.dart';

class MoodController extends GetxController {
  final sliderValue = 50.0.obs;

  String get moodLabel {
    if (sliderValue.value < 25) return "Calm";
    if (sliderValue.value < 50) return "Content";
    if (sliderValue.value < 75) return "Peaceful";
    return "Happy";
  }

  String get moodImageAsset {
    if (sliderValue.value < 25) return "assets/images/calm-pic.png";
    if (sliderValue.value < 50) return "assets/images/content-pic.png";
    if (sliderValue.value < 75) return "assets/images/peaceful-pic.png";
    return "assets/images/happy-pic.png";
  }

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }
}
