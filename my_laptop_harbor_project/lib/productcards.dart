import 'package:flutter/material.dart';
import 'package:my_laptop_harbor_project/models/book.dart';
import 'package:my_laptop_harbor_project/services/firebase_service.dart';

class ProductCardScreen extends StatefulWidget {
  @override
  _ProductCardScreenState createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  final BookService bookService = BookService();
  List<Book> cart = [];
  List<Book> wishlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
 AppBar(
  title: Text("My Product Card"),
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

        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to Cart Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navigate to Wishlist Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WishlistScreen(wishlist: wishlist)),
              );
            },
          ),
           IconButton(
            icon: Icon(Icons.check_box),
            onPressed: () {
              // Navigate to Wishlist Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WishlistScreen(wishlist: wishlist)),
              );
            },
          ),
         
        ],
      ),
      body: FutureBuilder<List<Book>>(
        future: bookService.fetchBooks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final books = snapshot.data ?? [];
            return LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 4; // Web view
                } else {
                  crossAxisCount = 2; // Tablet and mobile view
                }

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // Number of cards in a row
                    childAspectRatio: 0.7, // Aspect ratio of each card
                  ),
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(book.coverImageUrl,
                                  width: double.infinity, fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, size: 100);
                              }),
                            ),
                            SizedBox(height: 10),
                            Text(
                              book.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'by ${book.author}',
                              style: TextStyle(fontSize: 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '\$${book.price.toString()}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.add(book);
                                    });
                                  },
                                  child: Text('Add to Cart'),
                                ),
                                IconButton(
                                  icon: Icon(
                                    wishlist.contains(book)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: wishlist.contains(book)
                                        ? Colors.red
                                        : null,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (wishlist.contains(book)) {
                                        wishlist.remove(book);
                                      } else {
                                        wishlist.add(book);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Book> cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final book = cart[index];
          return ListTile(
            leading: Image.network(book.coverImageUrl,
                errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            }),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: Text('\$${book.price.toString()}'),
          );
        },
      ),
    );
  }
}

class WishlistScreen extends StatelessWidget {
  final List<Book> wishlist;

  WishlistScreen({required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final book = wishlist[index];
          return ListTile(
            leading: Image.network(book.coverImageUrl,
                errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            }),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: Text('\$${book.price.toString()}'),
          );
        },
      ),
    );
  }
}
