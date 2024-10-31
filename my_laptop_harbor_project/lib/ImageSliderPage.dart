import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_laptop_harbor_project/models/book.dart';

import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/Addcategory.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/Models/book.dart';
import 'package:my_laptop_harbor_project/Services/firebase_service.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/productcards.dart';
import 'package:my_laptop_harbor_project/productcards.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageSliderPage(),
    );
  }
}

class ImageSliderPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/wallpaper.JPG',
    'assets/images/d.png',
    'assets/images/wallpaper.JPG',
    'assets/images/d.png',
    'assets/images/wallpaper.JPG',
    'assets/images/d.png',
  ];
  
  final BookService bookService = BookService();
  List cart = [];
  List wishlist = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider'),
        flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 180, 18, 6),
          Color.fromARGB(255, 11, 77, 190),
          Color.fromARGB(255, 1, 0, 8)
        ],
      ),
    ),
  ),
      ),


drawer: Drawer(
          child:  ListView(
            padding: EdgeInsets.zero,
            children:<Widget> [
             DrawerHeader(
             decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Color.fromARGB(255, 77, 105, 154),
                  const Color.fromARGB(255, 12, 7, 7),

                ])
              ),
              child: Text(
                'Laptop Harbor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

             ),
                ListTile(
              leading: Icon(Icons.home),
              title: Text('Home' ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageSliderPage()));
              },
             ),
              ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Register '),
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));              
               },
             ),
             ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));             
               },
             ),
               ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));             
              },
             ),
              ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Brand'),
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Addbrand()));             
                 },
             ),
             ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text(' Add Products'),
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBookScreen()));             
                  },
             ),
               ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('Products'),
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductCardScreen()));             
                  },
             ),
             ListTile(
              leading: Icon(Icons.production_quantity_limits),
              title: Text('View Products'),
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>BookCatalogScreen()));             
                  },
             ),
             
              ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Feed Back'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Feed()));              
                },
             ),
               ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactPage()));              
                },
             ),
              ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));              
              },
             ),
           
            ],
          ),
        ),
       
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.red,
                Color.fromARGB(255, 77, 105, 154),
                const Color.fromARGB(255, 12, 7, 7),
              ]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 600, top: 30),
            child: Text(
              'Register',
              style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                    ),
                    items: imageList.map((item) => Container(
                      child: Center(
                        child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                      ),
                    )).toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child:FutureBuilder<List>(
                  future: bookService.fetchBooks(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final books = snapshot.data ?? [];
                      return LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount;
                          if (constraints.maxWidth > 1200) {
                            crossAxisCount = 4; // Web view
                          } else {
                            crossAxisCount = 2; // Tablet and mobile view
                          }

                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount, // Number of cards in a row
                              childAspectRatio: 0.7, // Aspect ratio of each card
                            ),
                            itemCount: books.length,
                            itemBuilder: (context, index) {
                              final book = books[index];
                              return Card(
                                margin: EdgeInsets.all(10),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Image.network(book.coverImageUrl,
                                            width: double.infinity, fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                          return Icon(Icons.error, size: 100);
                                        }),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        book.title,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'by ${book.author}',
                                        style: TextStyle(fontSize: 16),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '\$${book.price.toString()}',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              (() {
                                                cart.add(book);
                                              });
                                            },
                                            child: Text('Add to Cart'),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              wishlist.contains(book) ? Icons.favorite : Icons.favorite_border,
                                              color: wishlist.contains(book) ? Colors.red : null,
                                            ),
                                            onPressed: () {
                                              (() {
                                                if (wishlist.contains(book)) {
                                                  wishlist.remove(book);
                                                } else {
                                                  wishlist.add(book);
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}