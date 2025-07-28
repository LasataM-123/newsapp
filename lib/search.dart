import 'package:flutter/material.dart';
import 'package:newsapp/comments.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/news_search.dart';
import 'package:newsapp/topic_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Author",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Container(height: 2.0, width: 60.0, color: Colors.blue),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              NewsItem(),
              const SizedBox(height: 16.0),
              NewsItem(),
              const SizedBox(height: 16.0),

              NewsItem(),
              const SizedBox(height: 16.0),

              NewsItem(),
              const SizedBox(height: 16.0),

              NewsItem(),
              const SizedBox(height: 16.0),
              NewsItem(),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentScreen(),
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/R.f8e3baccb4ab837d0232052db1e3e844?rik=4gmSS1C2r%2fAkEA&pid=ImgRaw&r=0",
                  ),
                ),
              ),

              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MSN",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  Text(
                    "153K Followers",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 102, 102, 102),
                    ),
                  ),
                ],
              ),
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.blue),
                Text("Follow", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
