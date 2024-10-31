import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/models/book.dart';
import 'package:my_laptop_harbor_project/services/firebase_service.dart';

class CartProvider with ChangeNotifier {
  final BookService bookService = BookService();
  List<Book> _cart = [];
  final String userId;

  CartProvider({required this.userId}) {
    fetchCart();
  }

  List<Book> get cart => _cart;

  Future<void> fetchCart() async {
    _cart = await bookService.fetchCart(userId);
    notifyListeners();
  }

  Future<void> addBook(Book book) async {
    await bookService.addToCart(book, userId);
    _cart.add(book);
    notifyListeners();
  }

  Future<void> removeBook(Book book) async {
    await bookService.removeFromCart(book.id, userId);
    _cart.remove(book);
    notifyListeners();
  }
}
