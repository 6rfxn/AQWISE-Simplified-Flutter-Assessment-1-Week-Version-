import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment/Models/Post_Model.dart';

class ApiService {
  static const String _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> get() async {
    final response = await http.get(Uri.parse(_url));
    
    if (response.statusCode != 200) {
      throw Exception('Failed to load posts');
    }

    final data = jsonDecode(response.body) as List;
    return data.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
  }
}
