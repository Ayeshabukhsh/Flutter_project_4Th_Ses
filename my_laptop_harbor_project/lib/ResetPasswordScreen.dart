import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

 class ResetPasswordScreen extends StatelessWidget {
  final _emailController = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
  title: Text("My Reset Email  Page"),
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

      body: Stack(
          children: [
                                                        
          Container(
           child: Column(
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
            Container(
              padding:  EdgeInsets.only(left: 500, top:30 ),
              child: Text('Reset Your  Email',
              style: TextStyle(color: Colors.black, fontSize:  40,fontWeight: FontWeight.bold),
                
              ),
            ),
       Padding(
                padding: const EdgeInsets.only(top:90,),
                child: Container(
                         margin: EdgeInsets.symmetric(horizontal: 350,),
                      height: 400,
                      decoration: BoxDecoration(
                  gradient: LinearGradient(
                 colors: [
                Color.fromARGB(255, 209, 124, 100),
                const Color.fromARGB(255, 73, 158, 228),
                Color.fromARGB(255, 247, 244, 244),
                ]
              ),                       
               borderRadius: BorderRadius.circular(14),),
         child:  Container(
        child:  Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            TextField(),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: " Enter Your Email"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async {
              try {
                await FirebaseAuth.instance.sendPasswordResetEmail(
                  email: _emailController.text,
                  );
                  print("Passoword email sent...");
                  _emailController.clear();
              }on FirebaseAuthException  catch(e) {
                print("Error $e");
              }}, child: Text("Sent Reset Email",
            style: TextStyle(fontSize: 16,),))
          ],
        ),
        ),),
        ),),
  ],));
  }}
    
