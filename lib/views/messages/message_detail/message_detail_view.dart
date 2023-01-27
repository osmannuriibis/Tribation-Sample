import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribation_task/src/icons/my_icons.dart';
import 'package:tribation_task/view_models/messages/message_detail/message_detail_view_model.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.find<MessageDetailViewModel>();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), border: Border.all(width: .2)),
              child: const CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                viewModel.userModel.name ?? "Hero without name",
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("Sil")),
                const PopupMenuItem(child: Text("Raporla")),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          const Divider(
            height: 2,
            thickness: 3,
            color: Colors.black,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: true,
            dragStartBehavior: DragStartBehavior.down,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Obx(() {
                  var messages = viewModel.listMessage.value;

                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: messages.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 0, bottom: 8),
                          child: Align(
                            alignment: (Alignment.topRight),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * .75,
                                minWidth: MediaQuery.of(context).size.width * .2,
                              ),
                              decoration: const BoxDecoration(),
                              child: Card(
                                /*   decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),*/
                                color: (const Color.fromARGB(255, 9, 6, 37)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    alignment: WrapAlignment.end,
                                    crossAxisAlignment: WrapCrossAlignment.end,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    direction: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          messages[index]['text'] ?? "",
                                          style: const TextStyle(color: Colors.white, fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            TimeOfDay.fromDateTime(messages[index]['time'])
                                                .format(context),
                                            style: Theme.of(context).textTheme.caption!.copyWith(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 2),
                                            child: Icon(
                                              Icons.done_all,
                                              color: Colors.blue,
                                              size: 13,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(height: 60)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 5),
                width: double.infinity,
                color: Colors.white,
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Builder(builder: (context) {
                          var border = const OutlineInputBorder(
                            borderSide: BorderSide(width: 0, color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          );
                          return TextField(
                            controller: viewModel.controllerText.value,
                            onChanged: viewModel.onChange,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade200,
                                filled: true,
                                focusedBorder: border,
                                contentPadding: const EdgeInsets.only(left: 15),
                                hintText: "Mesaj yaz...",
                                border: border,
                                enabledBorder: border,
                                disabledBorder: border,
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Get.bottomSheet(
                                          SizedBox(
                                            width: Get.width,
                                            height: kToolbarHeight * 2,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.image),
                                                  iconSize: 40,
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.picture_as_pdf),
                                                  iconSize: 40,
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.video_collection),
                                                  iconSize: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          backgroundColor: Colors.white,
                                        );
                                      },
                                      icon: const MyIcon(MyIcons.attach),
                                      color: Colors.black,
                                    ),
                                    Obx(() {
                                      viewModel.isControllerEmpty.value;
                                      return IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: viewModel.isControllerEmpty.value
                                            ? null
                                            : () {
                                                viewModel.sendText();
                                              },
                                        icon: const MyIcon(MyIcons.sendSolid),
                                      );
                                    })
                                  ],
                                )),
                          );
                        }),
                      ),
                      IconButton(
                        onPressed: () async {
                          Get.snackbar("Tapped the mic", "Speak now");
                        },
                        icon: const MyIcon(
                          MyIcons.mic,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ), /**/
      /*  ListView(children: [
        Column(
          children: [
            StreamBuilder<DuyuruService>(
                stream: viewModel.service.streamService,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const CircularProgressIndicator();
                  }
                  var service = snapshot.data!;
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Konu: " + (service.model.konu ?? "")),
                              Text("Mesaj: " + (service.model.mesaj ?? "")),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 10,
                          bottom: -20,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: kPrimaryColor.withOpacity(0.5),
                            child: const LikeButton(
                              size: 15,
                              likeCount: 0,
                            ),
                          ))
                    ],
                  );
                }),
          ],
        ),
      ]), */
    );
  }
}
