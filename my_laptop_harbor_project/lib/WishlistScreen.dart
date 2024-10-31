import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_laptop_harbor_project/models/book.dart';
import 'package:my_laptop_harbor_project/providers/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistProvider>(context).wishlist;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final book = wishlist[index];
          return ListTile(
            leading: Image.network(
              book.coverImageUrl,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error);
              },
            ),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: Text('\$${book.price.toString()}'),
          );
        },
      ),
    );
  }
}
