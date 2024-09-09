import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Pullover', 'color': 'Black', 'size': 'L', 'price': 51, 'image': 'assets/images/pullover.png'},
    {'name': 'T-Shirt', 'color': 'Gray', 'size': 'L', 'price': 30, 'image': 'assets/images/tshirt.png'},
    {'name': 'Sport Dress', 'color': 'Black', 'size': 'M', 'price': 43, 'image': 'assets/images/sport_dress.png'},
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount = items.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Bag',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(items[index]['image'], width: 50, height: 50),
                  title: Text(items[index]['name']),
                  subtitle: Text('Color: ${items[index]['color']} | Size: ${items[index]['size']}'),
                  trailing: Text('\$${items[index]['price']}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total amount: \$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'CHECK OUT',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
