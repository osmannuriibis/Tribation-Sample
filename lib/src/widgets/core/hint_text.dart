import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HintText extends StatelessWidget {
  final String data;
  
  final Color? color;

  const HintText(this.data, {super.key, this.color });

  @override
  Widget build(BuildContext context) {
    return Text(data,style: TextStyle(color: color ?? Colors.black38,
    
    ),);
  }
}