import 'package:get/get.dart';

/// this is the Getx package
class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

// 3.72 is our scale factor for streching screen views and making it dynamic scaling
  static double pageViewContainer = screenHeight / 3.72;
  static double pageViewTextContainer = screenHeight / 7.03;
}
