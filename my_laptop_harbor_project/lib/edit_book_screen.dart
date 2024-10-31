import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/models/book.dart';
import 'package:my_laptop_harbor_project/services/firebase_service.dart';

class EditBookScreen extends StatefulWidget {
  final Book book;

  EditBookScreen({required this.book});

  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _genreController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _coverImageUrlController = TextEditingController();
  final _priceController = TextEditingController();
  final BookService bookService = BookService();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.book.title;
    _authorController.text = widget.book.author;
    _genreController.text = widget.book.genre;
    _descriptionController.text = widget.book.description;
    _coverImageUrlController.text = widget.book.coverImageUrl;
    _priceController.text = widget.book.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
  title: Text("My  Eidt  Product Screen"),
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

      body:Stack(
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
              height: 500,
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
               gradient: LinearGradient(
                 colors: [
                Color.fromARGB(255, 209, 124, 100),
                Color.fromARGB(255, 42, 136, 213),
                Color.fromARGB(255, 247, 244, 244),
                ]
              ),   
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: Column(
               children: [
          Text(" **_Edits  Product_**",
               style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.brown, ),),
 Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Brand'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a genre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _coverImageUrlController,
                decoration: InputDecoration(labelText: 'Cover Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a cover image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    final updatedBook = Book(
                      id: widget.book.id,
                      title: _titleController.text,
                      author: _authorController.text,
                      genre: _genreController.text,
                      description: _descriptionController.text,
                      coverImageUrl: _coverImageUrlController.text,
                      price: double.parse(_priceController.text),
                    );
                    bookService.updateBook(updatedBook).then((value) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Update Book'),
              ),
            ],
          ),
        ),
      ),
   ] ),
             ),
                         ),
     ],
      ));
  }
}
