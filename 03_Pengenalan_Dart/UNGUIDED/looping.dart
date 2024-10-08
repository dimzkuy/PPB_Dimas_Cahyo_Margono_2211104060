import 'dart:io';

void main() {
  // Meminta input tinggi piramida dari user dengan validasi
  print("Masukkan tinggi piramida (angka bulat positif): ");
  String? input = stdin.readLineSync();

  // Memeriksa apakah input valid
  if (input == null || input.isEmpty || int.tryParse(input) == null) {
    print("Input tidak valid. Harap masukkan angka bulat positif.");
    return;
  }

  int tinggi = int.parse(input);

  if (tinggi <= 0) {
    print(
        "Input tidak valid. Harap masukkan angka bulat positif yang lebih besar dari nol.");
    return;
  }

  // Membuat piramida bintang
  buatPiramidaBintang(tinggi);
}

void buatPiramidaBintang(int tinggi) {
  for (int i = 1; i <= tinggi; i++) {
    // Menambahkan spasi
    stdout.write(" " * (tinggi - i));
    // Menambahkan bintang
    stdout.write("*" * (2 * i - 1));
    // Pindah ke baris berikutnya
    print("");
  }
}
