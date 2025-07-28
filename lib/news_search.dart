import "package:flutter/material.dart";
import "package:newsapp/home.dart";
import "package:newsapp/search.dart";
import "package:newsapp/topic_search.dart";

class NewsSearch extends StatelessWidget {
  const NewsSearch({super.key});

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
              RecentNews(
                imageUrl:
                    "https://th.bing.com/th/id/OIP.kWytOu-y1xkHeqbYqxQfPwHaE8?w=252&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                title: "Europe",
                description:
                    "Ukraine's President Zelensky to BBC: Blood money being paid...",
                source: "BBc News",
              ),
              const SizedBox(height: 12),
              RecentNews(
                imageUrl:
                    "https://th.bing.com/th/id/OIP.kWytOu-y1xkHeqbYqxQfPwHaE8?w=252&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                title: "Europe",
                description:
                    "Ukraine's President Zelensky to BBC: Blood money being paid...",
                source: "BBc News",
              ),
              const SizedBox(height: 12),
              RecentNews(
                imageUrl:
                    "https://th.bing.com/th/id/OIP.kWytOu-y1xkHeqbYqxQfPwHaE8?w=252&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                title: "Europe",
                description:
                    "Ukraine's President Zelensky to BBC: Blood money being paid...",
                source: "BBc News",
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
