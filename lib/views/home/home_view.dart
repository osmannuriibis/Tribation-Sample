import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tribation_task/views/home/components/post_card/post_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tribation",
          style: TextStyle(fontFamily: "Arista", color: Colors.orange.shade600),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.message),
          ),
          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.bell))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            PostCardWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedIconTheme: const IconThemeData(shadows: [Shadow(color: Colors.purple)]),
          fixedColor: Colors.orange.shade600,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Akış"),
            BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Keşfet"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Oluştur"),
            BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: "Takım"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
          ]),
    );
  }
}
