import 'package:flutter/material.dart';
import 'package:assignment/Models/post_model.dart';
import 'package:assignment/services/bookmark.dart';


class PostDetail extends StatefulWidget {
  final Post post;
  const PostDetail({super.key, required this.post});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final BookmarkService _bookmarkService = BookmarkService();
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _checkBookmarkStatus();
  }

  Future<void> _checkBookmarkStatus() async {
    final isBookmarked = await _bookmarkService.isBookmarked(widget.post.id);
    setState(() {
      _isBookmarked = isBookmarked;
    });
  }

  Future<void> _addBookmark() async {
    await _bookmarkService.addBookmark(widget.post);
    setState(() {
      _isBookmarked = true;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bookmark added!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              widget.post.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            // Bookmark button
            ElevatedButton.icon(
              onPressed: _isBookmarked ? null : _addBookmark,
              icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
              label: Text(_isBookmarked ? 'Bookmarked' : 'Add Bookmark'),
            ),
          ],
        ),
      ),
    );
  }
}


