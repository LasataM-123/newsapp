import 'package:flutter/material.dart';
import 'package:newsapp/navbar.dart';

class Trending extends StatelessWidget {
  const Trending({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
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
            ],
          ),
        ),
      ),
     
    );
  }
}
