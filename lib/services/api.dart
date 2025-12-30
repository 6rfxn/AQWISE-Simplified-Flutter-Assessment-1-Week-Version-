import 'dart:convert'; // JSON
import 'package:http/http.dart' as http; // requests
import 'package:assignment/Models/post_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // 1) Go URL
  // 2) Get JSON
  // 3) JSON > List<Post>

  // To Remember
  // throw - error(), print - print()
  // Response Status Code https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Err (code: ${response.statusCode})');
    }

    final List<dynamic> decodedJson =
        jsonDecode(response.body) as List<dynamic>;

    final List<Post> posts = decodedJson
        .map((item) => Post.fromJson(item as Map<String, dynamic>))
        .toList();

    return posts;
  }
}
