import 'package:flutter/material.dart';
import 'package:office/LoginScreen.dart';

class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    const Color yellowColor = Colors.yellow;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;

            return Stack(
              children: <Widget>[
                // Second container (background)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: height * 0.5,
                    //  color: Colors.red,
                    child: Container(
                      color: whiteColor,
                      child: Image.asset(
                        'assets/Frame1.png',
                      ),
                    ),
                  ),
                ),
                // First container
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    child: Container(
                      height: height * 0.57,
                      color: blueColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/Frame.png',
                            height: height * 0.28,
                          ),
                          //  const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: whiteColor,
                                  ),
                                  child: ListTile(
                                    tileColor: whiteColor,
                                    leading: const Icon(Icons.person,
                                        color: yellowColor),
                                    title: Text(
                                      'Student',
                                      style: TextStyle(
                                        color: blueColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.03,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: whiteColor,
                                  ),
                                  child: ListTile(
                                    leading: const Icon(Icons.group,
                                        color: yellowColor),
                                    title: Text(
                                      'Parent',
                                      style: TextStyle(
                                        color: blueColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.03,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: whiteColor,
                                  ),
                                  child: ListTile(
                                    leading: const Icon(Icons.image,
                                        color: yellowColor),
                                    title: Text(
                                      'Teacher',
                                      style: TextStyle(
                                        color: blueColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: height * 0.03,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
