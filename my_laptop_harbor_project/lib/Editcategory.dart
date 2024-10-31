import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Editcategory extends StatefulWidget {
  final String postId;
  final String title;
  final String description;

  Editcategory(
      {required this.postId, required this.title, required this.description});

  @override
  _EditcategoryState createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Post');
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    desController.text = widget.description;
  }

  void _updatePost() async {
    String title = titleController.text;
    String description = desController.text;

    await ref.child(widget.postId).update({
      'title':title,
      'description': description,
    });

    Fluttertoast.showToast(msg: "Post updated");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  title: Text("Edit Category Page"),
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
        
             Center(
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
          Text(" **_Edits  Category_**",
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
            SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updatePost,
                child: Text('Update Category'),
              ),
               ],
             ),
     ),
       ),
        
       // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     children: [
      //       TextField(
      //         controller: postController,
      //         decoration: InputDecoration(labelText: 'Title'),
      //       ),
      //       TextField(
      //         controller: desController,
      //         decoration: InputDecoration(labelText: 'Description'),
      //       ),
      //       SizedBox(height: 20),
      //       ElevatedButton(
      //         onPressed: _updatePost,
      //         child: Text('Update Post'),
      //       ),
      //     ],
      //   ),
      // ),
       ]
       ),
    );
  }
}
