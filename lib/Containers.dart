import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cont extends StatelessWidget {
   Cont({super.key,required this.color,required this.tcolor,required this.txt,required this.btap});
  final color;
  final tcolor;
  final String txt;
  final btap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(child: Text(txt,style: TextStyle(color: tcolor,fontSize: 20),)),
          ),
        ),
      ),
    );
  }
}
