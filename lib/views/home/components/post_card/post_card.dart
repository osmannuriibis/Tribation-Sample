import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../src/widgets/core/hint_text.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //var model = service.model;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //TITLE
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  //AVATAR
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(backgroundColor: Colors.white, radius: 15),
                  ),
                  Text(
                    "durukanarslan",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              //IMAGE

              Image.asset(
                "assets/images/events/event${Random().nextInt(6) + 1}.jpg",
                fit: BoxFit.contain,
              ), //LIKE and COMMENT buttons
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.heart_broken_outlined,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment_outlined,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 8),
                    child: IconButton(
                        onPressed: () {},
                        icon: const RotationTransition(
                          turns: AlwaysStoppedAnimation(315 / 360),
                          child: Icon(
                            Icons.send_rounded,
                          ),
                        )),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    // Likes Counts
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${Random().nextInt(50) + 1} Beğenme",
                        style: const TextStyle(fontVariations: [FontVariation("wght", 190000000)]),
                      ),
                    ),
                    //CONTENT
                    RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text: "durukanarslan",
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  "  It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English\n\n#tribation",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            )
                          ]),
                    ),
                    //Comments Count
                    const SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: HintText("${Random().nextInt(20) + 1} Yorumu gör")),

                    //Add Comment
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: .1)),
                          child: const CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Yorum Ekle",
                                hintStyle: TextStyle(color: Colors.black38)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send_rounded,
                              color: Colors.orange.shade600,
                            ))
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${Random().nextInt(14) + 1} ay önce",
                          style: const TextStyle(color: Colors.black38),
                        ))
                  ],
                ),
              ),
            ],
          ),

          ///Etkinlik ÜÇ NOKTA
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
                padding: EdgeInsets.zero,
                splashRadius: 15,
              )),
        ],
      ),
    );
  }
}
