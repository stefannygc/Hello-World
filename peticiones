import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> listarPost(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/posts/');

  //Compute
  return compute(pasaraListas, response.body);
}

//Convertir
List<Post> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Post>((json) => Post.fromJson(json)).toList();
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Peticiones Http';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Post>>(
        future: listarPost(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? ItemPost(posts: snapshot.data) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemPost extends StatelessWidget {
  final List<Post> posts;

  ItemPost({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index].title),
          subtitle: Text(posts[index].body),
          leading: CircleAvatar(
            child: Text(posts[index].userId.toString()),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(child: Text(posts[index].id.toString()), radius: 12.0, backgroundColor: Colors.green[700]),
            ],
          ),
        );
      },
    );
  }
}
