import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("judul"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            
            Container(
              margin: EdgeInsets.all(10),
              height: 150,
              color: Colors.red,
            ),

            
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 80,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}