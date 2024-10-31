
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_laptop_harbor_project/main.dart';
import 'package:my_laptop_harbor_project/productcards.dart';
 
 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: FirebaseOptions(
  apiKey: "AIzaSyBlV_P-3lQ0qBAv_zIP7Li1BPuEUm_Kdv0",
  authDomain: "flutter-auth-df9cf.firebaseapp.com",
  databaseURL: "https://flutter-auth-df9cf-default-rtdb.firebaseio.com",
  projectId: "flutter-auth-df9cf",
  storageBucket: "flutter-auth-df9cf.appspot.com",
  messagingSenderId: "428393768282",
  appId: "1:428393768282:web:7b23da010e257f3e52ff63",
  // databaseURL:"https://flutter-auth-df9cf-default-rtdb.firebaseio.com",
  
  ));
  runApp(const Register());
}
 class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _register() async{
    try {
       final String email = _emailController.text.trim();
       final String password = _passwordController.text.trim();
       final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print('User Registered : ${userCredential.user}');
      Fluttertoast.showToast(msg: "User  Registered Successfully!",
       toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.black);
      _emailController.clear();
      _passwordController.clear();
    } catch (e) {
      print("Registration failed: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
 return  Scaffold(
      appBar: AppBar(
  title: Text("My Register Page"),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color.fromARGB(255, 189, 43, 33),
          Color.fromARGB(255, 158, 187, 238),
          Color.fromARGB(255, 4, 2, 26)
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
       
        body: Stack(
           children: [
          Container(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image with local asset
              Image.asset(
                'assets/images/wallpaper.JPG',
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
              width: 650,
              height: 450,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                //color: const Color.fromARGB(255, 131, 175, 211),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
             gradient: LinearGradient(
                colors: [
               Color.fromARGB(255, 209, 124, 100),
               const Color.fromARGB(255, 73, 158, 228),
               Color.fromARGB(255, 247, 244, 244),
                ]
              ),  
                 ),
         child: Column(
        children: [
          Text(" ****_Register_***",
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white, ),),
                  TextField(),
                      Container(
                        height: 15,
                      ),
                     TextField(
                        controller: _emailController,
                        decoration :InputDecoration(
                          //fillColor: Colors.grey.shade200,
                          //filled: true,
                          hintText: 'Email',
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            suffixIcon: IconButton(
                            icon: Icon(Icons.email),
                            onPressed: (){},
                           )
                        )
                           //obscureText: true,
                           // obscuringCharacter :("dhdjdj"),
                          ),
                           const SizedBox(height:15,
                     ),
                          TextField(
                        controller: _passwordController,
                        decoration :InputDecoration(
                          // fillColor: Colors.grey.shade200,
                          // filled: true,
                          hintText: 'Password',
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                           suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: (){},
                           )
                        ),
                           obscureText: true,
                           // obscuringCharacter :("dhdjdj"),
                          ),
                          
                                 const SizedBox(height:16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          TextButton(onPressed: _register, child: const Text("Reg Continue...",
                              style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold,
                              ),
                              ),
                               ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Color.fromARGB(255, 82, 62, 62),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: (){},
                                  icon:Icon(Icons.arrow_forward) ,
                                ),
                              )
                            ],
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            TextButton(onPressed: (){},
                         child: Text("Forgot Password",
                            style: TextStyle(decoration: TextDecoration.underline,
                            fontSize: 18,color: Color.fromARGB(255, 82, 62, 62)),
                            )
                            ),
                            TextButton(onPressed: (){},
                         child: Text("I Don't have Pwrd",
                            style: TextStyle(decoration: TextDecoration.underline,
                            fontSize: 18,color: Color.fromARGB(255, 82, 62, 62)),
                            )
                            ),
                           ],
                          ),
                 

                              ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                              }, child:Text("Login",
                              style:TextStyle(color: Color.fromARGB(255, 82, 62, 62),fontSize: 18,fontWeight: FontWeight.bold) ,)
                              ),
                               ],
                  ),
                ),
                ),
              
          ],
        ),
                  
      );

  }
}