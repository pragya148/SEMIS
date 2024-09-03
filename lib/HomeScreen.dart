import 'package:flutter/material.dart';
import 'package:office/Clip.dart';
import 'package:office/Files/HomeWorkList.dart';
import 'package:office/Files/Profile.dart';
import 'package:office/Home.dart';
import 'package:office/MenuScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    const Center(child: Text('Chat Screen')),
    const Center(child: Text('Notifications Screen')),
    Home(),
    HomeWorkList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;

    return Scaffold(
      appBar: _selectedIndex == 2
          ? PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: ClipPath(
                clipper: CustomClipperShape(),
                child: AppBar(
                  backgroundColor: Colors.white,
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
      body: _selectedIndex == 0
          ? const Center(child: Text('Chat Screen'))
          : _pages[_selectedIndex],
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
              decoration: BoxDecoration(color: blueColor),
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
