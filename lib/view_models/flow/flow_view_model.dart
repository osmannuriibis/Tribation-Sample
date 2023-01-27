import 'package:get/get.dart';

import '../../models/post_model.dart';
import '../../service/model/model_service.dart';

class FlowViewModel extends GetxController {
  @override
  void onInit() {
    fetchDatas();
    super.onInit();
  }

  var listPost = <PostModel>[].obs;

  Future<void> fetchDatas() async {
    listPost.value = (await ModelService().getPosts()) ?? [];
  }
}
