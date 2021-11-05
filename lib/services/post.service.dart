import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:learn_flutter_1/model/post.dart';

class PostService {
  Future<List<Post>> fetchPosts() async{
    List<Post> list = [];
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var posts = jsonDecode(response.body);
    for (var a in posts) {
      Post post = Post.fromJson(a);
      list.add(post);
    }
    return list;
  }
}