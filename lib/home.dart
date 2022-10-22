import 'package:flutter/material.dart';
import 'package:task12/http_service.dart';
import 'package:task12/post_details.dart';
import 'package:task12/post_model.dart';

final HttpService httpService = HttpService();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Posts"),
        ),
        body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data as List<Post>;
              return ListView(
                children: posts
                    .map((Post post) => ListTile(
                          title: Text(post.title),
                  subtitle: Text(post.id.toString(),),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostDetails(post: post,))
                  ),
                        ))
                    .toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
