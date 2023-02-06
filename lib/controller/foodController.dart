import 'package:get/get.dart';

class FoodController extends GetxController {
  var count = 0.obs;
  increment(int total, int price) {
    count.value++;
    total = total + price;
  }
}
