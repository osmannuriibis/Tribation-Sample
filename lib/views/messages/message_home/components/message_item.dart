import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribation_task/models/user_model.dart';
import 'package:tribation_task/view_models/messages/message_detail/message_detail_view_model.dart';
import 'package:tribation_task/views/messages/message_detail/message_detail_view.dart';

import '../../../../src/widgets/core/hint_text.dart';

class MessageItem extends StatelessWidget {
  final Map<String, String> textModel;

  const MessageItem(this.textModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const MessageDetailView(), binding: MessageDetailBinding(
          UserModel(
            name: textModel['adi'],
            
          )
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100), border: Border.all(width: .2)),
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            textModel['adi'] ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: HintText(
                          textModel['text'] ?? "",
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: HintText(
                    "${Random().nextInt(59) + 1}dakika önce",
                    color: Colors.black54,
                  ),
                )
              ],
            ),
            const Divider(
              indent: 75,
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}
