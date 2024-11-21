import 'package:flutter/material.dart';
import 'package:maizeplant/constants.dart';
import 'package:maizeplant/login_page.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) {
    print("Firebase initialized successfully");
  }).catchError((error) {
    print("Failed to initialize Firebase: $error");
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maize Plant Disease Detector',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            const WelcomePage(), // Use WelcomePage as the initial page
        '/home': (context) => const HomePage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor, // Greenery color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/Maize.png', // Your logo asset
            //   height: 250, // Height of the logo
            // ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Plant Disease Diagnosis',
              style: TextStyle(
                color: Color.fromARGB(255, 12, 84, 36), // Text color
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 7, 107, 35), // Green background
                padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20), // Adjust the padding to increase button size
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // const Text(
            //   'Developed with love',
            //   style: TextStyle(
            //     color: kHighlightColor,
            //     fontSize: 12.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
