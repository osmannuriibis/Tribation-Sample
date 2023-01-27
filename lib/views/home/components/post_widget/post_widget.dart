import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tribation_task/models/post_model.dart';
import 'package:tribation_task/models/user_model.dart';

import '../../../../src/icons/my_icons.dart';
import '../../../../src/widgets/core/hint_text.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel postModel;
  final UserModel userModel;
  const PostCardWidget({super.key, required this.postModel, required this.userModel});

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundImage: userModel.photoUrl != null
                            ? Image.network(userModel.photoUrl!).image
                            : null,
                        backgroundColor: Colors.white,
                        radius: 15),
                  ),
                  Text(
                    userModel.name ?? "",
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
              ),
              //LIKE and COMMENT buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const MyIcon(
                            MyIcons.like,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const MyIcon(
                            MyIcons.comment,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const MyIcon(
                            MyIcons.navigation,
                          ))
                    ],
                  ),
                  if (userModel.company?.name != null)
                    Row(
                      children: [
                        Text(userModel.company!.name!),
                        const Icon(Icons.sports_motorsports_outlined)
                      ],
                    )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Likes Counts
                    Text(
                      "${Random().nextInt(50) + 1} Beğenme",
                    ),
                    const SizedBox(height: 5),
                    //CONTENT

                    Text.rich(
                      TextSpan(
                          text: userModel.name?.trim() ?? "",
                          style:
                              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  "  ${postModel.title ?? ""}\n${postModel.body ?? ""}\n\n#tribation",
                              style: const TextStyle(fontWeight: FontWeight.normal),
                            )
                          ]),
                    ),
                    //Comments Count
                    const SizedBox(height: 5),
                    HintText("${Random().nextInt(20) + 1} Yorumu gör"),

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
                            icon: MyIcon(
                              MyIcons.sendThin,
                              color: Colors.orange.shade600,
                            ))
                      ],
                    ),
                    Text(
                      "${Random().nextInt(14) + 1} ay önce",
                      style: const TextStyle(color: Colors.black38),
                    )
                  ],
                ),
              ),
            ],
          ),

          ///Post menu
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
