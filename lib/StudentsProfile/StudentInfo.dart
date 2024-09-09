import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final String name;
  final String classInfo;
  final String dob;
  final String gender;
  final String bloodGroup;
  final List<String> galleryImages;
  final String image;

  const StudentInfo({
    Key? key,
    required this.name,
    required this.classInfo,
    required this.dob,
    required this.gender,
    required this.bloodGroup,
    required this.galleryImages,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name, ',
              style: TextStyle(
                color: blueColor,
                fontSize: 18,
              ),
            ),
            Text(
              'Class: $classInfo',
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
                icon: Image.asset('assets/ApplyLeave.png'),
                onPressed: () {},
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              // offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student Info',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    buildInfoRowRightAligned(
                        'assets/Calendar.png', 'Date of Birth', dob),
                    buildInfoRowRightAligned(
                        'assets/Gender.png', 'Gender', gender),
                    buildInfoRowRightAligned(
                        'assets/class.png', 'Class', classInfo),
                    buildInfoRowRightAligned(
                        'assets/BloodGroup.png', 'Blood Group', bloodGroup),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.2, // Adjust image aspect ratio
                  ),
                  itemCount:
                      galleryImages.length, // Adjust the number of images
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.asset(
                        galleryImages[index], // Ensure you have these images
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String iconPath, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 10),
          Text(
            '$title: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRowRightAligned(String iconPath, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                height: 24,
                width: 24,
              ),
              SizedBox(width: 10),
              Text(
                '$title: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
