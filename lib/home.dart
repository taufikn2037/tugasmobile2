import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Image.asset('assets/images/yubis-logo.png'),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.search, color: Colors.black.withOpacity(.6)), onPressed: () {  },),
          IconButton(icon: new Icon(Icons.shopping_basket, color: Colors.black.withOpacity(.6)), onPressed: () {  },),
        ],
      ),
      
      body: ListView(
        children: 
          [CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 210.0,
              autoPlay: true, 
            ), items: [
                'assets/hero/banner1.jpeg',
                'assets/hero/banner2.jpeg',
                'assets/hero/banner3.jpeg'
          ].map((e) {
            return Builder(
              builder: (BuildContext context){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(
                    e,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
            }).toList(),
          ),
          Container(
            height: 200,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 25),
              children: [
              Row(
                children: [
                  SizedBox(height: 50),
                    Text(
                      "Kategori Produk",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    ItemKategori(
                      title: "Sayuran",
                      image: "assets/icons/i1.png",
                    ),
                    ItemKategori(
                      title: "Paket",
                      image: "assets/icons/i2.png",
                    ),
                    ItemKategori(
                      title: "Buahan",
                      image: "assets/icons/i3.png",
                    ),
                    ItemKategori(
                      title: "Karbohidrat",
                      image: "assets/icons/i4.png",
                    ),
                  ],
                ),
            ]),
          ),
        ], 
      ),


      

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color.fromARGB(255, 49, 255, 56),
        unselectedItemColor: Colors.black.withOpacity(.6),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {

          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Beranda',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Produk',
            icon: Icon(Icons.production_quantity_limits),
          ),
          BottomNavigationBarItem(
            label: 'Promo',
            icon: Icon(Icons.pin),
          ),
          BottomNavigationBarItem(
            label: 'Transaksi',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'Akun',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}






class ItemKategori extends StatelessWidget {
  ItemKategori({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}