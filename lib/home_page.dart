import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'service.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: "Logout",
            onPressed: () async {
              await _authService.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),

            if (user?.photoURL != null)
              CircleAvatar(
                backgroundImage: NetworkImage(user!.photoURL!),
                radius: 40,
              ),
            SizedBox(height: 10),

            Text(
              user?.displayName ?? user?.email ?? "User",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                await _authService.signOut();
              },
              child: Text("Log Out"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
