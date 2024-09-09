import 'package:flutter/material.dart';
import 'package:office/HomeScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    const Color yellowColor = Colors.yellow;

    final TextField userNameField = TextField(
      controller: userNameController,
      style: const TextStyle(fontSize: 20.0, color: blueColor),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, color: yellowColor),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Username/Id no.',
        hintStyle: const TextStyle(color: blueColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: blueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: blueColor),
        ),
      ),
    );

    final TextField passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: const TextStyle(fontSize: 20.0, color: blueColor),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock, color: yellowColor),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Password',
        hintStyle: const TextStyle(color: blueColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: blueColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: blueColor),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;

            return Stack(
              children: <Widget>[
                // Background container
                Container(
                  height: height * 0.4,
                  //   width: constraints.maxWidth * 1.5,
                  color: blueColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/Group.png',
                            fit: BoxFit.fitWidth,
                            height: height * 0.4,
                            width: constraints.maxWidth * 2,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Image.asset(
                            'assets/Group.png',
                            fit: BoxFit.contain,
                            // height: height * 0.4,
                            // width: constraints.minWidth * 0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // container 1
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    child: Container(
                      height: height * 0.68,
                      color: whiteColor,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: constraints.maxWidth * 0.1,
                            vertical: height * 0.05,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.asset(
                                'assets/logo.png',
                                height: height * 0.15,
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                'WELCOME',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(color: blueColor),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10.0),
                              userNameField,
                              const SizedBox(height: 15.0),
                              passwordField,
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: yellowColor,
                                      decorationColor: yellowColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: blueColor,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.15,
                                      vertical: height * 0.02,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        ),
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
