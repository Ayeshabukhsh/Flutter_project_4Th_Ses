import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_laptop_harbor_project/Addcategory.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/productcards.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';


//import 'package:my_authen_project/ProductForm.dart';





import 'package:my_laptop_harbor_project/Splash_Screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: FirebaseOptions(
  apiKey: "AIzaSyBlV_P-3lQ0qBAv_zIP7Li1BPuEUm_Kdv0",
  authDomain: "flutter-auth-df9cf.firebaseapp.com",
  projectId: "flutter-auth-df9cf",
  storageBucket: "flutter-auth-df9cf.appspot.com",
  messagingSenderId: "428393768282",
  appId: "1:428393768282:web:7b23da010e257f3e52ff63",
  databaseURL: "https://flutter-auth-df9cf-default-rtdb.firebaseio.com",)
   );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //--------Banner Remove
    debugShowCheckedModeBanner : false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'My Flutter Authentication Project'),
            // home:  Splash_Screen(),
            home: const RegistrationForm(),

    );
  }
}
// stfl Use In StateFulWidget Method
 class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});
@override
  State<RegistrationForm> createState() => _RegistrationFormState();
}
 class _RegistrationFormState extends State<RegistrationForm> {
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
 void initState(){
    //ToOo Implement InitState
    super.initState();
Timer(Duration(seconds: 8),(){
Navigator.pushReplacement(
context,
 MaterialPageRoute(
builder: (context) =>ImageSliderPage(),
    ));
});
}
  @override
Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage('assets/register.png'),
        //   fit: BoxFit.cover,
        // ),
      ),
      child : Scaffold(
      appBar: 
      AppBar(
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

        body: 
        Stack(
           children: [
           Container(
      decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Color.fromARGB(255, 77, 105, 154),
                  const Color.fromARGB(255, 12, 7, 7),

                ])
              ),
      child: Center(
     child: Text("WelCoOome To My Project....!",
     style: TextStyle(color: Colors.white,fontSize: 20),),

      ),
    ),
  
       
                ],
                ),
              ),
            );
    
  }
}
