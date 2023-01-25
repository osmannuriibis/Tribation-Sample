import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HintText extends StatelessWidget {
  final String data;

  const HintText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(color: Colors.black38,
    
    ),);
  }
}