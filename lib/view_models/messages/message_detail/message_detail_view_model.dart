import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribation_task/models/user_model.dart';
import 'package:tribation_task/service/web_socket/web_socket_service.dart';
import 'package:tribation_task/utils/print.dart';
import 'package:web_socket_channel/io.dart';

class MessageDetailViewModel extends GetxController {
  late IOWebSocketChannel channel;

  var controllerText = TextEditingController().obs;
  var listMessage = <Map<String, dynamic>>[].obs;
  var isControllerEmpty = true.obs;

  UserModel userModel;

  MessageDetailViewModel(this.userModel);

  @override
  void onInit() {
    connection();

    super.onInit();
  }

  void connection() {
    channel = WebSocketService().connect();
    channel.ready.then((value) {
      setStreams();
    });
  }

  void setStreams() {
    channel.stream.listen((event) {
      bas("event");
      bas(event);
      if ((event as String).contains('[first')) return;
      listMessage.add({
        "id": "uniqeId",
        "text": event.toString().trim(),
        "time": DateTime.now(),
        "sent": false
      });
      update();
    });
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }

  void sendText() {
    if (controllerText.value.text.trim().isNotEmpty) {
      channel.sink.add(
        controllerText.value.text.toString().trim(),
      );

      controllerText.value.clear();
      isControllerEmpty.value = true;
    }
  }

  void onChange(String value) {
    if (value.isEmpty && !isControllerEmpty.value) {
      isControllerEmpty.value = true;
      update();
      return;
    }
    if (value.isNotEmpty && isControllerEmpty.value) {
      isControllerEmpty.value = false;
      update();
      return;
    }
  }
}

class MessageDetailBinding extends Bindings {
  UserModel args;

  MessageDetailBinding(this.args);
  @override
  void dependencies() {
    Get.put<MessageDetailViewModel>(MessageDetailViewModel(args));
  }
}
