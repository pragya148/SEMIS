import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:office/Files/ApplyLeave.dart';
import 'package:office/Files/Attendance.dart';
import 'package:office/Files/Fees.dart';
import 'package:office/Files/Profile.dart';
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
    Attendance(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;

    return Scaffold(
      appBar: _selectedIndex == 2
          ? AppBar(
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
            )
          : null,
      endDrawer: const MenuScreen(),
      body: _selectedIndex == 0
          ? const Center(child: Text('Chat Screen'))
          : _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: blueColor,
        // indicatorShape: Shape(),
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
            icon: Image.asset('assets/Attendance.png'),
            label: 'Attendance',
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;

    final List<String> imgList = [
      'assets/Frame241.png',
      'assets/Frame241.png',
      'assets/Frame241.png',
      'assets/Frame241.png',
      'assets/Frame241.png',
    ];

    final List<String> icons = [
      'assets/subjects.png',
      'assets/NoticeIcon.png',
      'assets/FeeIcon.png',
      'assets/leave.png',
      'assets/library.png',
      'assets/routine.png',
    ];

    final List<String> iconLabels = [
      'Subject',
      'Notice Board',
      'Fees',
      'Apply Leave',
      'Library',
      'Class Routine',
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0),
            const Text(
              'Event Updates',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 24 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      // You can use setState if you want to update the index
                    },
                  ),
                  items: imgList.map((item) {
                    return Container(
                      child: Center(
                        child: Image.asset(item, fit: BoxFit.cover),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Quick Links',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      color: blueColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(6, (index) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            switch (index) {
                              case 0:
                              // return SubjectList();
                              case 1:
                              // return NoticeBoardPage();
                              case 2:
                                return Fees();
                              case 3:
                                return ApplyLeave();
                              case 4:
                                return Attendance();
                              case 5:
                              //  return ClassRoutinePage();
                              default:
                                return Container();
                            }
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: blueColor,
                      backgroundColor: whiteColor,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      shadowColor: blueColor,
                      elevation: 5.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icons[index],
                          height: 40,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          iconLabels[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: blueColor),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
