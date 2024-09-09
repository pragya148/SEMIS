import 'package:flutter/material.dart';
import 'package:office/BottomNavigation/Chat.dart';
import 'package:office/Files/Clip.dart';
import 'package:office/HomeScreen/Home.dart';
import 'package:office/HomeScreen/MenuScreen.dart';
import 'package:office/Homework/HomeWorkList.dart';
import 'package:office/TeachersProfile/TeacherInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;
  int _current = 0;

  void _onButtonPressed(int index) {
    print("Button $index pressed");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> imgList = [
    'assets/Frame241.png',
    'assets/Frame241.png',
    'assets/Frame241.png',
    'assets/Frame241.png',
    'assets/Frame241.png',
  ];

  final List<Widget> _pages = [
    const ChatPage(),
    const Center(child: Text('Notifications Screen')),
    const Home(),
    const HomeWorkList(),
    const TeacherInfo(
      name: 'Abhilish Arya',
      dob: '2056/02/14',
      gender: 'Male',
      bloodGroup: 'O +ve',
      experience: '8 years',
      expertise: 'Mathematics',
      phoneNumber: '9866545790',
      address: 'Dhobighat -04, Jhamisikhel',
      joinedDate: '8 June 2023',
      photo: 'assets/Abhilish.png',
    )
  ];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;

    return Scaffold(
      appBar: _selectedIndex == 2
          ? PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: ClipPath(
                clipper: CustomClipperShape(),
                child: AppBar(
                  backgroundColor: whiteColor,
                  toolbarHeight: 80.0,
                  leading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/Young.png'),
                    ),
                  ),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back, ',
                        style: TextStyle(
                          color: blueColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Emily Sheran',
                        style: TextStyle(
                          color: blueColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu_open, color: blueColor),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : null,
      endDrawer: const MenuScreen(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: blueColor,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: [
          NavigationDestination(
            icon: Image.asset('assets/chat.png'),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Image.asset('assets/notification.png'),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Container(
              child: Image.asset('assets/dashboard.png'),
              decoration: const BoxDecoration(color: blueColor),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Container(
              child: Image.asset('assets/homework.png'),
              decoration: const BoxDecoration(color: blueColor),
            ),
            label: 'Homework',
          ),
          NavigationDestination(
            icon: Image.asset('assets/profile.png'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
