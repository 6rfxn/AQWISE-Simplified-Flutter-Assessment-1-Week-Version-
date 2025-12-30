import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment/Models/post_model.dart';

class BookmarkService {
  static const String _bookmarksKey = 'bookmarks';

  Future<void> addBookmark(Post post) async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = await getBookmarks();

    // if already bookmarked
    if (bookmarks.any((p) => p.id == post.id)) {
      return; // Already bookmarked
    }

    bookmarks.add(post);
    final jsonList = bookmarks.map((p) => p.toJson()).toList();
    await prefs.setString(_bookmarksKey, jsonEncode(jsonList));
  }

  // Get all bookmarks
  Future<List<Post>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_bookmarksKey);
    
    if (jsonString == null) {
      return [];
    }
    
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Post.fromJson(json as Map<String, dynamic>)).toList();
  }

  // Check if bookmarked
  Future<bool> isBookmarked(int postId) async {
    final bookmarks = await getBookmarks();
    return bookmarks.any((p) => p.id == postId);
  }
}

