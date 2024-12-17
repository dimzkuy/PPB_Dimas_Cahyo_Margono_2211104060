import 'package:get/get.dart';

class NotesViewModel extends GetxController {
  var notes = <Map<String, String>>[].obs;

  void addNote(String title, String description) {
    notes.add({"title": title, "description": description});
  }

  void deleteNote(int index) {
    notes.removeAt(index);
  }
}
