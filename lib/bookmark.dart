import 'package:flutter/material.dart';
import 'package:newsapp/core/model/allnews_model.dart';
import 'package:newsapp/core/network/news_service.dart';
import 'package:newsapp/navbar.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  NewsService newsService = NewsService();
  bool isLoading = false;
  bool isError = false;
  AllNewsModel? news;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final res = await newsService.fetchTopNews();
      setState(() {
        isLoading = false;
      });

      if (res.statusCode == 200) {
        setState(() {
          news = AllNewsModel.fromJson(res.data);
        });
      } else {
        setState(() {
          isError = true;
          isLoading = false;
          errorMessage = "Something went wrong";
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
        errorMessage = "Something went wrong";
      });
      throw Exception("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bookmark",
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 78, 75, 102)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 78, 75, 102),
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.tune,
                        size: 24,
                        color: Color.fromARGB(255, 78, 75, 102),
                      ),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 20.0),
              (isLoading)
                  ? CircularProgressIndicator()
                  : (isError)
                  ? Text(errorMessage ?? "")
                  : SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: news?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          Datum? item = news?.data?[index];
                          return Bookmark(model: item!);
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
      
    );
  }
}

class Bookmark extends StatelessWidget {
  final Datum model;
  const Bookmark({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              model.imageUrl ?? '',
              width: 90.0,
              height: 90.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 90),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title ?? '',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 85, 85, 85),
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  model.description ?? '',
                  style: const TextStyle(fontSize: 15.0, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 14.0,
                      color: Color.fromARGB(255, 78, 75, 102),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      model.source ?? '',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 78, 75, 102),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Icon(
                      Icons.access_time,
                      size: 14.0,
                      color: const Color.fromARGB(255, 85, 85, 85),
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      "1h ago",
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 85, 85, 85),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.more_horiz,
                      size: 25.0,
                      color: Color.fromARGB(255, 42, 42, 42),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
