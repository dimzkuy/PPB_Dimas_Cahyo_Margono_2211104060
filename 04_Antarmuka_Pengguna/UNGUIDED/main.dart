import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WisataScreen(),
    );
  }
}

class WisataScreen extends StatelessWidget {
  final List<Map<String, String>> wisataList = [
    {
      'nama': 'Bukit Bintang',
      'deskripsi':
          'Bukit Bintang Baturraden telah menjadi tujuan wisata malam populer di Purwokerto, menawarkan pemandangan alam yang sangat eksotis yang menarik banyak anak muda untuk berkumpul di malam hari. Dikenal sebagai opsi utama bagi mereka yang ingin menyaksikan gemerlap malam kota Purwokerto dan Kabupaten Banyumas dari ketinggian, bukit ini memberikan pengalaman tak terlupakan.',
      'gambar':
          'https://cdn.idntimes.com/content-images/post/20240117/bukit-bintang-baturaden-1e502765b7186545726cac3fb47027d1.jpg'
    },
    {
      'nama': 'Curug Bayan',
      'deskripsi':
          'Curug Bayan merupakan salah satu obyek wisata di lereng Gunung Slamet yang menarik untuk dikunjungi bersama keluarga. Kawasan wisata Curug Bayan juga menjadi tempat yang sesuai untuk melepas penat sejenak dari rutinitas.',
      'gambar':
          'https://static.banyumaskab.go.id/website/images/website_1909190837115d82dbc74b931.jpg'
    },
    {
      'nama': 'Taman Mas Kemambang',
      'deskripsi':
          'Taman Mas Kemambang merupakan tempat wisata di Purwokerto yang tengah gencar-gencarnya dipromosikan oleh pemerintah setempat. Taman yang merupakan Ruang Terbuka Hijau (RTH) ini berdiri di atas lahan seluas 1,2 hektar.',
      'gambar':
          'https://asset.kompas.com/crops/x5j-YX6EiYExsxLdhiSm0tQOfy8=/0x13:980x666/750x500/data/photo/2022/06/04/629af819672a2.jpg'
    },
    {
      'nama': 'Hutan Pinus Limpakuwus',
      'deskripsi':
          'Hutan Pinus Limpakuwus merupakan hutan yang berada di kawasan wisata Baturaden, yang berada di ketinggian 750 mdpl. Tempat ini cocok menjadi tempat wisata dari berbagai kalangan. Tidak hanya pemandangnnya saja yang indah, Hutan Pinus limpakuwus juga memiliki fasilitas penunjang seperti montain slide, playground, flyng fox, paint ball, ATV, dan bahkan tersedia Camping Ground yang bisa disewa untuk bermalam. Fasilitasnnya cukup lengkap sehingga akan memanjakan pariwisatawan yang datang.',
      'gambar':
          'https://lh5.googleusercontent.com/p/AF1QipOxO4Wtfa429yCcezcT535z_SYZTzDZhbrkuKw=w1080-h624-n-k-no'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rekomendasi Wisata',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white, // Menambahkan warna putih pada teks
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    wisata['nama']!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.network(
                    wisata['gambar']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    wisata['deskripsi']!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol diklik
                    },
                    child: Text('Kunjungi Sekarang!'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
