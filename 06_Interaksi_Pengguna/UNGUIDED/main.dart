import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan BottomNavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tetap menggunakan warna biru
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomePageContent(),
    const Center(child: Text('Ini Halaman Wisata')),
    const Center(child: Text('Ini Halaman Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        backgroundColor: Colors.blue, // Tetap menggunakan warna biru
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Warna item yang dipilih biru
        unselectedItemColor:
            Colors.grey, // Warna item yang tidak dipilih abu-abu
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Menyelaraskan ke kiri
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Masukkan Nama',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Masukkan Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan aksi submit di sini
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blue, // Warna tombol submit menjadi biru
              ),
            ),
          ),
        ],
      ),
    );
  }
}
