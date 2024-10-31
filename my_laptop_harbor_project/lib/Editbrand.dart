import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Editbrand extends StatefulWidget {
  final String brandId;
  final String title;
  final String description;

  Editbrand(
      { required this.brandId , required this.title, required this.description});

  @override
  _EditbrandState createState() => _EditbrandState();
}

class _EditbrandState extends State<Editbrand> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Brand');
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    desController.text = widget.description;
  }
void _updateBrand() async {
    String title = titleController.text;
    String description = desController.text;

    await ref.child(widget.brandId).update({
      'title':title,
      'description': description,
    });

    Fluttertoast.showToast(msg: "Brand updated");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  title: Text("My  Edit Brand Page"),
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
         padding: const EdgeInsets.only(left: 300,top: 50,),
         child:  Container(
              width: 800,
              height: 400,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                //color: const Color.fromARGB(255, 131, 175, 211),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
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
          Text(" ****_Edits  Brand_***",
               style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.brown, ),),
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
              labelText: "  Brand Name", 
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
              labelText: "Brand Description", border:  OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          ),
           TextField( ),
            SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateBrand,
                child: Text('Update Brand'),
              ),
               ],
              ),
              ),),
       ]),
    );
  }
}
