import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          // 🔥 Banner
          SizedBox(
            height: 200,
            child: PageView(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text('Page 1'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text('Page 2'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text('Page 3'),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🔥 Row Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Button 1'),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Button 2'),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Button 3'),
                ),
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Button 4'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: const Center(
                    child: Text('2'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: const Center(
                    child: Text('2'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                  child: const Center(
                    child: Text('3'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}