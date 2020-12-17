import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Panel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return  Container(
      height: he,
      width: wi,
      child: Stack(
        children: [
          Container(
            color: Color(0xff7c959c),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: he * .54,
                decoration: BoxDecoration(
                  color:  Colors.white30,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(wi * .1),
                      topLeft: Radius.circular(wi * .1)),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
