import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  List imgList = [
    'assets/images/carousel1.jpg',
    'assets/images/carousel2.jpg',
    'assets/images/carousel3.jpg'
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.fromLTRB(2.0, 8.0, 0, 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(3.0, 0, 0, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "MelekPedia",
                      hintStyle: TextStyle(color: Colors.grey),
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10.0, 0),
            width: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.mail),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.green[600],
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                top: 0.0,
                child: ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100.0,
                    color: Colors.green[600],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: CarouselSlider(
                  height: 130,
                  initialPage: 0,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  autoPlay: true, // buat gerak sendiri
                  reverse: false, // buat membalikan
                  enableInfiniteScroll: true, // jadi muter terus
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgAssets) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                              image: AssetImage(imgAssets),
                              fit: BoxFit.fill,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 50.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index ? Colors.green : Colors.grey,
                      ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width - 165),
                        child: Text("Lihat Semua",
                            style: new TextStyle(
                                color: Colors.green,
                                fontSize: 10.0,
                                fontFamily: 'Camfortaa',
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 3.0),
                  blurRadius: 5.0, // memiliki efek melunakkan bayangan
                  // spreadRadius: 1.0, // memiliki efek memperluas bayangan
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                     
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.center_focus_strong,
                            size: 40.0,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        Text("Scan",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                                fontFamily: 'Camfortaa',
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 6.0, bottom: 6.0, left: 8.0),
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.0, bottom: 10.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.deepPurple,
                              size: 40.0,
                            ),
                            title: Text("MelekPay",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontFamily: 'Camfortaa',
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text("Aktivasi",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14.0,
                                    fontFamily: 'Camfortaa',
                                    fontWeight: FontWeight.bold)),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      Container(
                        width: 171.0,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.0, bottom: 6.0),
                          child: ListTile(
                            leading: Icon(
                              Icons.stars,
                              color: Colors.deepOrange,
                              size: 38.0,
                            ),
                            title: Text("800 Points",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontFamily: 'Camfortaa',
                                    fontWeight: FontWeight.w800)),
                            subtitle: Text("4 Kupon",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                    fontFamily: 'Camfortaa',
                                    fontWeight: FontWeight.bold)),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80.0,
            margin: EdgeInsets.only(
              top: 15.0,
              bottom: 5.0,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              // physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 10.0),
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                     Navigator.of(context).pushNamed('/kategori');
                  },
                  child: Column(
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/app.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 33.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Semua",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold)),
                          Text("Kategori",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/bag.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 33.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Belanja",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/legal-paper.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 33.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Top-Up & Tagihan",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/suitcase.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 33.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Travel",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 8.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 47.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage(
                                'assets/images/indonesian-rupiah.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 35.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Keuangan",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 47.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/editor.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 35.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Komputer & Akses..",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/train.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 38.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Tiket",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold)),
                          Text("Kereta Api",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/graph.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 33.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Melek",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold)),
                          Text("Saham",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 45.0,
                      height: 45.0,
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/images/promotions.png'),
                            width: 25.0,
                            height: 25.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 33.0,
                      width: 33.0,
                      margin: EdgeInsets.only(top: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Promosi",
                              style: new TextStyle(
                                  color: Colors.black,
                                  fontSize: 7.0,
                                  fontFamily: 'Camfortaa',
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            margin: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text("rizki, Terlaris Untukmu",
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Camfortaa',
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  flex: 1,
                  child: Text("Lihat Semua",
                      style: new TextStyle(
                          color: Colors.green,
                          fontSize: 12.0,
                          fontFamily: 'Camfortaa',
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // batas menulis di column
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              title: Text("Feed",
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: 'Camfortaa'))),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in),
              title: Text("Official Store",
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontFamily: 'Camfortaa'))),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Keranjang",
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontFamily: 'Camfortaa')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Akun",
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontFamily: 'Camfortaa')),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 35.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 60.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 50.0);
    var secondControlpoint = Offset(size.width * .75, size.height - 10.0);
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
