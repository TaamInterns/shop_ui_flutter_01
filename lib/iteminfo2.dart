import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Iteminfo extends StatefulWidget {
  String name;
  String category;
  String price;

  String image;

  Iteminfo(this.name,this.category,this.price,);
  @override
  _IteminfoState createState() => _IteminfoState();
}

class _IteminfoState extends State<Iteminfo> {

  ///////////////// Colors
  Color backPanel = Color(0xffEEBDAC);
  Color bottomPanel = Colors.white;
  Color topIcons = Colors.white;
  Color bookmarkcolor = Colors.red;
  Color bottomWidgetBuy = Color(0xff7c959c);
  Color buttomBy = Colors.black26;
  Color Textinfo =Colors.black54;
  bool bookmark=false;

  ////////////////////
List images=[
  "images/1.png",
  "images/2.png",
  "images/3.png",
  "images/1.png",
];


var active=0;
  @override
  Widget build(BuildContext context) {

    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    var  iconsSize =  wi*.08;

    return SafeArea(
      child: Scaffold(
        backgroundColor:backPanel ,
        body: Container(
          width: wi,
          height:he ,
          child: Stack(
            children: [

              Align(
                alignment: Alignment.topCenter,
                child: _image(he,wi),
              ), //big image
              Align(
                alignment: Alignment.topCenter,
                child: _topIcons(he,wi,iconsSize),
              ), //  topIcons  back & bookmark
              Align(
                alignment: Alignment.bottomCenter,
                child: _bottomPanel(wi,he),
              ), //panel morteza roozbehi @mr_roz
              Align(
                alignment: Alignment.bottomCenter,
                child: _bottomWidgetBuy(he,wi),
              ), // panel price & Buy
              Align(
                alignment: Alignment.center,
                child: _centerPanel(he,wi),
              ) // 3 image of produce


            ],
          ),
        ),
      ),
    );
  }






  //////////////////////////////// Widgets

  Widget _topIcons(var wi,var he,var iconsSize ){

    return Container(
      margin: EdgeInsets.all(wi*.03),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
                child: Icon(Icons.arrow_back_ios_sharp ,color: topIcons,size: iconsSize,)),
          ),
          GestureDetector(
            onTap: (){
              print("bookmark");
              setState(() {
                bookmark==false? bookmark=true:bookmark=false;
              });
            },//morteza roozbehi @mr_roz
            child: bookmark==false?Container(
                decoration: BoxDecoration(shape: BoxShape.circle,),
                child: bookmark==false?Icon(Icons.bookmark_border ,color: topIcons,size:iconsSize,) :Icon(Icons.bookmark ,color: bookmarkcolor,size:iconsSize,)):Container(
                decoration: BoxDecoration(shape: BoxShape.circle,),
                child: bookmark==false?Icon(Icons.bookmark_border ,color: topIcons,size:iconsSize,) :Icon(Icons.bookmark ,color: bookmarkcolor,size:iconsSize,)),
          ),//icon bookmark

        ],
      ),
    );

  }

  Widget _image(var wi,var he){
    return Container(
      margin: EdgeInsets.only(top: wi*.05),

      height: wi*.35,
      width: wi*.7,
      child: Image.asset(images[active]),
    );
  }

  Widget _centerPanel( var he,var wi){

    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
            color: Colors.grey[300],
          spreadRadius: 3,
          blurRadius:15,
          offset: Offset(2,3)
//morteza roozbehi @mr_roz
        )],
        color: bottomPanel,
        borderRadius:BorderRadius.all(Radius.circular(wi*.07)),
      ),
        width:wi*.8 ,
        height: wi*.32,

      child:ListView.builder(

        itemCount:images.length ,
        itemBuilder:(c, i) {
          return GestureDetector(
            onTap: (){
              setState(() {
                active=i;
              });
            },
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 600),
              opacity: active==i?1:.5,
              curve: Curves.easeInCirc,
              child: Container(
                padding: EdgeInsets.all(wi*.02),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                    borderRadius:BorderRadius.all(Radius.circular(wi*.07)),
                    image: DecorationImage(

                        image: AssetImage(images[i])
                    )
                ),
                width:wi*.26 ,

              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      )
    );
  }


  Widget _bottomPanel(var wi,var he){

    final _topText=Container(

      margin: EdgeInsets.only(left:wi*.03 ,right:wi*.065 ,top:wi*.25 ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("• Description",style: TextStyle(color: bottomWidgetBuy,fontWeight: FontWeight.w900,fontSize: wi*.04),),
          Text(widget.name,style: TextStyle(color: bottomWidgetBuy.withOpacity(.5),fontWeight: FontWeight.w900,fontSize: wi*.04)),
          Text("cate : ${widget.category}",style: TextStyle(color: bottomWidgetBuy.withOpacity(.5),fontWeight: FontWeight.w900,fontSize: wi*.04)),
        ],
      ),//morteza roozbehi @mr_roz
    );
    final _contentText= Container(
      margin: EdgeInsets.all(wi*.06),
      child: Text("Lorem ipsum dolor sit  ipsum dolor sit amet, consectetuer  adipiscing elit,amet,adipiscing elit,amet, consectetuer adipiscing elit, sed diam nonummy nibhadipiscing elit,amet,adipiscing elit,amet, euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam",
        overflow:TextOverflow.ellipsis ,maxLines: 3,style: TextStyle(color: Textinfo,fontSize:wi*.037 ,fontWeight: FontWeight.w600),),
    );
    final _moreText=Container(
      margin: EdgeInsets.only(left: wi*.06),
      height: wi*.075,
      child: Text("More ...",style: TextStyle(color: bottomWidgetBuy,fontWeight: FontWeight.w900,fontSize: wi*.04)),
    );

    return Container(
      width:wi ,
      height: he*.49,
      decoration: BoxDecoration(
        color: bottomPanel,
        borderRadius:BorderRadius.only(topLeft: Radius.circular(wi*.07),topRight: Radius.circular(wi*.07)),
      ),
      child: ListView(
        children: [
          _topText,
          _contentText,
          _moreText,
        ] ,
      ),
    );
  }

//morteza roozbehi @mr_roz
  Widget _bottomWidgetBuy(var wi,var he){

    return Container(
      height:he*.2 ,
      width:wi ,
      decoration: BoxDecoration(
        color: bottomWidgetBuy,
        borderRadius:BorderRadius.only(topLeft: Radius.circular(wi*.03),topRight: Radius.circular(wi*.03)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("${widget.price} \$",style: TextStyle(color:topIcons,fontSize: wi*.04 ),),
          GestureDetector(
            onTap: (){
              ///todo///////////////////////
              print("khared");
            },
            child: Container(
              width: wi*.2,
              height: wi*.065,
              decoration: BoxDecoration(
                color:buttomBy,
                borderRadius: BorderRadius.all(Radius.circular(wi*.02)),
              ),


              child:Center(child: Text("خريد",style: TextStyle(color:topIcons,fontSize: wi*.03 ))) ,),
          )//morteza roozbehi @mr_roz
        ],

      ),
    ) ;
  }
}


