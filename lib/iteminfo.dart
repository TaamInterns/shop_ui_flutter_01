
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class MyApp2 extends StatelessWidget {



  @override
  Widget build(BuildContext context,) {
    return MaterialApp(
      title: 'Product Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Product(
          shopItem: ShopItem(
              name: 'Vornado',
              description: 'Cool your whatever wah wah',
              details: '9999999 Rpm',
              price: 24,
              images: [
                'https://s16.picofile.com/file/8417712318/fan2.png',
                'https://s17.picofile.com/file/8417712326/fan1.png',
                "https://s17.picofile.com/file/8417712334/fan_vornado_evaporative_cooler_home_appliance_humidifier_png_favpng_uQu7cs4jPzXCdWsZ5RW35NJbG.png"
              ],
              isBookmarked: false)),
    );
  }
}

class ShopItem {
  final String name;
  final double price;
  final String description;
  final String details;
  final List<String> images;
  bool isBookmarked;

  ShopItem({
    this.name,
    this.price,
    this.description,
    this.details,
    this.images,
    this.isBookmarked,
  });
}

class Product extends StatefulWidget {
  final ShopItem shopItem;

  const Product({Key key, @required this.shopItem}) : super(key: key);
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int selectedImage = 0;
  CarouselController carouselController = CarouselController();
  ScrollController scrollController = ScrollController();
  onBuy() {}
  onBookmarked() {}
  onBack(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 186, 165, 1),
      body: Stack(
        children: [
          NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (_, b) => [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.width * 0.9,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [_myAppBar(), _imageSlider()],
                  ),
                ),
              ),
            ],
            body: Stack(
              alignment: Alignment.topCenter,
              children: [_description(), _thumbnails()],
            ),
          ),
          _myBottomBar()
        ],
      ),

    );
  }

  _myBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(50, 0, 30, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            color: Color.fromRGBO(13, 148, 153, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.16,
              height: MediaQuery.of(context).size.height * 0.05,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(widget.shopItem.price.toStringAsFixed(2) + " \$",
                    style: TextStyle(
                        color: Colors.blueGrey[50],
                        // fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(11, 121, 131, 1),
              ),
              child: InkWell(
                onTap: onBuy,
                child: Text("Buy",
                    style: TextStyle(
                        color: Colors.blueGrey[50],
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
            )
          ],
        ),
      ),
    );
  }

  _thumbnails() {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * 0.13,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, MediaQuery.of(context).size.height * 0.05),
              spreadRadius: 2),
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.shopItem.images.map((e) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedImage = widget.shopItem.images.indexOf(e);
                  carouselController.animateToPage(selectedImage);
                });
              },
              child: Image(
                image: NetworkImage(e),
                color: widget.shopItem.images.indexOf(e) == selectedImage
                    ? Colors.transparent
                    : Colors.white.withOpacity(0.6),
                colorBlendMode: BlendMode.lighten,
              ),
            ))
          ],
        ),
      ),
    );
  }

  bool isDescriptionSelected = true;
  _description() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      child: Container(
        padding: EdgeInsets.fromLTRB(
            50, (MediaQuery.of(context).size.height * 0.13), 40, 80),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 5, 10),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDescriptionSelected
                        ? Colors.blueGrey
                        : Colors.transparent,
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDescriptionSelected = true;
                  });
                },
                child: Text(
                  'Description',
                  style: TextStyle(
                      color: isDescriptionSelected
                          ? Colors.blueGrey
                          : Colors.blueGrey.withOpacity(0.5),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
              Container(
                  height: 10,
                  margin: const EdgeInsets.fromLTRB(20, 10, 5, 10),
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !isDescriptionSelected
                        ? Colors.blueGrey
                        : Colors.transparent,
                  )),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDescriptionSelected = false;
                  });
                },
                child: Text(
                  'Details',
                  style: TextStyle(
                      color: !isDescriptionSelected
                          ? Colors.blueGrey
                          : Colors.blueGrey.withOpacity(0.5),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: Text(
              isDescriptionSelected
                  ? widget.shopItem.description
                  : widget.shopItem.details,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blueGrey.withOpacity(0.5),
                letterSpacing: 0.5,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          // Sized
          GestureDetector(
            onTap: () {
              scrollController.animateTo(double.infinity,duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
            child: Text(
              'More',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blueGrey.withOpacity(0.9),
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          )
        ]),
      ),
    );
  }

  _imageSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.c./,
      children: [
        CarouselSlider.builder(
            itemCount: widget.shopItem.images.length,
            itemBuilder: (_, i) {
              return Image(image: NetworkImage(widget.shopItem.images[i]));
            },
            carouselController: carouselController,
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (i, r) {
                  if (r != CarouselPageChangedReason.controller)
                    setState(() {
                      selectedImage = i;
                    });
                })),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.shopItem.images.map((e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.shopItem.images.indexOf(e) == selectedImage
                    ? Colors.white
                    : Colors.white.withOpacity(0.4),
              ),
            ))
          ],
        )
      ],
    );
  }

  _myAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: onBack,
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(widget.shopItem.isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_border),
              onPressed: () {
                setState(() {
                  widget.shopItem.isBookmarked = !widget.shopItem.isBookmarked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
