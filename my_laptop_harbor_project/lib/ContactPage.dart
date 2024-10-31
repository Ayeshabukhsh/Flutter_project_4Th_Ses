import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/productcards.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  title: Text("My Contact Us Page"),
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
       
      body: 
      Stack(
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
        Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              maxLines: 1,
              decoration:InputDecoration(
                border:  InputBorder.none,
                filled: true,
                 hintText: 'Name',
            
              ),
             controller: _nameController,
                 validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              }, 
             
            ),
            ),
             SizedBox(height: 10),

              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               child: TextFormField(
                     decoration:InputDecoration(
                  border:  InputBorder.none,
                  filled: true,
                   hintText: 'Email',
                           
                ),
                 controller: _emailController,
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your email';
                   }
                   return null;
                 },
               ),
             ),
              SizedBox(height: 10),

        Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: TextFormField(
         decoration:InputDecoration(
                  border:  InputBorder.none,
                  filled: true,
                   hintText: 'Address',
              
                ),
    controller: _addressController,
    maxLines: 4,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your  address';
      }
      return null;
    },
  ),
),
 SizedBox(height: 10),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: TextFormField(
                   decoration:InputDecoration(
                  border:  InputBorder.none,
                  filled: true,
                   hintText: 'Contact No',
              
                ),
               controller: _contactController,
               validator: (value) {
                 if (value == null || value.isEmpty) {
                   return 'Please enter your contact no';
                 }
                 return null;
               },
             ),
           ),
            SizedBox(height: 10),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: TextFormField(
    maxLines: 7,
         decoration:InputDecoration(
                  border:  InputBorder.none,
                  filled: true,
                   hintText: 'Message',
              
                ),
    controller: _messageController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your message';
      }
      return null;
    },
  ),
),

SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    ]),);
  }
  
void _submitForm() async {
  if (_formKey.currentState?.validate() ?? false) {
    await FirebaseFirestore.instance.collection('contacts').add({
      'name': _nameController.text,
      'email': _emailController.text,
      'message': _messageController.text,
      'address' :_addressController.text,
      'contact': _contactController.text,
      'timestamp': FieldValue.serverTimestamp(),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Your message has been sent!')),
    );
    _nameController.clear();
    _emailController.clear();
    _addressController.clear();
    _contactController.clear();
    _messageController.clear();
  }
}

}
