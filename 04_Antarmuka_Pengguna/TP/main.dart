import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WisataScreen(),
    );
  }
}

class WisataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Rekomendasi Wisata',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Taman Mini Indonesia Indah (TMII)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://kcic.co.id/lkapp/wp-content/uploads/2021/06/Keong-Emas-TMII.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Taman Mini Indonesia Indah merupakan suatu taman hiburan bertemakan kebudayaan Indonesia di Jakarta Timur, DKI Jakarta, yang memiliki area seluas kurang lebih 147 hektare atau 1,47 kilometer persegi.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Kunjungi Sekarang!'),
            ),
          ],
        ),
      ),
    );
  }
}
