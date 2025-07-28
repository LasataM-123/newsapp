import "package:flutter/material.dart";
import "package:newsapp/explore.dart";
import "package:newsapp/home.dart";
import "package:newsapp/news_search.dart";
import "package:newsapp/search.dart";

class TopicSearch extends StatelessWidget {
  const TopicSearch({super.key});

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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => NewsSearch()),
                      );
                    },
                    child: Text("News", style: TextStyle(fontSize: 18.0)),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Topic",
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
                        MaterialPageRoute(builder: (_) => SearchScreen()),
                      );
                    },
                    child: Text("Author", style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Topic(
                title: "Health",
                description: "Get energizing workout moves, healthy recipes...",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.GUUywOMlA_9o1bWUqfcWCQHaEK?w=276&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                isSaved: false,
              ),
              const SizedBox(height: 16),
              const Topic(
                title: "Technology",
                description:
                    "The application of scientific knowledge to the practi...",
                imageUrl:
                    "https://th.bing.com/th/id/OIP.042h6s1AsKpvQts5qdUrVQHaE0?w=286&h=186&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                isSaved: true,
              ),
              const SizedBox(height: 16),
              const Topic(
                title: "Art",
                description:
                    "Art is a diverse range of human activity, and result...",
                imageUrl:
                    "https://tse2.mm.bing.net/th/id/OIP.uSgvpvTLIpT9bvcNNQ4V9gHaE8?rs=1&pid=ImgDetMain&o=7&rm=3",
                isSaved: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
