void main() {
//   // 1. Penamaan variabel menggunakan camelCase
//   String firstName, lastName; // Tipe data String
//   firstName = "Praktikum";
//   lastName = "PPB";

//   print("Nama Lengkap: $firstName $lastName");

  // // 2. Statement If-Else
  // var open = 8;
  // var close = 17;
  // var now = 12;

  // if (now >= open && now < close) {
  //   print("Toko Buka");
  // } else if (now == 12) {
  //   print("Toko Sedang Istirahat");
  // } else {
  //   print("Toko Tutup");
  // }

  // Condition ? true ; false
  // var toko = now > open ? "Toko Buka" : "Toko Tutup";
  // print(toko);

  // 3. Switch Case untuk Pemilihan nilai

  var grade = 'b';

  switch (grade) {
    case 'a':
      print("Nilai Sangat Bagus");
      break;
    case 'b':
      print("Nilai Bagus");
    case 'c':
      print("Nilai Cukup");
      break;
    default:
      print("Nilai tidak tersedia");
  }
}
