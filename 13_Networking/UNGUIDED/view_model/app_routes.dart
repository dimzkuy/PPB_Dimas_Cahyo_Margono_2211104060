import 'package:get/get.dart';
import '../view/home_view.dart';
import '../view/add_note_view.dart';

class AppRoutes {
  static const HOME = '/';
  static const ADD_NOTE = '/add-note';

  static final pages = [
    GetPage(name: HOME, page: () => HomeView()),
    GetPage(name: ADD_NOTE, page: () => AddNoteView()),
  ];
}
