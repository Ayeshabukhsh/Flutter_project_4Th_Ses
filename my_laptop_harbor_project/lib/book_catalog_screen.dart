import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/models/book.dart';
import 'package:my_laptop_harbor_project/productcards.dart';
import 'package:my_laptop_harbor_project/services/firebase_service.dart';
import 'package:my_laptop_harbor_project/edit_book_screen.dart';

class BookCatalogScreen extends StatefulWidget {
  @override
  _BookCatalogScreenState createState() => _BookCatalogScreenState();
}

class _BookCatalogScreenState extends State<BookCatalogScreen> {
  final BookService bookService = BookService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
         AppBar(
  title: Text("My Product Catalog"),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.red,
          Color.fromARGB(255, 77, 105, 154),
          const Color.fromARGB(255, 12, 7, 72)
        ],
      ),
    ),
  ),


        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBookScreen()),
              ).then((value) =>
                  setState(() {})); // Refresh the screen after adding a book
            },
          ), 
        ],
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
           Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));             
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
       
      body:
      // Stack(
      //   children: [
      //        Container(
      //      child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         // Image with local asset
      //         Image.asset(
      //           'assets/images/laptop.JPEG',
      //              fit: BoxFit.cover,
      //              height: 550,
      //              width:double.maxFinite ,
      //         // Adjust alignments
      //           color: Colors.blue, // Apply color filter
      //           colorBlendMode: BlendMode.modulate, // Adjust color blend mode
      //           repeat: ImageRepeat.repeatY, // Repeat the image vertically
      //         ),
      //       ],
      //     ),
      //   ),
       
      //                    Center(
      //        child:  Container(
      //         height: 500,
      //         padding: EdgeInsets.all(16.0),
      //         margin: EdgeInsets.all(16.0),
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           //color: const Color.fromARGB(255, 131, 175, 211),
      //           borderRadius: BorderRadius.circular(12.0),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black.withOpacity(0.2),
      //               spreadRadius: 3,
      //               blurRadius: 5,
      //               offset: Offset(0, 3),
      //             ),
      //           ],
      //         //  gradient: LinearGradient(
      //         //    colors: [
      //         //   Color.fromARGB(255, 209, 124, 100),
      //         //   Color.fromARGB(255, 42, 136, 213),
      //         //   Color.fromARGB(255, 247, 244, 244),
      //         //   ]
      //         // ),   
      //           border: Border.all(
      //             color: Colors.white,
      //             width: 3,
      //           ),
      //         ),
      //         child: Column(
      //          children: [
      //     Text(" **_Edits  Product_**",
      //          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.brown, ),),
      FutureBuilder<List<Book>>(
        future: bookService.fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final books = snapshot.data ?? [];
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  leading: Image.network(book.coverImageUrl,
                      errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  }),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditBookScreen(book: book),
                            ),
                          ).then((value) => setState(
                              () {})); // Refresh the screen after editing a book
                        },
                      ), 
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          bookService.deleteBook(book.id).then((value) {
                            // Show a snackbar or other feedback mechanism
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Book deleted')),
                            );
                            setState(
                                () {}); // Refresh the screen after deleting a book
                          });
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to book details or edit page
                  },
                );
              },
            );
          }
        },
      ),
        );
                         
     
  
  }
}
