import "package:flutter/material.dart";
import "package:newsapp/components/home_top.dart";
import "package:newsapp/navbar.dart";
import "package:newsapp/news_search.dart";
import "package:newsapp/search.dart";
import "package:newsapp/trending.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const HomeTop(),
              const SizedBox(height: 16),
              // Wrap from here in scroll view
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 78, 75, 102),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => NewsSearch(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 78, 75, 102),
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
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
                                // Handle filter action
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Topic Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Trending()),
                              );
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 78, 75, 102),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // News Card
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                "https://th.bing.com/th/id/OIP.VW2b3qXqryDRS9ZZY1PZNAHaEo?w=271&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                                width: double.infinity,
                                height: 180.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            const Text(
                              "Europe",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 85, 85, 85),
                              ),
                            ),
                            const Text(
                              "Russian warship: Moskva sinks in Black Sea",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Row(
                                  children: const [
                                    CircleAvatar(
                                      radius: 10.0,
                                      backgroundImage: NetworkImage(
                                        "https://th.bing.com/th/id/OIP.kfrG3qG7NTiajxeIkl72ggHaEK?w=272&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                                      ),
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      "BBC News",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color.fromARGB(255, 78, 75, 102),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 12.0),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.access_time,
                                      size: 14.0,
                                      color: Color(0xFF555555),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "4h ago",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF555555),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.more_horiz,
                                  size: 25.0,
                                  color: Color(0xFF2A2A2A),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Topic Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Latest",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 78, 75, 102),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "All",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Container(
                                height: 2.0,
                                width: 30.0,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          const SizedBox(width: 16.0),
                          Text("Sports", style: TextStyle(fontSize: 16.0)),
                          const SizedBox(width: 16.0),
                          Text("Politics", style: TextStyle(fontSize: 16.0)),
                          const SizedBox(width: 16.0),
                          Text("Business", style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                      const SizedBox(height: 16),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        isHomeSelected: true,
        isExploreSelected: false,
        isBookmarkSelected: false,
        isProfileSelected: false,
      ),
    );
  }
}

class RecentNews extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String source;

  const RecentNews({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 90.0,
              height: 90.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            // Ensures text does not overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 42, 42, 42),
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.0,
                          backgroundImage: NetworkImage(
                            "https://tse1.mm.bing.net/th/id/OIP.L09m1RjznRIafPRVOG2kkQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          source,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14.0,
                          color: const Color.fromARGB(255, 42, 42, 42),
                        ),
                        const SizedBox(width: 1.0),
                        Text(
                          "14m ago",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: const Color.fromARGB(255, 42, 42, 42),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz,
                      size: 25.0,
                      color: const Color.fromARGB(255, 42, 42, 42),
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
