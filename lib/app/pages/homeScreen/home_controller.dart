import 'package:flutter/widgets.dart';
import 'package:krishna_ornaments/app/app.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);

  final HomePresenter homePresenter;

  final pageController = PageController(
      viewportFraction: 0.8,
    );
}
