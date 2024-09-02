import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:office/Files/ApplyLeave.dart';
import 'package:office/LeaveStatus.dart';
import 'package:table_calendar/table_calendar.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool isAttendanceSelected = true;
  bool showFloatingButton =
      true; // Flag to show/hide the floating action button

  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const List<String> pages = [
      'Home',
      'Profile',
      'Settings',
      'Logout',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(isAttendanceSelected ? 'Attendance' : 'Leave Status'),
        backgroundColor: Colors.white,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down, color: blueColor),
              items: pages.map((String page) {
                return DropdownMenuItem<String>(
                  value: page,
                  child: Text(
                    page,
                    style: const TextStyle(color: blueColor),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle navigation to other pages
                print('Selected page: $newValue');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/Young.png'),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAttendanceSelected = true;
                        showFloatingButton =
                            true; // Show FAB on Attendance screen
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isAttendanceSelected ? blueColor : Colors.grey,
                    ),
                    child: Text(
                      'Attendance',
                      style: TextStyle(
                        color: isAttendanceSelected ? Colors.white : blueColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isAttendanceSelected = false;
                        showFloatingButton =
                            false; // Hide FAB on Leave Status screen
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !isAttendanceSelected ? blueColor : Colors.grey,
                    ),
                    child: Text(
                      'Leave Status',
                      style: TextStyle(
                        color: !isAttendanceSelected ? Colors.white : blueColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (isAttendanceSelected) ...[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2000, 1, 1),
                    lastDay: DateTime.utc(2100, 12, 31),
                    focusedDay: focusedDay,
                    calendarFormat: calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      setState(() {
                        this.focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: blueColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      selectedDecoration: BoxDecoration(
                        color: blueColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      todayTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(color: blueColor, fontSize: 18),
                      leftChevronIcon:
                          Icon(Icons.arrow_back_ios, color: blueColor),
                      rightChevronIcon:
                          Icon(Icons.arrow_forward_ios, color: blueColor),
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDonutChart(
                      'School days',
                      blueColor,
                      20,
                      10,
                    ),
                    _buildDonutChart(
                      'Present days',
                      Colors.green,
                      30,
                      5,
                    ),
                    _buildDonutChart(
                      'Absent days',
                      Colors.red,
                      20,
                      100,
                    ),
                  ],
                ),
              ] else ...[
                Expanded(child: LeaveListScreen()),
              ],
            ],
          ),
          if (showFloatingButton && isAttendanceSelected)
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplyLeave()),
                  );
                },
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 10.0,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/ApplyLeave.png',
                      color: blueColor,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDonutChart(
      String title, Color color, double value1, double value2) {
    double valueDifference = value2 - value1;
    return Container(
      height: 100,
      width: 100,
      child: Column(
        children: [
          SizedBox(
            width: 05,
            height: 20,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: color,
                    value: value1,
                    title: '$value1%',
                    radius: 20,
                    titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  PieChartSectionData(
                    color: color.withOpacity(0.3),
                    value: value2,
                    title: '$value2%',
                    radius: 20,
                    titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  PieChartSectionData(
                    color: color.withOpacity(0.1),
                    value: value2,
                    title: '$valueDifference%',
                    radius: 20,
                    titleStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ],
                centerSpaceRadius: 30,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
