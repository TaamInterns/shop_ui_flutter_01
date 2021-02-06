

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shop_ui/mainScreen.dart';

class intro extends StatefulWidget {
  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {

    // size of device
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    final TextStyle style1 = TextStyle(fontSize: wi*.065,fontWeight: FontWeight.w600,fontFamily: "leyla");
   // final TextStyle style2 = TextStyle(fontSize: wi*.065,fontWeight: FontWeight.w600,fontFamily: "danstevis");
    final TextStyle style3 = TextStyle(fontSize: wi*.065,fontWeight: FontWeight.w600,fontFamily: "iransans");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width:wi ,
        height: he,
        child: IntroViewsFlutter(
         [
           PageViewModel(
             bubbleBackgroundColor: Colors.white,
               title: Text(" !! سوغاتی"),
               body: Container(
           child: Container(
             child: Text("سوغاتي هاي متنوع از تمامي استان ها",style: style3,),
           ),
               ),
               mainImage: Icon(Icons.card_giftcard,size: wi*.5,color: Colors.white),
               pageColor: Colors.purple[300]
           ),

           PageViewModel(
             bubbleBackgroundColor: Colors.white70,
               title: Text(" !! ارسال رايگان"),
               body: Container(
                 child: Container(
                   child: Text("ارسال  سريع و رايگان به تمام نقاط كشور",style: style1,),
                 ),

               ),
               mainImage: Icon(Icons.airport_shuttle_outlined,size: wi*.5,color: Colors.white),
               pageColor: Colors.pinkAccent
           ),

           PageViewModel(
               title: Text("!!خريد آسان "),
               body: Container(
                  child: Text("!!خريد راحت و بدون شلوغي در منزل ",style: style3,),
               ),

               pageColor: Colors.teal,
             mainImage: Icon(Icons.add_shopping_cart,size: wi*.5,color: Colors.white,)
           ),
         ],
          doneText: Text("تمام") ,

          onTapDoneButton: (){
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>MyHomePage()));
          },

        ),
      ),
    );
  }
}
