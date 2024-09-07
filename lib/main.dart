import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingCart(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int pulloverCount = 1;
  int tShirtCount = 1;
  int sportDressCount = 1;

  int pulloverPrice = 51;
  int tShirtPrice = 30;
  int sportDressPrice = 43;

  int get totalAmount {
    return (pulloverCount * pulloverPrice) +
        (tShirtCount * tShirtPrice) +
        (sportDressCount * sportDressPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bag'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            itemRow('Pullover', 'Black', 'L', pulloverCount, pulloverPrice,
                    (value) {
                  setState(() {
                    pulloverCount = value;
                  });
                }),
            SizedBox(height: 10),
            itemRow('T-Shirt', 'Gray', 'L', tShirtCount, tShirtPrice, (value) {
              setState(() {
                tShirtCount = value;
              });
            }),
            SizedBox(height: 10),
            itemRow('Sport Dress', 'Black', 'M', sportDressCount,
                sportDressPrice, (value) {
                  setState(() {
                    sportDressCount = value;
                  });
                }),
            Spacer(),
            Divider(),
            totalAmountRow(),
            SizedBox(height: 10),
            checkoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget itemRow(String title, String color, String size, int count, int price,
      ValueChanged<int> onChanged) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png', // Replace with your image asset path
          width: 50,
          height: 50,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16)),
            Text('Color: $color', style: TextStyle(color: Colors.grey)),
            Text('Size: $size', style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (count > 1) onChanged(count - 1);
              },
            ),
            Text('$count', style: TextStyle(fontSize: 16)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                onChanged(count + 1);
              },
            ),
          ],
        ),
        SizedBox(width: 10),
        Text('\$${price * count}', style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget totalAmountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total amount:', style: TextStyle(fontSize: 18)),
        Text('\$$totalAmount', style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget checkoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Congratulations! Checkout successful.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Text('CHECK OUT'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
