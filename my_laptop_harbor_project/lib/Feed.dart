import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_laptop_harbor_project/Addbrand.dart';
import 'package:my_laptop_harbor_project/ContactPage.dart';
import 'package:my_laptop_harbor_project/ImageSliderPage.dart';
import 'package:my_laptop_harbor_project/Login.dart';
import 'package:my_laptop_harbor_project/Register.dart';
import 'package:my_laptop_harbor_project/SettingsPage.dart';
import 'package:my_laptop_harbor_project/add.dart';
import 'package:my_laptop_harbor_project/book_catalog_screen.dart';
import 'package:my_laptop_harbor_project/dashboard.dart';
import 'package:my_laptop_harbor_project/productcards.dart';

class Feed extends StatefulWidget {
   Feed({ key}) :super(key: key);
  

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final Color firestore = const Color.fromARGB(133, 30,62, 1);
  final Color secondColor = const Color.fromARGB(5, 38, 62, 1);
final msgController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
  title: Text("My  Feed Back Page"),
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
       
      body: SingleChildScrollView(
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Stack(
             children: [
          ClipPath(
            clipper: myClipper(),
            child: Container(
              width: double.infinity,
              height: 310,
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
               Color.fromARGB(255, 203, 59, 6),
               Color.fromARGB(255, 44, 43, 43),
                ]
              ),
              boxShadow: const[
                BoxShadow(
                  color: Color.fromARGB(255, 215, 104, 96),
      
                  blurRadius: 12,
                  offset: Offset(0, 6)
                )
              ]
              ),
            ),
          ),
        const Positioned(
          top:40,
          left: 25,
              child: Text('FeedBack', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 25),
              ),
             ),
          
        const Positioned(
          top:70,
          left: 25,
             child: Text('WelCome To Our Feed Back Form We Will Be Happy',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            ),
            ),
              const Positioned(
              top: 90,
              left: 25,
             child: Text('To Hear Your Opinion In Our App',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            ),
            ),
         const Positioned(
            top: 130,
            left:25,
            child:CircleAvatar(
              radius: 50,
              foregroundImage:AssetImage('assets/images/d.png',))),
        ],
          ),
          Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: Text("Tell Us How We can Improve",
                style:TextStyle(color: Colors.black,fontSize: 20,),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child:Container(
                       margin: EdgeInsets.symmetric(horizontal: 8.0),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                    controller: msgController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      maxLines: 10,
                      decoration: const  InputDecoration(
                        errorText: "",
                        hintText: "Write Here...",
                      ),
                    ),
                    )
                   
                  )
                ],
              ),
              const Center(
                child: Text(
                  'How WOuld You Rate Our App?',
                  style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => IconButton(
                  onPressed: (){} , 
                icon: Icon(
                  Icons.star_border_outlined,
                 color: Colors.red,size: 32,)
                 )),
              ),
              SizedBox(height: 5,),
              Center(
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:const Color.fromARGB(255, 4, 51, 5),
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                    child: const Text("Send Now",
                    style: TextStyle(color: Colors.white,fontFamily: '_alpha',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),)
                ),
              ),
              Stack(
                children: [
                  RotatedBox(
                    quarterTurns: 6,
                    child:  ClipPath(
                clipper: myClipper(),
               child: Container(
               width: double.infinity,
               height: 310,
               decoration: BoxDecoration(
               gradient: LinearGradient(
                colors: [
               Color.fromARGB(255, 203, 59, 6),
               Color.fromARGB(255, 44, 43, 43),
                ]
              ),
              boxShadow: const[
                BoxShadow(
                  color: Color.fromARGB(255, 215, 104, 96),
      
                  blurRadius: 12,
                  offset: Offset(0, 6)
                )
              ]
              ),
            ),
          ),
                  ),
                  const  Positioned(
                    right: 60,
                    top: 100,
                    child: CircleAvatar(
                    radius: 70,
                    foregroundImage: AssetImage('assets/images/d.png',),
                  ))
                ],
              )

            ],
          )
        ],
       
      ),)
    );
  }
}
class myClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(size.width /2, size.height, size.width, size.height - 300);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
    return false;
  }
  
}