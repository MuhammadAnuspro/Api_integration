import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/Model/post_model.dart';
import 'package:task/Model/user_Model.dart';
import 'package:task/all_posts_screen.dart';
import 'package:task/login_Screen.dart';

import 'package:task/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: Drawer(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.login_outlined,
                    color: Colors.red,
                  )),
              backgroundColor: Colors.white,
            ),
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text(
                "Task",
              ),
              bottom: TabBar(
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  Title(
                    color: Colors.white,
                    child: Text('ALL POSTS'),
                  ),
                  Title(
                    color: Colors.white,
                    child: Text('PROFILE'),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                AllPosts(),
                Profile(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
              backgroundColor: Colors.red,
              focusColor: Colors.white,
            ),
          )),
    );
  }
}
