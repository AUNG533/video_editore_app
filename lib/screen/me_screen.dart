import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 70),
            const Text(
              'KineMaster',
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'Connect with global video creators',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 70.0),
            SizedBox(
              width: 300,
              height: 50,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.red[700],
                onPressed: () {},
                label: const Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'OR',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () {},
                label: Row(
                  children: const [
                    // Icon(FontAweconst someIcons.google, color: Colors.red[700]),
                    Image(
                      image: AssetImage('assets/google.png'),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Continue with Google',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 300,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () {},
                label: Row(
                  children: const [
                    Image(
                      image: AssetImage('assets/mac.png'),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Continue with apple',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100.0),
            const Text(
              'I have read and accept the KineMaster',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                print('Terms of Service and Privacy ');
              },
              child: const Text(
                'Terms of Service and Privacy',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    print('SignIn with Google Cliched');
                  },
                  child: const Text('Sign in with email',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
