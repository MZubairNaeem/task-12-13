import 'package:flutter/material.dart';
import 'package:task12/post_model.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  const PostDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("Title"),
                  subtitle: Text(post.title),
                ),
                ListTile(
                  title: Text("ID"),
                  subtitle: Text(post.id.toString()),
                ),
                ListTile(
                  title: Text("Body"),
                  subtitle: Text(post.body),
                ),
                ListTile(
                  title: Text("UserID"),
                  subtitle: Text(post.userId.toString()),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
