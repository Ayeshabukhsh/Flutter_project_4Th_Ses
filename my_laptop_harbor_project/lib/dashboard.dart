import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Addcategory.dart';
import 'package:my_laptop_harbor_project/Editcategory.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_laptop_harbor_project/productcards.dart';

 class dashboard extends StatefulWidget {
  const dashboard({super.key});
@override
  State<dashboard> createState() => _dashboardState();
}
class _dashboardState extends State<dashboard> {


  late  User _user;
  String _userEmail = '' ;
@override 
  void initState() {
    super.initState();
  _getUser();
  }
Future<void> _getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
   
    if(user != null){
      setState(() {
        _user = user;
        _userEmail = user.email ?? '';
      });
    }
  }
   final auth = FirebaseAuth.instance;
    final ref = FirebaseDatabase.instance.ref('Post');
    //Mehtod Delete Data
    void _deletePost (String postId) async{
      await ref.child(postId).remove();
      Fluttertoast.showToast(msg: "Post Deleted");
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
  title: Text("My  DashBoard Page"),
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
       
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Addcategory()),);
      },
      child: Icon(Icons.add),
    ),
    body: Stack(
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
     
    
    Column(
      children: [
           Padding(
        padding: const EdgeInsets.only(left: 100,top:10),
        child: Text("Email:  $_userEmail",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 100,top:15),
        child: ElevatedButton(
          onPressed: () async{
          await FirebaseAuth.instance.signOut();
          Navigator.pop(context);
        },
         child: Text("SignOut"),
        ),
        ),
        Center( child:  Container( 
          width: 700,
          height: 400, 
           padding: EdgeInsets.all(16.0), margin: EdgeInsets.all(16.0), 
           alignment: Alignment.center, decoration: BoxDecoration( 
           borderRadius: BorderRadius.circular(12.0),
          boxShadow: [ BoxShadow( color: Colors.black.withOpacity(0.2),
          spreadRadius: 3, blurRadius: 5, offset: Offset(0, 3), ), ],
             gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 221, 76, 76), Color.fromARGB(255, 146, 210, 239),Color.fromARGB(255, 100, 66, 66)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
           border: Border.all( color: Colors.white, width: 3, ), 
                ), 
            child: Expanded(
          child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                String postId = snapshot.key!;
                String title =
                    snapshot.child('title').value as String? ?? 'No Title';
                String description =
                    snapshot.child('description').value as String? ??
                        'No Description';

                return ListTile(
                  title: Text(title),
                  subtitle: Text(description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Editcategory(
                                    postId: postId,
                                    title: title,
                                    description: description)),
                          );
                        },
                      ),
                
                    IconButton(
        icon :Icon(Icons.delete),
        onPressed: (){
          _deletePost(postId);
        },
      ), 
                  ],
                ),
              );
              }),
          ),
                ), ),
  
          ],
    ),
    ],
    ));

  }
}