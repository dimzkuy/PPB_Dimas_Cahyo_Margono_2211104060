import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Quicksand',
      ),
      home: const MyProfilePage(),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int _selectedIndex = 0; // Track footer navigation

  // Change index when footer item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.lightBlue[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Rounded rectangle pertama: Nama, ID, Software Engineering, dan Foto Profil
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity, // Mengisi lebar penuh layar
                      margin: const EdgeInsets.only(
                        top:
                            16, // Jarak ke atas untuk menghindari dempet dengan AppBar
                        bottom: 16, // Jarak ke kontainer berikutnya
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // Shadow offset
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.red,
                                      width: 4,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                        'assets/images/fotoprofil.png'),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Dimas Cahyo Margono',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        '2211104060',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              255, 199, 199, 199),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'S1 Software Engineering',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromARGB(
                                              255, 199, 199, 199),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        height: 36,
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            // Logic for edit profile button
                                          },
                                          icon:
                                              const Icon(Icons.edit, size: 20),
                                          label: const Text('Edit Profile'),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            backgroundColor: Colors.blue,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Rounded rectangle kedua: Interests, About Me, dan Contact
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity, // Mengisi lebar penuh layar
                      margin: const EdgeInsets.only(
                        top: 0, // Tidak menambah jarak ke atas
                        bottom: 32, // Jarak ke bawah layar agar lebih renggang
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Interests',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                InterestItem(
                                  icon: Icons.videogame_asset,
                                  label: 'Bermain Game',
                                ),
                                InterestItem(
                                  icon: Icons.music_note,
                                  label: 'Mendengarkan Musik',
                                ),
                                InterestItem(
                                  icon: Icons.brush,
                                  label: 'Design Grafis',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'About Me',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Be yourself and never surrender',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Contact',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                ContactItem(
                                  icon: Icons.email,
                                  label: 'Email',
                                  info: 'dimascahyomg855@gmail.com',
                                ),
                                SizedBox(height: 8),
                                ContactItem(
                                  icon: Icons.phone,
                                  label: 'Phone',
                                  info: '085313171368',
                                ),
                                SizedBox(height: 8),
                                ContactItem(
                                  icon: Icons.public,
                                  label: 'Social Media',
                                  info: '@dmzmrgno',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Section for Skills
                          const Text(
                            'Skills',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                SkillsItem(
                                  icon: Icons.code,
                                  label: 'HTML',
                                ),
                                SkillsItem(
                                  icon: Icons.brush,
                                  label: 'CSS',
                                ),
                                SkillsItem(
                                  icon: Icons.javascript,
                                  label: 'JavaScript',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, // Warna latar belakang footer
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Widget untuk ContactItem
class ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String info;

  const ContactItem(
      {Key? key, required this.icon, required this.label, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 36),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                info,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Widget untuk InterestItem
class InterestItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const InterestItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 36),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

// Widget untuk SkillsItem
class SkillsItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SkillsItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 36),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
