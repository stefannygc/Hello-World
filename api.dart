import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> listarPost(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/photos/');

  //Compute
  return compute(pasaraListas, response.body);
}

//Convertir
List<Post> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Post>((json) => Post.fromJson(json)).toList();
}

class Post {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Post({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

void main() => runApp(PeticionHttp());

class PeticionHttp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'API';

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
          subtitle: Text(posts[index].url),
          leading: CircleAvatar(
            child: Text(posts[index].albumId.toString()),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150/5e04a4'),
              ),
            ],
          ),
        );
      },
    );
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> listarPost(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/photos/');

  //Compute
  return compute(pasaraListas, response.body);
}

//Convertir
List<Post> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Post>((json) => Post.fromJson(json)).toList();
}

class Post {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Post({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

void main() => runApp(PeticionHttp());

class PeticionHttp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'API';

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
          subtitle: Text(posts[index].url),
          leading: CircleAvatar(
            child: Text(posts[index].albumId.toString()),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150/5e04a4'),
              ),
            ],
          ),
        );
      },
    );
  }
}
