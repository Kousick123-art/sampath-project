import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomUserScreen(),
    );
  }
}

class RandomUserScreen extends StatefulWidget {
  @override
  _RandomUserScreenState createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen> {
  // JSON Data
  final String jsonString = '''
  {
    "users": [
      { "id": 1, "name": "indra", "profilePhoto": "assets/MALILI.jpg" },
      { "id": 2, "name": "kiran", "profilePhoto": "assets/kiran.jpg" },
      { "id": 3, "name": "viswas", "profilePhoto": "assets/viswas.jpg" },
      { "id": 4, "name": "mallieswari", "profilePhoto": "assets/mypic.jpg" }
    ]
  }
  ''';

  // Variables for selected user
  Map<String, dynamic>? selectedUser;

  void selectRandomUser() {
    final jsonData = jsonDecode(jsonString);
    final users = jsonData['users'] as List;
    final randomIndex = Random().nextInt(users.length);

    setState(() {
      selectedUser = users[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          selectedUser != null
              ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(selectedUser!['profilePhoto']),
                fit: BoxFit.cover,
              ),
            ),
          )
              : Container(color: Colors.grey), // Default background

          // Top-right corner for name and ID
          Positioned(
            top: 40,
            right: 20,
            child: selectedUser != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'ID: ${selectedUser!['id']}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  selectedUser!['name'],
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )
                : SizedBox.shrink(),
          ),

          // Center Button
          Center(
            child: ElevatedButton(
              onPressed: selectRandomUser,
              child: Text('Pick Random User'),
            ),
          ),
        ],
      ),
    );
  }
}













