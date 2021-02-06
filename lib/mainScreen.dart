import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shop_ui/introapp.dart';
import 'package:shop_ui/panel.dart';
import 'package:shop_ui/profile.dart';

import 'iteminfo.dart';
import 'iteminfo2.dart';



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  // default mood
  bool dark = false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin<MyHomePage> {

  GlobalKey<ScaffoldState> stateScaffold =GlobalKey();

  // Colors elements
  Color darkText = Colors.deepPurpleAccent[100];
  Color lightText = Colors.white;
  Color lightBackground = Color(0xff7c959c);
  Color darkBackground = Color(0xff2a283f);
  int activeTab = 0;
  Color drawercolor=Colors.white;
  List categories = [
    " Fan ",
    "Shoes",
    "Lamp",
    "Dress",
    "Phone",
    "Phone",
    "Laptop",
  ];
  var searchBoxController = TextEditingController();
  TabController tabBarController;
  @override
  //set tabController
  void initState() {
    super.initState();
    // Future.delayed((Duration(seconds: 3))).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (e)=>intro())));
    //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (e)=>intro()));
    // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>intro()));
    tabBarController = TabController(length: 7, vsync: this);
    //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>intro()));

    //Navigator.push(context, MaterialPageRoute(builder: (c)=>intro()));
  } //set tabController

  @override
  Widget build(BuildContext context) {

    // size of device
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: widget.dark == false ? lightBackground : darkBackground,
      endDrawer: _myDrawer(wi,he),
      key: stateScaffold,
      body: SafeArea(
          child: Container(
              width: wi,
              height: he,
              child:
              Stack(
                children: [
                  ListView(
                    physics:  NeverScrollableScrollPhysics(),
                    children: [
                      _panelsBack(wi, he,  widget.dark),
                    ],),

                  ListView(

                    children: [

                      _darkMoodIconText(wi, he,  widget.dark),
                      _shopTextIcon(wi, he,  widget.dark),
                      _searchBox(wi, he,  widget.dark),
                      _tabBar(wi, he,  widget.dark),
                      _tabBarView(wi, he,  widget.dark),
                    ],
                  )
                ],
              )


            ////////////// make Widgets,
          )),
    );
  }




  Widget _myDrawer(var wi, var he){

    return Container(
      width: wi*.25,
      decoration: BoxDecoration(
          color: drawercolor,
          boxShadow: [BoxShadow(color: drawercolor,blurRadius: 20,spreadRadius: 5,offset: Offset(-4, 0))]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _drawerItem(wi,Icons.person,1 ),
          _drawerItem(wi,Icons.shopping_cart,2 ),
          _drawerItem(wi,Icons.info_outline,3 ),
        ],
      ),
    )
    ;
//morteza roozbehi @mr_roz
  }


  Widget _darkMoodIconText(var wi, var he, bool dark) {


    final _darkMoodIcon = Container(
      margin: EdgeInsets.only(left: wi * .03, top: wi * .01),
      child: FlutterSwitch(
        showOnOff: true,
        activeTextColor: Colors.yellow,
        height: wi * .06,
        width: wi * .11,
        padding: wi * .01,
        toggleSize: 15.0,
        borderRadius: wi * .02,
        activeColor: Colors.indigo,
        value: dark,
        onToggle: (value) {
          setState(() {
            widget.dark = value;
          });
        },
      ),
    );
    final _darkText = Text("dark",
        style: TextStyle(
            fontSize: wi * .04,
            color: dark == false ? Colors.white54 : Color(0xff7a959c)));

    return Container(
      margin: EdgeInsets.only(
        left: wi * .02,
        top: wi * .02,
      ),
      child: Row(
        children: [
          _darkMoodIcon,
          SizedBox(
            width: wi * .01,
          ),
          _darkText,
        ],
      ),
    );
  }


  Widget _shopTextIcon(var wi, var he, bool dark) {
    return Container(
      height: wi * .16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: wi * .05),
            child: Text(
              "Shop",
              style: TextStyle(
                  fontSize: wi * .09,
                  color: dark == false ? lightText : darkText),
            ),
          ),
          GestureDetector(
            onTap: (){
              stateScaffold.currentState.isEndDrawerOpen?
              Navigator.pop(context):
              stateScaffold.currentState.openEndDrawer();
            },
            child: Container(
              margin: EdgeInsets.only(right: wi * .02),
              child: Icon(Icons.filter_list,
                  color: dark == false ? lightText : lightText),
            ),
          ),
        ],
      ),
    );
  }


  Widget _drawerItem(wi,IconData icon,var id){

    return   GestureDetector(
      onTap: () { ///todo/////////////
        //Future.delayed(Duration(seconds: 4)).then((value) => Navigator.of(context).pop());
        if(id==1){
          Navigator.pop(context);
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_,__,___)=>Profile(),transitionDuration: Duration(seconds: 3),));
        }
        // if(id==2){
        //   Navigator.pop(context);
        //   Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Profile()))
        // }
        // if(id==3){
        //   Navigator.pop(context);
        //   Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Profile()))
        // }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: wi*.05),
        padding:   EdgeInsets.all(wi*.017),
        decoration: BoxDecoration(shape: BoxShape.circle,color: lightBackground,),
        child: Icon(icon,size: wi*.09,color: Colors.white,),),
    );
  }


  Widget _searchBox(var wi, var he, bool dark) {
    return Container(
      constraints: BoxConstraints(maxHeight: he * .99),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(wi * .04)),
      margin: EdgeInsets.only(
        left: wi * .08,
        right: wi * .08,
        top: wi * .03,
      ),
      child: TextField(
        autofocus:false ,
        controller: searchBoxController,
        style: TextStyle(
            fontSize: wi * .06,
            color: dark == false ? Colors.black54 : lightText,
            decoration: TextDecoration.none),
        cursorColor: dark == false ? darkBackground : lightBackground,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.white60,
            size: wi * .085,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white60,
            fontSize: wi * .06,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }


  Widget _tabBar(var wi, var he, bool dark) {

    return Container(
      margin: EdgeInsets.only(
        left: wi * .06,
        top: wi * .027,
      ),
      height: wi * .18,
      color: dark == false ? lightBackground : darkBackground,
      child: ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              width: wi * .2,
              height: he * .9,
              decoration: BoxDecoration(
                color: activeTab == index ? Colors.white38 : Colors.transparent,
                borderRadius: BorderRadius.circular(wi * .09),
              ),
              margin: EdgeInsets.all(wi * .029),
              child: Center(
                  child: Text(
                    categories[index],
                    style: TextStyle(
                        fontSize: wi * .053,
                        color: activeTab == index ? Colors.white : Colors.white60),
                  )),
            ),
            onTap: () {
              setState(() {
                activeTab = index;
              });
            },
          );
        },
      ),
    );
  }


  Widget _tabBarView(var wi, var he, bool dark) {

    return Container(
      height: he * .7,
      child: TabBarView(
        controller: tabBarController,
        children: [

          _fanList(wi, he,  widget.dark),
          _fanList(wi, he,  widget.dark),
          _fanList(wi, he,  widget.dark),
          _fanList(wi, he,  widget.dark),
          _fanList(wi, he,  widget.dark),
          _fanList(wi, he,  widget.dark),
          _fanList(wi, he,  widget.dark),



        ],
      ),
    );
  }


  Widget  _panelsBack(var wi, var he, bool dark){
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return  Container(
      height: he,
      width: wi,
      child: Stack(
        children: [
          Container(
            color: dark == false ? lightBackground:darkBackground,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: he * .54,
                decoration: BoxDecoration(
                  color: dark == false ? Colors.white : Colors.white30,
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


  Widget  _fanList(var wi, var he, bool dark){

    List info=[["Vornado","Electric","75"],["fan2","light","65"],["comfan","Electric","35"],["Vornado","light","40"]];


    return Container(
      child: ListView.builder(
        itemCount: info.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

              // Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Iteminfo(
              //   info[index][0],
              //   info[index][1],
              //   info[index][2],
              //  )));
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MyApp2()));
            },

            child: Stack(
              children: [
                Container(
                  width: wi * .88,
                  height: wi * .43,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,

                        spreadRadius: 0,
                        blurRadius: 9,
                        offset: Offset(
                            0, 0), // changes position of shadow
                      ),
                    ],
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(wi * .1),
                      topRight: Radius.circular(wi * .1),
                      bottomRight: Radius.circular(wi * .1),
                      topLeft: Radius.circular(wi * .1),
                    ),
                  ),
                  margin: EdgeInsets.all(wi * .06),

                ),
                Container(
                  width: wi * .88,
                  height: wi * .42,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: index.isEven ?
                        Color(0xffe1bba6)
                            : lightBackground,

                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(
                            5, 0), // changes position of shadow
                      ),
                    ],
                    color: dark == false
                        ? Colors.white
                        : Color(0xff312d4e),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(wi * .1),
                      topRight: Radius.circular(wi * .1),
                      bottomRight: Radius.circular(wi * .1),
                      topLeft: Radius.circular(wi * .1),
                    ),
                  ),
                  margin: EdgeInsets.all(wi * .06),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          //morteza roozbehi
                          Expanded(
                              child: Container(
                                child: Column(       // info item
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${info[index][0]}",
                                      style: TextStyle(
                                          color: dark == false
                                              ? Colors.black54
                                              : Colors.white60,
                                          fontSize: wi * .043,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      info[index][1],
                                      style: TextStyle(
                                        color: dark == false
                                            ? Colors.black54
                                            : Colors.white60,
                                        fontSize: wi * .03,
                                      ),
                                    ),
                                    Text(
                                      "${info[index][2]} \$",
                                      style: TextStyle(
                                        color: dark == false
                                            ? Colors.deepOrange
                                            : Colors.white60,
                                        fontSize: wi * .05,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(child:  Container())


                        ],
                      )
                    ],
                  ),
                ),
                Container(

                  width: wi * .88,
                  height: wi * .43,
                  color: Colors.transparent,
                  margin: EdgeInsets.all(wi * .03),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(child: Container(
                        child: index.isEven
                            ? Image.asset("images/pic.png")
                            : Image.asset("images/pic2.png"),
                      ),),
                    ],

                  ),
                ),
              ],
            ),

          );
        },
      ),
    );
  }


}
