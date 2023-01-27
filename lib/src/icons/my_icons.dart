import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final MyIcons icon;

  final Color? color;
  final double? size;

  const MyIcon(this.icon, {super.key, this.color, this.size = 22});

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(icon.src),
      color: color,
      size: size,
    );
  }
}

enum MyIcons {
  message("assets/icon_set/message.png"),
  add("assets/icon_set/add.png"),
  attach("assets/icon_set/attach.png"),
  bell("assets/icon_set/bell.png"),
  comment("assets/icon_set/comment.png"),
  create("assets/icon_set/create.png"),
  heart("assets/icon_set/heart.png"),
  home("assets/icon_set/home.png"),
  like("assets/icon_set/like.png"),
  mic("assets/icon_set/mic.png"),
  navigation("assets/icon_set/navigation.png"),
  paperPlane("assets/icon_set/paper-plane.png"),
  people("assets/icon_set/people.png"),
  plus("assets/icon_set/plus.png"),
  search("assets/icon_set/search.png"),
  sendSolid("assets/icon_set/send_solid.png"),
  send2d("assets/icon_set/send_2d.png"),
  sendThin("assets/icon_set/send_thin.png"),
  user("assets/icon_set/user.png"),
  ;

  const MyIcons(this.src);
  final String src;
}
