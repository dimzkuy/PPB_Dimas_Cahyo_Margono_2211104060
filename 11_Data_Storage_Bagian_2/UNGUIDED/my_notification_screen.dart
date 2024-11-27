import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Variabel global
String? token;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description:
      'This channel is used for important notifications.', // Deskripsi Channel
  importance: Importance.high, // Prioritas
);

class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    // Membuat pengaturan inisialisasi notifikasi untuk Android
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FlutterLocalNotificationsPlugin().initialize(initializationSettings);

    // Mendengarkan pesan saat aplikasi aktif
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Notifikasi diklik: ${message.notification?.title}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Detail Notifikasi"),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Judul: ${notification.title ?? 'Tidak Ada Judul'}"),
                  Text("Isi: ${notification.body ?? 'Tidak Ada Isi'}"),
                  const SizedBox(height: 10),
                  const Text("Informasi Pengirim:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("Nama: Dimas Cahyo Margono"),
                  const Text("NIM: 2211104060"),
                  const Text("Kelas: SE-06-02"),
                  const Text("Prodi: S1 Software Engineering"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Tutup"),
              ),
            ],
          ),
        );
      }
    });

    // Memanggil metode untuk mengambil token FCM perangkat
    getToken();
  }

  // Metode untuk mendapatkan token FCM
  void getToken() async {
    token = await FirebaseMessaging.instance
        .getToken(); // Mendapatkan token FCM perangkat
    print('FCM Token: $token'); // Menampilkan token di log
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notification Screen"),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text("Halaman untuk menerima notifikasi"),
      ),
    );
  }
}
