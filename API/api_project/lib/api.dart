import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Toko extends StatefulWidget {
  const Toko({super.key});

  @override
  State<Toko> createState() => _TokoState();
}

class _TokoState extends State<Toko> {
  List data = [];
  bool isloading = true;

  Future ambilData() async {
    var response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      var hasil = json.decode(response.body);

      setState(() {
        data = hasil['products'];
        isloading = false;
      });
    } else {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toko Online"),
        centerTitle: true,
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // ===== PAGEVIEW (BANNER) =====
                SizedBox(
                  height: 200,
                  child: PageView(
                    children: data.take(5).map((item) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(item['thumbnail']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          color: Colors.black54,
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            item['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // ===== LIST PRODUK =====
                Expanded(
                  child: ListView(
                    children: data.map((item) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            // Gambar
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(12),
                              ),
                              child: Image.network(
                                item['thumbnail'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // Info
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item['description'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "\$${item['price']}",
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
    );
  }
}