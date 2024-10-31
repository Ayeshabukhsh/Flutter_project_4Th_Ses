import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/Feed.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/productcards.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;
  onChangeFunction1 (bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }
   onChangeFunction2 (bool newValue2){
    setState(() {
      valNotify2 = newValue2;
    });
  }
 onChangeFunction3 (bool newValue3){
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  title: Text("My Setting Page"),
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
       
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Text("Acount" , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildAcountOption(context, " Change Password"),
           buildAcountOption(context, " Content Setting"),
            buildAcountOption(context, " Socail"),
            buildAcountOption(context, " Language"),
             buildAcountOption(context, " Privacy And Security"),
             SizedBox( height: 40),
                   Row(
                    children: [
                      Icon(Icons.volume_up_outlined, color: Colors.blue),
                      SizedBox( width: 10),
                      Text("Notification", style: TextStyle(
                        fontSize: 22,
                      fontWeight: FontWeight.bold),)
                    ],
                  ),
                Divider(height: 20, thickness: 1,),
                SizedBox(height: 10),
               buildNotificationOption(" Theme Dart", valNotify1, onChangeFunction1),
              buildNotificationOption(" Acount  Active", valNotify2, onChangeFunction2),
              buildNotificationOption("Opportunity  ", valNotify3, onChangeFunction3),
              SizedBox(height: 50),

              // Center(
              //   child:OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       padding:  const EdgeInsets.symmetric(horizontal:  40),
              //       shape: RoundedRectangleBorder(
              //         borderRadius:  BorderRadius.circular(20)
              //       )
              //     ),
              //     onPressed: (){
              //           child: Text("Sign Out",  style:  TextStyle(
              //             fontSize: 16,
              //             letterSpacing: 2.2, color:  Colors.black
              //           ),);
              //     },
              //   ),
              // ),


             
             ],
        ),
      ),
    );
  }

  Padding buildNotificationOption ( String  title, bool value, Function OnchangeMethod){
    return  Padding(
      padding:  const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600]
          ),),
          Transform.scale(
            scale : 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool  newValue){
                OnchangeMethod(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }
  GestureDetector buildAcountOption(BuildContext context , String title){
    return GestureDetector(
      onTap: () {
           showDialog(context: context, builder:(BuildContext context){
             return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Change Password"),
                  Text("Forgot Password"),
                  Text("Save Password"),
                  Text("Delete Password"),
                  SizedBox(height: 40),
            
                ],
              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Close"))
              ],
             );
           });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]
            )),
            Icon(Icons.arrow_forward_ios,color: Colors.grey),


          ],
        ),
      ),
    );
  }
}