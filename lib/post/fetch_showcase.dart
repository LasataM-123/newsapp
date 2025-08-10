import "package:flutter/material.dart";
import "package:newsapp/post/fetch.dart";

class PostShowcase extends StatefulWidget {
  const PostShowcase({super.key});

  @override
  State<PostShowcase> createState() => _PostShowcaseState();
}

class _PostShowcaseState extends State<PostShowcase> {
  final Fetch _postService = Fetch();
  late Future<List<dynamic>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _postService.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Showcase")),
      body: FutureBuilder<List<dynamic>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No posts available."));
          }

          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post["title"]),
                subtitle: Text(post["body"]),
              );
            },
          );
        },
      ),
    );
  }
}
