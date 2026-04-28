import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // 🔥 AMBIL DATA API
  void getData() async {
    var url = Uri.parse("https://dummyjson.com/products");
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      setState(() {
        products = data['products'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      // 🔝 APPBAR + SEARCH BAR
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "Cari produk...",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(width: 10),
          Icon(Icons.chat),
          SizedBox(width: 10),
        ],
      ),

      // 📦 BODY
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: products.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                var item = products[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      // 🖼️ GAMBAR
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10)),
                        child: Image.network(
                          item['thumbnail'],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            // 📝 NAMA
                            Text(
                              item['title'],
                              maxLines: 2,
                              overflow:
                                  TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold),
                            ),

                            SizedBox(height: 5),

                            // ⭐ RATING
                            Text(
                              "Rating: ${item['rating']}",
                              style: TextStyle(
                                  fontSize: 12),
                            ),

                            SizedBox(height: 5),

                            // 💰 HARGA
                            Text(
                              "Rp ${item['price']}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight:
                                      FontWeight.bold),
                            ),

                            SizedBox(height: 5),

                            // 📦 STOCK
                            Text(
                              "Stock: ${item['stock']}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),

      // 🔻 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Akun"),
        ],
      ),
    );
  }
}