import 'dart:io';

// Fungsi untuk mengecek apakah bilangan adalah bilangan prima
bool cekBilanganPrima(int angka) {
  if (angka <= 1) {
    return false; // Bilangan kurang dari atau sama dengan 1 bukan bilangan prima
  }
  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false; // Jika ada pembagi selain 1 dan angka itu sendiri, bukan bilangan prima
    }
  }
  return true; // Jika tidak ditemukan pembagi, maka bilangan prima
}

void main() {
  // Meminta input dari user dengan validasi
  print("Masukkan bilangan bulat: ");
  String? input = stdin.readLineSync();

  // Memeriksa apakah input valid
  if (input == null || input.isEmpty || int.tryParse(input) == null) {
    print("Input tidak valid. Harap masukkan bilangan bulat.");
    return;
  }

  int angka = int.parse(input);

  // Memanggil fungsi untuk mengecek apakah bilangan prima
  if (cekBilanganPrima(angka)) {
    print("$angka adalah bilangan prima");
  } else {
    print("$angka bukan bilangan prima");
  }
}
