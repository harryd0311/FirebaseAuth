import 'package:firebase_auth/firebase_auth.dart';
import 'package:nrich_assignment/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name; // Add the name parameter to the constructor

  HomePage({Key? key, required this.name}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Authentication');
  }

  Widget _userUId() {
    return Text(user?.email ?? 'User Email'); // Use user.displayName instead of user.email
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Email: ',style: TextStyle(
              color: Colors.orange,
            ),),
            _userUId(), // Display the user's name
            Text('\nName: ',style: TextStyle(
              color: Colors.orange,
            ),),
            Text('$name'), // Display the name passed from login/registration page
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
