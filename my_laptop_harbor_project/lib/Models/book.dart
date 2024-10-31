import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String genre;
  final String description;
  final String coverImageUrl;
  final double price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.description,
    required this.coverImageUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'genre': genre,
      'description': description,
      'coverImageUrl': coverImageUrl,
      'price': price,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map, String id) {
    return Book(
      id: id,
      title: map['title'],
      author: map['author'],
      genre: map['genre'],
      description: map['description'],
      coverImageUrl: map['coverImageUrl'],
      price: map['price'],
    );
  }
}
