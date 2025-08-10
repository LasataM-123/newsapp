import "package:flutter/material.dart";
import "package:newsapp/core/model/allnews_model.dart";
import "package:newsapp/core/network/news_service.dart";
import "package:newsapp/home.dart";
import "package:newsapp/search.dart";
import "package:newsapp/topic_search.dart";

class NewsSearch extends StatefulWidget {
  const NewsSearch({super.key});

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [Icon(Icons.search), Text("Search here")]),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Home()),
                          );
                        },
                        child: Icon(Icons.close, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "News",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Container(height: 2.0, width: 60.0, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TopicSearch()),
                      );
                    },
                    child: Text("Topic", style: TextStyle(fontSize: 18.0)),
                  ),
                  const SizedBox(width: 16.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SearchScreen()),
                      );
                    },
                    child: Text("Author", style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              (isLoading)
                  ? CircularProgressIndicator()
                  : (isError)
                  ? Text(errorMessage ?? "")
                  : SizedBox(
                      height: 370,
                      child: ListView.builder(
                        itemCount: news?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          Datum? item = news?.data?[index];
                          return RecentNews(model: item!);
                        },
                      ),
                    ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
