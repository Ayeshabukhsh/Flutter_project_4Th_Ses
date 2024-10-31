import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_laptop_harbor_project/models/book.dart';

class BookService {
  final CollectionReference booksCollection =
      FirebaseFirestore.instance.collection('books');

  Future<void> addBook(Book book) {
    return booksCollection.add(book.toMap());
  }

  Future<List<Book>> fetchBooks() async {
    QuerySnapshot snapshot = await booksCollection.get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> updateBook(Book book) {
    return booksCollection.doc(book.id).update(book.toMap());
  }

  Future<void> deleteBook(String id) {
    return booksCollection.doc(id).delete();
  }

  Future<void> addToCart(Book book, String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(book.id)
        .set(book.toMap());
  }

  Future<void> removeFromCart(String bookId, String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(bookId)
        .delete();
  }

  Future<List<Book>> fetchCart(String userId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<void> addToWishlist(Book book, String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist')
        .doc(book.id)
        .set(book.toMap());
  }

  Future<void> removeFromWishlist(String bookId, String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist')
        .doc(bookId)
        .delete();
  }

  Future<List<Book>> fetchWishlist(String userId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wishlist')
        .get();
    return snapshot.docs
        .map((doc) => Book.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
