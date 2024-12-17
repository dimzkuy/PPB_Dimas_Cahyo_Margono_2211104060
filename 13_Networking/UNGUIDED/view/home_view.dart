import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/notes_view_model.dart';
import '../view_model/app_routes.dart';

class HomeView extends StatelessWidget {
  final NotesViewModel viewModel = Get.put(NotesViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50], // Warna latar belakang
      appBar: AppBar(
        title: Text(
          'Catatan Sederhana',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple, // Warna AppBar
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (viewModel.notes.isEmpty) {
            return Center(
              child: Text(
                'Belum ada catatan.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: viewModel.notes.length,
            itemBuilder: (context, index) {
              final note = viewModel.notes[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  title: Text(
                    note['title'] ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                  subtitle: Text(
                    note['description'] ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.redAccent, size: 28),
                    onPressed: () => viewModel.deleteNote(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.ADD_NOTE),
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
