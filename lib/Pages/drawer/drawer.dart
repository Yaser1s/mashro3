// ignore_for_file: camel_case_types, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test10/Pages/drawer/profile_page.dart';
import 'package:test10/Pages/home.dart';
// import 'package:test10/shared/snackbar.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  String email = "hey";
  Map userData = {};
  getData() async {
    // Get data from DB
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('Tradors')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = snapshot.data()!;

      email = snapshot["Email"];
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Column(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/background.png"),
                      fit: BoxFit.cover),
                ),
                currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/img/person.jpg")),
                accountEmail: Text("email"),
                accountName: Text("ali Hassan",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              ),
              ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  }),
              ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {}),
              ListTile(
                  title: Text(email),
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }),
              ListTile(
                  title: const Text("تسجيل الخروج"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: const Text("Developed by Yaser Yosef © 2023",
                style: TextStyle(fontSize: 16)),
          )
        ]));
  }
}
