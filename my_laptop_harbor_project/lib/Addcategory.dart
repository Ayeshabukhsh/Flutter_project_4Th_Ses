import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/productcards.dart';

class Addcategory extends StatefulWidget {
  const Addcategory({super.key});
 @override
  State<Addcategory> createState() => _AddcategorytState();
}
 class _AddcategorytState extends State<Addcategory> {
  final titleController = TextEditingController();
  final desController = TextEditingController();
  final postRef  = FirebaseDatabase.instance.ref('Post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(
  title: Text("My Category Page"),
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
       

     body:  Stack(
           children: [
            Container(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image with local asset
              Image.asset(
                'assets/images/laptop.JPEG',
                   fit: BoxFit.cover,
                   height: 550,
                   width:double.maxFinite ,
              // Adjust alignments
                color: Colors.blue, // Apply color filter
                colorBlendMode: BlendMode.modulate, // Adjust color blend mode
                repeat: ImageRepeat.repeatY, // Repeat the image vertically
              ),
            ],
          ),
        ),
   Center(
         child: Container(
              width: 800,
              height: 450,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 131, 175, 211),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 115, 35, 35).withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                // gradient: LinearGradient(
                //   colors: [Color.fromARGB(255, 221, 76, 76), Color.fromARGB(255, 146, 210, 239),Color.fromARGB(255, 100, 66, 66)],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),

       child: Column(
        children: [
          Text(" ****_Add New Category_***",
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 240, 234, 234), ),),
        Container(
          height: 0,
        ),
        TextField( ),
          Container(
          height: 25,
        ),
          TextField(
          style: TextStyle(color: Colors.white),
           controller: titleController,
            decoration: InputDecoration(
            labelText: " Category Name", 
             border:  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(         
           style: TextStyle(color: Colors.white),
           controller: desController,
            decoration: InputDecoration(
              labelText: "Category Description", border:  OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
           TextField( ),
        Container(
            height: 20,
          ),
       ElevatedButton(
              onPressed: (){
                postRef
                .child(DateTime.now().microsecondsSinceEpoch.toString())
                .set({
                  'title' : titleController.text.toString(),
                 'description' : desController.text.toString(),
                });
                  Fluttertoast.showToast(msg: "Add Data Successfully!",
                 toastLength: Toast.LENGTH_SHORT,
                 gravity: ToastGravity.BOTTOM,);
                 titleController.clear();
                 desController.clear();
              },
              child: Text("Add Data",style: TextStyle(fontSize: 20),)
            ),
        ],
       ),
       ),
            ),
    ]),);
  }
}