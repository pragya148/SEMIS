import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ApplyLeave extends StatefulWidget {
  @override
  _ApplyLeaveState createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  String? _leaveType;
  String? _leaveDay;
  DateTime? _startDate;
  DateTime? _endDate;
  final TextEditingController _reasonController = TextEditingController();

  final List<String> leaveTypes = [
    'Sick Leave',
    'Personal Leave',
    'Week Leave'
  ];
  final List<String> leaveDays = ['One Day', 'Two Days'];

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    const Color greyColor = Colors.grey;
    const List<String> pages = ['Home', 'Profile', 'Settings', 'Logout'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply Leave'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Leave Type', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                hint: Text('Select Leave Type'),
                value: _leaveType,
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _leaveType = newValue!;
                  });
                },
                items: leaveTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text('Leave Day', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton<String>(
                hint: Text('Select Leave Day'),
                value: _leaveDay,
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _leaveDay = newValue!;
                  });
                },
                items: leaveDays.map((String day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text('Date', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, isStartDate: true),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: _startDate == null
                              ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                              : DateFormat('yyyy-MM-dd').format(_startDate!),
                          // ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                          // : DateFormat('yyyy-MM-dd').format(_startDate!),
                          suffixIcon:
                              Icon(Icons.calendar_today, color: greyColor),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text('to', style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context, isStartDate: false),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: _endDate == null
                              ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                              : DateFormat('yyyy-MM-dd').format(_endDate!),
                          suffixIcon:
                              Icon(Icons.calendar_today, color: greyColor),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Reason', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter the reason for your leave...',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Attachment', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Handle document upload
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: blueColor, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload Document',
                      style: TextStyle(color: blueColor),
                    ),
                    Icon(Icons.upload_file, color: blueColor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle leave application submission
              },
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                foregroundColor: whiteColor,
                backgroundColor: blueColor,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isStartDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != (isStartDate ? _startDate : _endDate)) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }
}
