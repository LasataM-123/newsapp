import 'package:flutter/material.dart';
import 'package:newsapp/comments.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
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
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            NewsItem(),
            NewsItem(),
          ],
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
      margin: const EdgeInsets.all(30.0),
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
