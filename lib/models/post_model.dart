import 'package:tribation_task/models/base_model.dart';

class PostModel extends BaseModel {
  int? userId;

  String? title;
  String? body;

  PostModel({this.userId, String? id, this.title, this.body}) {
    super.id = id;
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
