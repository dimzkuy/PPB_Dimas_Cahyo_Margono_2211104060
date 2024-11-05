import 'package:flutter/material.dart';
import 'package:pertemuan73/models/product.dart';
import 'package:pertemuan73/main.dart'; // Import untuk akses showNotification

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Teks tidak di tengah
          children: [
            Center(
              child: Image.network(
                product.imageUrl,
                height: 250, // Memperbesar ukuran gambar
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rp${product.price.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tampilkan notifikasi "Produk berhasil dimasukkan ke keranjang!"
                  showNotification("Terima Kasih!",
                      "Produk berhasil dimasukkan ke keranjang!");
                },
                child: Text("Beli Produk"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
