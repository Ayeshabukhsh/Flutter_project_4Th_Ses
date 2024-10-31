import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/models/book.dart';
import 'package:my_laptop_harbor_project/services/firebase_service.dart';

class WishlistProvider with ChangeNotifier {
  final BookService bookService = BookService();
  List<Book> _wishlist = [];
  final String userId;

  WishlistProvider({required this.userId}) {
    fetchWishlist();
  }

  List<Book> get wishlist => _wishlist;

  Future<void> fetchWishlist() async {
    _wishlist = await bookService.fetchWishlist(userId);
    notifyListeners();
  }

  Future<void> toggleBook(Book book) async {
    if (_wishlist.contains(book)) {
      await bookService.removeFromWishlist(book.id, userId);
      _wishlist.remove(book);
    } else {
      await bookService.addToWishlist(book, userId);
      _wishlist.add(book);
    }
    notifyListeners();
  }
}
