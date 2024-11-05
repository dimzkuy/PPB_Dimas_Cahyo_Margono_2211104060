import 'package:flutter/material.dart';
import 'package:pertemuan73/models/product.dart';
import 'package:pertemuan73/pages/product_detail.dart';
import 'package:pertemuan73/main.dart'; // Import untuk akses showNotification

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 'p1',
      name: 'Kabel LAN',
      description: 'Kabel yang dapat menghubungkan koneksi internet',
      price: 30000,
      imageUrl:
          'https://www.vention.id/wp-content/uploads/2022/04/Vention-Network-Cable-Cat6-RJ45-Cable-Ethernet-Patch-Cable-For-XBox-Computer-Router-1m-2m-3m-1-1-600x600.jpg',
    ),
    Product(
      id: 'p2',
      name: 'Webcam HD',
      description:
          'Webcam dengan resolusi tinggi untuk panggilan video yang jernih.',
      price: 150000,
      imageUrl:
          'https://m.media-amazon.com/images/I/71iNwni9TsL._AC_SL1500_.jpg',
    ),
    Product(
      id: 'p3',
      name: 'Modem',
      description: 'Modem untuk koneksi internet yang cepat dan stabil.',
      price: 200000,
      imageUrl:
          'https://images.tokopedia.net/img/cache/200-square/VqbcmM/2024/7/16/954f4533-bff5-469f-a4ca-77b64c121dcd.jpg.webp?ect=4g',
    ),
    Product(
      id: 'p4',
      name: 'USB Flashdisk',
      description: 'USB Flashdisk berkapasitas besar untuk penyimpanan data.',
      price: 50000,
      imageUrl:
          'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/10/20/a37a23cf-5d33-40bd-a91d-723af7050625.jpg.webp?ect=4g',
    ),
    Product(
      id: 'p5',
      name: 'Charger Laptop',
      description: 'Charger Laptop baru yang dapat mengecas dengan hemat daya',
      price: 250000,
      imageUrl:
          'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/9/24/1395ffe8-2ce6-42a8-b7fd-901d00ffd782.png.webp?ect=4g',
    ),
  ];

  void onProductTap(BuildContext context, Product product) {
    // Menampilkan notifikasi saat produk diklik
    showNotification(product.name, "Harga: Rp${product.price}");

    // Navigasi ke halaman detail produk
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Walawe Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green, // AppBar berwarna hijau
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
            title: Text(product.name),
            subtitle: Text('Rp${product.price.toStringAsFixed(0)}'),
            onTap: () => onProductTap(context, product),
          );
        },
      ),
    );
  }
}
