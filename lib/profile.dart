import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List images=[
    "images/1.png",
    "images/2.png",
    "images/3.png",
    "images/1.png",
  ];

  var coverpic="https://irantourismnews.com/wp-content/uploads/2016/09/Iran-and-Oman-launch-cruise-route.jpg";
  Color lightBackground = Color(0xff7c959c);
  PageController contol;
  var current = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contol=PageController(viewportFraction: .7);
    contol.addListener(() {
      var next =contol.page.round();
      if(current != next ){
        setState(() {
          current=next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    // size of device
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

      return Scaffold(

           body: SafeArea(
              child: Container(
                 height:he ,
                 width: wi,
                     child: Stack(
                        children: [

                        Align(alignment: Alignment.topCenter,
                         child:_pictureAndCoverText(wi,he),
                ), // pictureAndCoverText

                        Align(alignment: Alignment.topCenter,
                         child:_avatar(wi),
                ), //  avatar

                        Align(alignment: Alignment.topCenter,
                child:_infoPerson(wi) ,
                ), //infoPerson

                        Align(alignment: Alignment.topRight,
                  child:_iconSetting(wi) ,
                ), //iconSetting

                // centerText

                        Align(
                 alignment: Alignment.bottomCenter,
                 child:_pageViewPanel(wi,he),),  //pageViewPanel
              ],
            ),
          )),
    );
  }


//morteza roozbehi @mr_roz



  Widget _pageViewPanel(wi,he){
    return  Container(

      width: wi,
      height: he*.49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(wi*.1),topRight:Radius.circular(wi*.1) ),
        color: Colors.white,
      ),
      // color: Colors.white,
      child: PageView.builder(
        controller: contol,
        itemCount:images.length,
        itemBuilder: (c,i){
          bool active = i==current;
          return _pageview(wi,i,active);
        },
      ),

    );
  }



 Widget _centerText(wi){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))),
      height:wi*.12 ,
      margin: EdgeInsets.only(bottom: wi*.1),
      //color: Colors.deepOrangeAccent,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("${images.length} item",style: TextStyle(fontSize: wi*.04,fontWeight: FontWeight.w900,color: Colors.indigoAccent),),
          Text(":  سوابق خريد",style: TextStyle(fontSize: wi*.04,fontWeight: FontWeight.w900,color: Colors.red),),

        ],),
    );
 }




  Widget _iconSetting(wi){

    return GestureDetector(
      onTap: (){
        ///todo///////
        print("setting");},
      child: Container(
        margin: EdgeInsets.only(left: wi*.5,top: wi*.2,right: wi*.15),
        height:wi*.25 ,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.lightGreen,spreadRadius: 5,blurRadius: 10,offset: Offset(2, 3))],
            shape: BoxShape.circle),
        child: Icon(Icons.settings,size: wi*.1,color: Colors.white,),

      ),
    );
  }




  Widget _infoPerson(wi){

    final  _styleText =TextStyle(fontSize: wi*.04,fontWeight: FontWeight.w600,color: Colors.white);

    return Container(

      height:wi*.46 ,
      width: wi,
      // color: Colors.lightBlue,
      margin: EdgeInsets.only(top: wi*.51),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _aboutme(wi,Icons.mail_outline,"@mr_roz",_styleText),
          _aboutme(wi,Icons.person,"morteza",_styleText),
          _aboutme(wi,Icons.map_sharp,"iran-BND",_styleText),
          _aboutme(wi,Icons.email,"mr.roz16126@gmail.com",_styleText),

        ],
      ),
    );
  }




  Widget _avatar(wi){
    return Container(
      margin: EdgeInsets.all(wi*.1),
      height:wi*.25 ,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://instagram.fdoh5-3.fna.fbcdn.net/v/t51.2885-19/s320x320/79381815_459608301398231_8926442582402138112_n.jpg?_nc_ht=instagram.fdoh5-3.fna.fbcdn.net&_nc_ohc=S3HodvK1mU0AX__MnG_&tp=1&oh=874b31384ab8ffdbff7208007d86c888&oe=604525D8")
          ),
          boxShadow: [BoxShadow(color: Colors.blueGrey,spreadRadius: 2,blurRadius: 10,offset: Offset(2, 3))],
          color: Colors.lightBlue,
          shape: BoxShape.circle),

    );
  }




  Widget _pictureAndCoverText(wi,he){
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              fit: BoxFit.cover,
              image:NetworkImage("https://irantourismnews.com/wp-content/uploads/2016/09/Iran-and-Oman-launch-cruise-route.jpg")
          )
      ),
      // color: Colors.lightBlue,
      height: he*.53,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height:  wi*.45,
          color: Colors.black87.withOpacity(.6),),
      ),

    ) ;
  }




  Widget _aboutme( wi,IconData icon,String text,_styleText){
    //final IconData icon;

    //_aboutme(this.icon,this.text,this.wi,this._styleText);
    return Container(
      color: Colors.black26,
      margin: EdgeInsets.only(left: wi*.03 ),
      child: Row(children: [
        Icon(icon,color: Colors.white,size: wi*.05,),
        SizedBox(height: wi*.02,width: wi*.02,),
        Text(text,style: _styleText,)
      ],),
    );

  }




  Widget _pageview(wi,index,active){

    var top = active? wi*.05:wi*.1;
    var bottom =active? wi*.05:wi*.1;
    var right =active? wi*.05:wi*.1;
    var left =active? wi*.05:wi*.1;
    Color shadow =active?Colors.lightGreen.withOpacity(.9):Colors.teal.withOpacity(.2);

    var heImage=active?wi*.53 :wi*.24 ;
    var weImage=active? wi*.9:wi*.4;
    var circular =active?wi*.04:wi*.17;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(circular)),
        //  color: index.isEven?Colors.purple:Colors.lime,
          color: Colors.white,
        boxShadow: [BoxShadow(
           color:shadow,
          offset: Offset(1, -4),
          blurRadius: 10,
          spreadRadius: 3
        )]
      ),
      margin: EdgeInsets.only(top: top,bottom: bottom,right: right),
      child: Stack(children: [
        Align(alignment: Alignment.topCenter,
        child:AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.decelerate,
          margin: EdgeInsets.all(wi*.03),
          height:heImage,
          width: weImage,

          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(wi*.04)),
            image:DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(images[index])
            )
          ),
        ) ,
        ), //morteza roozbehi @mr_roz
        Align(alignment: Alignment.bottomCenter,
        child: Container(
          height: wi*.3,

          //color: Colors.lightGreen,
         // margin: EdgeInsets.all(wi*.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                padding: EdgeInsets.all(wi*.05),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("s2536"),
                  Text("${25*2+index}"),
                  Text(" ${index+2} *"),

                ],),
              ),

              Container(
                padding: EdgeInsets.all(wi*.04),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text(": مدل"),
                  Text(": قيمت"),
                  Text(" : تعداد"),

                ],),
              ),



            ],
          )
        ),),
      ],),

      //morteza roozbehi @mr_roz
    );
  }

}
