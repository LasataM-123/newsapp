import 'package:flutter/material.dart';
import 'package:newsapp/navbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explore",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Topic",
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
                const Topic(
                  title: "Health",
                  description:
                      "Get energizing workout moves, healthy recipes...",
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
                const SizedBox(height: 24),
                const Text(
                  "Popular Topic",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
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
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 10.0,
                                backgroundImage: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.kfrG3qG7NTiajxeIkl72ggHaEK?w=272&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              const Text(
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
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}

class Topic extends StatelessWidget {
  final bool isSaved;
  final String imageUrl;
  final String title;
  final String description;

  const Topic({
    super.key,
    required this.isSaved,
    required this.imageUrl,
    required this.title,
    required this.description,
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
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(221, 78, 75, 102),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 90,
            child: isSaved
                ? ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Saved",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
