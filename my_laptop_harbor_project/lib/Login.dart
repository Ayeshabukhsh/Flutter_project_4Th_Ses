import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/ResetPasswordScreen.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/productcards.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

Future<void> _loginUser(
    BuildContext context, String email, String password) async{
    try {
       final UserCredential userCredential = await FirebaseAuth.instance
       .signInWithEmailAndPassword(email: email, password: password);
      print('User Login : ${userCredential.user}');
       //if User Login successFul show Toast
       Fluttertoast.showToast(msg: "Login Successfully!",
       toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.black);

      _emailController.clear();
      _passwordController.clear();
      //Navigate to dashboard screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>dashboard()),);
    } catch (e) {
      Fluttertoast.showToast(msg: "Login Failed : $e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);

    }
    
  }return  Scaffold(
      appBar:  AppBar(
  title: Text("My Login Page"),
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
       
body:   Stack(
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
        //-----------------------------------------
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
          Text(" ****_Login_***",
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white, ),),
        Container(
          height: 0,
        ),
        TextField( ),
          Container(
          height: 25,
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
                    TextField( ),
        
           Container(
            height: 20,
          ),
     
                  
                  
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                         ElevatedButton(onPressed: (){
                              _loginUser(context, _emailController.text.trim(), _passwordController.text.trim());
                            },child: Text("Continue..",
                            style: TextStyle( fontSize: 18,fontWeight: FontWeight.bold,),), ),
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
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()));
                            },
                         child: Text("Forgot Password",
                            style: TextStyle(decoration: TextDecoration.underline,
                            fontSize: 18,color: Color.fromARGB(255, 82, 62, 62)),
                            )
                            ),
                            TextButton(onPressed: (){},
                         child: Text("I Don't have Password",
                            style: TextStyle(decoration: TextDecoration.underline,
                            fontSize: 18,color: Color.fromARGB(255, 82, 62, 62)),
                            )
                            ),
                           ],
                          ),
            
           
        ],
       ),
       ),
            ),
   //------------------------
         
            
                     
              // borderRadius: BorderRadius.circular(14),
          
                  
                  
                               ],
                  ),
                );

}
}

