import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPosts()
      .then((value) => print(value));

    // fetchPosts();

    // final post = {
    //   'title': 'hello',
    //   'description': 'nice to meet you.',
    // };

    // print(post['title']);
    // print(post['description']);

    // // model 转 Json
    // final postJson = json.encode(post);
    // print(postJson);

    // // Json 转 Map
    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted['title']);
    // print(postJsonConverted['description']);
    // print(postJsonConverted is Map);

    // // Map 转 Model
    // final postModel = Post.fromJson(postJsonConverted);
    // print('title: ${postModel.title}, description: ${postModel.description}');

    // // model 转 Json
    // print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchPosts() async {
    final response = 
      await http.get('https://resources.ninghao.net/demo/posts.json');

    // print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
        .map<Post>((item) => Post.fromJson(item))
        .toList();
      
      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data: ${snapshot.data}');
        print('ConnectionState: ${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  // 封装 Map 转 model
  Post.fromJson(Map json) 
    : id = json['id'],
      title = json['title'],
      description = json['description'],
      author = json['author'],
      imageUrl = json['imageUrl'];
  
  // 转 map
  Map toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'author': author,
    'imageUrl': imageUrl,
  };
}