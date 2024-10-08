import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:office/BottomNavigation/Attendance.dart';
import 'package:office/Files/ApplyLeave.dart';
import 'package:office/Files/Fees.dart';
import 'package:office/Files/NoticeBoard.dart';
import 'package:office/Homework/Subject.dart';
import 'package:office/TeachersProfile/TeacherProfile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    return Center(
                      child: Image.asset(item, fit: BoxFit.cover),
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
                                return SubjectList();
                              case 1:
                                return NoticeBoard();
                              case 2:
                                return Fees();
                              case 3:
                                return ApplyLeave();
                              case 4:
                                return Attendance();
                              case 5:
                                return Profile();
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
