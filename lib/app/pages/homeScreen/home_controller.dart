import 'package:krishna_ornaments/app/app.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  int itemCounter = 0;

  onIncrement() {
    itemCounter++;
    update();
  }

  onDecrement() {
    if (itemCounter > 0) {
      itemCounter--;
    }
    update();
  }
}
