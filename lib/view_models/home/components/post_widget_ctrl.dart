import 'package:get/get.dart';
import 'package:tribation_task/models/post_model.dart';
import 'package:tribation_task/models/user_model.dart';

class PostCardWidgetController extends GetxController {
  PostModel postModel;
  UserModel userModel;

  PostCardWidgetController(this.postModel,this.userModel);
}
