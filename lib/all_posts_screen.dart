import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task/Model/user_Model.dart';
import 'Model/post_model.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({super.key});

  @override
  State<AllPosts> createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  List<PostModel> postList = [];

  // Future<List<PostModel>> getPostApi() async {
  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> index in data) {
  //       postList.add(PostModel.fromJson(index));
  //     }
  //     return postList;
  //   } else {
  //     return postList;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Card(
                        margin: EdgeInsets.all(5),
                        color: Colors.white.withOpacity(0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListTile(
                              title: Text(
                                'Title :',
                              ),
                              subtitle: Text(
                                '${postList[index].body}',
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<PostModel>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        postList.add(PostModel.fromJson(index));
      }
      return postList;
    } else {
      return postList;
    }
  }
}
