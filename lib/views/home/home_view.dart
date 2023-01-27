import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribation_task/src/icons/my_icons.dart';
import 'package:tribation_task/view_models/home/home_view_model.dart';
import 'package:tribation_task/views/discover/discover_view.dart';
import 'package:tribation_task/views/messages/message_home/message_home_view.dart';
import 'package:tribation_task/views/profile/profile_view.dart';
import 'package:tribation_task/views/team/team_view.dart';

import '../../view_models/flow/flow_view_model.dart';
import '../flow/flow_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.put(HomeViewModel());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tribation",
          style: TextStyle(fontFamily: "Arista", color: Colors.orange.shade600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const MessageHomeView(),
              );
            },
            icon: const MyIcon(MyIcons.message),
          ),
          IconButton(onPressed: () {}, icon: const MyIcon(MyIcons.bell))
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: viewModel.tabIndex.value,
          children: [
            GetBuilder<FlowViewModel>(
              init: FlowViewModel(),
              builder: (_) {
                return const FlowView();
              },
            ),
            const DiscoverView(),
            const SizedBox.shrink(),
            const TeamView(),
            const ProfileView()
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedIconTheme: const IconThemeData(shadows: [Shadow(color: Colors.purple)]),
              unselectedItemColor: const Color.fromARGB(255, 3, 18, 31),
              unselectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 3, 18, 31)),
              fixedColor: Colors.orange.shade600,
              onTap: (index) {
                if (index != 2) {
                  viewModel.changingTabIndex(index);
                } else {
                  Get.bottomSheet(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Column(mainAxisSize: MainAxisSize.min, children: [
                              ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [Text("Gönderi Oluştur")]),
                              ),
                              const Divider(),
                              ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [Text("Hikaye Oluştur")]),
                              ),
                              const Divider(),
                              ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [Text("Takım Kur")]),
                              ),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [Text("İptal")]),
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
              currentIndex: viewModel.tabIndex.value,
              items: const [
                BottomNavigationBarItem(icon: MyIcon(MyIcons.home), label: "Akış"),
                BottomNavigationBarItem(icon: MyIcon(MyIcons.search), label: "Keşfet"),
                BottomNavigationBarItem(icon: MyIcon(MyIcons.create), label: "Oluştur"),
                BottomNavigationBarItem(icon: MyIcon(MyIcons.people), label: "Takım"),
                BottomNavigationBarItem(icon: MyIcon(MyIcons.user), label: "Profil"),
              ])),
    );
  }
}
