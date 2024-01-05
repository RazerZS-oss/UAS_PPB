import 'package:flutter/material.dart';

class BBMPage extends StatefulWidget {
  @override
  _BBMPageState createState() => _BBMPageState();
}

class _BBMPageState extends State<BBMPage> {
  TextEditingController _litersController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  double _result = 0.0;

  void _calculateBBM() {
    setState(() {
      double liters = double.tryParse(_litersController.text) ?? 0.0;
      double price = double.tryParse(_priceController.text) ?? 0.0;
      _result = (liters * price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengisian BBM'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon kembali
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _litersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah Liter BBM'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga per Liter'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _calculateBBM();
              },
              child: Text('Hitung'),
            ),
            SizedBox(height: 16),
            Text(
              'Total Biaya: $_result',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BBMPage(),
  ));
}