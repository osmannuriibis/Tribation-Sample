import 'dart:convert';
import 'dart:math';

import 'package:tribation_task/models/base_model.dart';
import 'package:tribation_task/models/post_model.dart';
import 'package:tribation_task/models/user_model.dart';
import 'package:tribation_task/service/http/http_service.dart';

class ModelService {
  final userPath = "users";
  final postPath = "posts";

  final decoder = const JsonDecoder();

  Future<List<UserModel>?> getUsers() => _getModelList<UserModel>();
  Future<List<PostModel>?> getPosts() => _getModelList<PostModel>();

  Future<List<T>?> _getModelList<T extends BaseModel>() async => HttpService()
      .get(_modelPath<T>())
      .then<List<T>?>((value) async => ((await const JsonDecoder().convert(value.body)) as List)
          .map((e) => Mapper.fromJson<T>(e))
          .toList())
      .onError((error, stackTrace) => null);

  Future<UserModel?> getUser(id) async {
    var user = await _getModel<UserModel>(id);
    
    //////Out Of Service Implemetation
    if (user != null) {
      user.photoUrl = Random().nextBool()
          ? "https://randomuser.me/api/portraits/men/${(Random().nextInt(98) + 1).toString()}.jpg"
          : "https://randomuser.me/api/portraits/women/${(Random().nextInt(98) + 1).toString()}.jpg";
    ////////
    
      return user;
    }
    return null;
  }

  Future<PostModel?> getPost(id) => _getModel<PostModel>(id);

  Future<T?> _getModel<T>(id) async => HttpService()
      .get("${_modelPath<T>()}/$id")
      .then<T?>((value) async => Mapper.fromJson<T>(decoder.convert(value.body)))
      .onError((error, stackTrace) => null);

  String _modelPath<T>() {
    if (T == UserModel) {
      return userPath;
    } else if (T == PostModel) {
      return postPath;
    }
    throw Exception("Type doesn't exist");
  }
}

class Mapper {
  static T fromJson<T>(Map<String, dynamic>? json) {
    assert(json != null);
    json ??= {};
    if (T == UserModel) {
      return UserModel.fromJson(json) as T;
    } else if (T == PostModel) {
      return PostModel.fromJson(json) as T;
    } else {
      throw Exception("$T type no exists in Mapper");
    }
  }
}
