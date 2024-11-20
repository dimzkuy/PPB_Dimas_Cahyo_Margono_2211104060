import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class FormPage extends StatefulWidget {
  final Map<String, dynamic>?
      item; // Data untuk edit (null jika tambah data baru)

  const FormPage({Key? key, this.item}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Jika item tidak null, berarti ini mode edit, maka isi form dengan data
    if (widget.item != null) {
      _nameController.text = widget.item!['name'];
      _nimController.text = widget.item!['nim'];
      _addressController.text = widget.item!['address'];
      _hobbyController.text = widget.item!['hobby'];
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _addressController.dispose();
    _hobbyController.dispose();
    super.dispose();
  }

  // Simpan data ke database
  void _saveData() async {
    if (_nameController.text.isEmpty ||
        _nimController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _hobbyController.text.isEmpty) {
      // Tampilkan pesan error jika ada input kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom harus diisi!')),
      );
      return;
    }

    if (widget.item == null) {
      // Tambah data baru
      await dbHelper.insert({
        'name': _nameController.text,
        'nim': _nimController.text,
        'address': _addressController.text,
        'hobby': _hobbyController.text,
      });
    } else {
      // Update data yang ada
      await dbHelper.update({
        'id': widget.item!['id'],
        'name': _nameController.text,
        'nim': _nimController.text,
        'address': _addressController.text,
        'hobby': _hobbyController.text,
      });
    }

    Navigator.pop(context, true); // Kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null
            ? 'Tambah Biodata Mahasiswa'
            : 'Edit Biodata Mahasiswa'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nimController,
                decoration: InputDecoration(
                  labelText: 'NIM',
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  prefixIcon: const Icon(Icons.home),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _hobbyController,
                decoration: InputDecoration(
                  labelText: 'Hobi',
                  prefixIcon: const Icon(Icons.interests),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  onPressed: _saveData,
                  child: const Text('Simpan', style: TextStyle(fontSize: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
