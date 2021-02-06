import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shop_ui/introapp.dart';
import 'package:shop_ui/panel.dart';
import 'package:shop_ui/profile.dart';

import 'iteminfo.dart';
import 'iteminfo2.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),));
}

class Splash extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        Duration(seconds: 3)).then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c)=>intro())));
  }

  @override
  Widget build(BuildContext context) {

    // size of device
     var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;


    return Scaffold(

     // debugShowCheckedModeBanner: false,
      body: Container(
        width: wi,
        height: he,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.purple,
              Colors.deepOrangeAccent,
              Colors.red,

            ],
            begin: Alignment.topLeft,
            end:  Alignment.bottomRight,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(alignment: Alignment.topCenter,
              child:Container(
                //margin: EdgeInsets.only(top:wi*.2),
                child:Stack(children: [

                 Icon(Icons.shopping_cart,size: wi*.5,color: Colors.white,),
                  Positioned(
                    top: -15,
                      right: 1,
                      child: Container(
                    child: Center(child: Text("OFF !!",style: TextStyle(color: Colors.white,fontSize: wi*.05),),),
                    width: wi*.2,
                    height: wi*.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(wi*5),
                      color: Colors.red,

                    ),

                  ))
                ],),
              ),
            ),

            Align(alignment: Alignment.bottomCenter,
              child:Container(

                child: Text("ShopKala (:",style: TextStyle(color: Colors.white,fontSize: wi*.15,fontWeight: FontWeight.w900)),
              ),
            ),
          ],
        )


      ),

    );
  }
}



