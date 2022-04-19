import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

/*
  TODO list:
  Step 1: this will be the main layout of the app (only the UI)
  Step 2: Login to firebase console
  Step 3: Create a new firebase project
  Step 4: Add the Firebase Dependencies
  Step 5: init the Firebase app
  Step 6: Create the login function
 */

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialialize Firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class Firebase {
  static initializeApp() {}
}

mixin FirebaseApp {
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email;


  //Login function
  static Future<User?> loginUsingEmailPassword(
    {required String email, 
    required String password,
    required BuildContext context}) async {}
  var auth = FirebaseAuth.instance;
  User? user;
  try {
    var password;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e){
   assert(e != null);
    if(e.code == "user-not-found"){
      // ignore: avoid_print
      print("No User found for that email");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  } 

}

class FirebaseAuth {
  static var instance;
}

class UserCredential {
  User? user;
}

class User {
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MyApp Title",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Login to Your App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 44.0,
          ),
          const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(
                // "Icons.security" can be replaced with "lock"
                Icons.security,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Forgot/Reset your Password?",
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(
            height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Color(0xFF0069FE),
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36.0)),
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
