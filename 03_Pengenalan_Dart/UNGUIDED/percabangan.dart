import 'dart:io';

void main() {
  // Menggunakan stdout.write untuk menampilkan pesan input tanpa pindah baris
  stdout.write("Masukkan nilai (angka bulat): ");

  // Mengambil input dari pengguna
  String? input = stdin.readLineSync();

  // Memeriksa apakah input valid
  if (input == null || input.isEmpty || int.tryParse(input) == null) {
    print("Input tidak valid. Harap masukkan angka bulat.");
    return;
  }

  int nilai = int.parse(input);

  // Mengecek apakah nilai kurang dari atau sama dengan 40, jika ya maka nilai digandakan
  if (nilai <= 40 && nilai > 0) {
    nilai = nilai * 10; // Menggandakan nilai jika <= 40 dan > 0
  }

  // Memanggil fungsi untuk menentukan nilai setelah digandakan (jika <= 40)
  String hasil = tentukanNilai(nilai);

  if (hasil.isEmpty) {
    print("");
  } else {
    print("$nilai merupakan $hasil");
  }
}

String tentukanNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return ""; // Kondisi else: Nilai tidak memenuhi kriteria A, B, atau C
  }
}
