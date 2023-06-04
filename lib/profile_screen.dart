import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task/Model/user_Model.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<UserModel> userprofile = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                    height: 220,
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Card(
                      color: Colors.white.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getText(index, 'Name :  ',
                                userprofile[index].name.toString()),
                            getText(index, 'Username :  ',
                                userprofile[index].username.toString()),
                            getText(
                              index,
                              'Address :  ',
                              '${userprofile[index].address.suite.toString()}, ${userprofile[index].address.city.toString()}',
                            ),
                            getText(index, 'ZipCode :  ',
                                '${userprofile[index].address.zipcode.toString()}'),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  getText(int index, String fieldName, String content) {
    return Text.rich(TextSpan(
      children: [
        TextSpan(
          text: fieldName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextSpan(
          text: content,
          style: (const TextStyle(fontSize: 16)),
        ),
      ],
    ));
  }

  Future<List<UserModel>> userData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userprofile.add(UserModel.fromJson(index));
      }
      return userprofile;
    } else {
      return userprofile;
    }
  }
}
