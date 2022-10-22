import 'dart:convert';
import 'package:http/http.dart';
import 'package:task12/post_model.dart';

class HttpService {
  final String postsUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async{
    Response res = await get(Uri.parse(postsUrl));
    if(res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
      body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    }else{
      throw {
        "cant get posts"
      };
    }
  }
}