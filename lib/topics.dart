import 'package:flutter/material.dart';
import 'package:newsapp/news_source.dart';

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  int selectedIndex = -1;

  final List<String> topicList = [
    "National",
    "International",
    "Sport",
    "Lifestyle",
    "Business",
    "Health",
    "Fashion",
    "Technology",
    "Science",
    "Arts",
    "Politics",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your topics"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 78, 75, 102),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 78, 75, 102),
                      size: 24,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Topic Wrap Layout
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(topicList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: selectedIndex == index ? Colors.blue : null,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Text(
                            topicList[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 42),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => NewsSource()),
                  );
                },
              ),

              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
