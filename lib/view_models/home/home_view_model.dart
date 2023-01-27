import 'dart:developer';

import 'package:get/get.dart';
import 'package:tribation_task/models/post_model.dart';

import '../../service/model/model_service.dart';

class HomeViewModel extends GetxController {
  var tabIndex = 0.obs;

  void changingTabIndex(int index) {
    tabIndex.value = index;
  }
}
