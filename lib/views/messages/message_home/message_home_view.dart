import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribation_task/src/icons/my_icons.dart';
import 'package:tribation_task/view_models/messages/message_detail/message_detail_view_model.dart';
import 'package:tribation_task/views/messages/message_home/components/message_item.dart';

class MessageHomeView extends StatelessWidget {
  const MessageHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      {"adi": "Ahmet", "text": "En kısa zamanda görüşelim"},
      {"adi": "Osman", "text": "Maç ne zaman?"},
      {"adi": "Mehmet", "text": "Evet, doğru!"},
      {"adi": "Veli", "text": "Bilemiyorum..."},
    ];
    
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mesaj",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.black,
          elevation: 1,
          actions: [IconButton(onPressed: () {}, icon: const MyIcon(MyIcons.plus))],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight * 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Builder(builder: (context) {
                  var border = const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  );
                  return SizedBox(
                    height: kToolbarHeight * .6,
                    child: TextField(
                      style: const TextStyle(fontSize: 13),
                      cursorHeight: 12,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        focusedBorder: border,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 19,
                          color: Colors.black,
                        ),
                        hintText: "Ara",
                        hintStyle: const TextStyle(fontSize: 13),
                        border: border,
                        enabledBorder: border,
                        disabledBorder: border,
                      ),
                    ),
                  );
                }),
              )),
        ),
        body: ListView.builder(
          physics: const ScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            var e = list[index];
            return MessageItem(e);
          },
        ));
  }
}
