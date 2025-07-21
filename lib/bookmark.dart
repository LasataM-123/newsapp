import 'package:flutter/material.dart';
import 'package:newsapp/navbar.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});
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
                        // Handle filter action
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Bookmark(
                title: "Europe",
                description:
                    "Ukraine's President Zelensky to BBC: Blood money being paid...",
                newsUrl:
                    "https://ts3.mm.bing.net/th?id=OIP.Tm8b41hjQmuMFCc_4Uu1iwHaEK&pid=15.1",
                newsChannel: "BBC News",
                time: "14m",
                channelUrl:
                    "https://th.bing.com/th/id/OIP.kfrG3qG7NTiajxeIkl72ggHaEK?w=272&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
              ),

              Bookmark(
                title: "Travel",
                description:
                    "Her train broke down. Her phone died. And then she met her...",
                newsUrl:
                    "https://th.bing.com/th/id/OIP.XoHdtYIFLoz-07DscQRPyQHaD5?w=316&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                newsChannel: "CNN",
                time: "1h",
                channelUrl:
                    "https://th.bing.com/th/id/OIP.-78kYyX50Q8AaUEaSge7hwHaHa?w=149&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
              ),

              Bookmark(
                title: "Europe",
                description: "Russian warship: Moskva sinks in Black Sea",
                newsUrl:
                    "https://th.bing.com/th/id/OIP.VW2b3qXqryDRS9ZZY1PZNAHaEo?w=271&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                newsChannel: "BBC News",
                time: "4h",
                channelUrl:
                    "https://th.bing.com/th/id/OIP.kfrG3qG7NTiajxeIkl72ggHaEK?w=272&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
              ),

              Bookmark(
                title: "Money",
                description:
                    "Wind power produced more electricity than coal and nuc...",
                newsUrl:
                    "https://th.bing.com/th/id/OIP.KUTewJepU49mnCVhb5O4SgHaFI?w=208&h=144&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                newsChannel: "USA Today",
                time: "4h",
                channelUrl:
                    "https://th.bing.com/th/id/OIP.OryacI-Xf3c2K9JOkCFCUgHaEK?w=324&h=182&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        isHomeSelected: false,
        isExploreSelected: false,
        isBookmarkSelected: true,
        isProfileSelected: false,
      ),
    );
  }
}

class Bookmark extends StatelessWidget {
  final String title;
  final String description;
  final String newsUrl;
  final String time;
  final String channelUrl;
  final String newsChannel;
  const Bookmark({
    super.key,
    required this.title,
    required this.description,
    required this.newsUrl,
    required this.channelUrl,
    required this.time,
    required this.newsChannel,
  });

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
              newsUrl,
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
                    color: const Color.fromARGB(255, 85, 85, 85),
                  ),
                ),

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
                          backgroundImage: NetworkImage(channelUrl),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          newsChannel,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 78, 75, 102),
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
                          color: const Color.fromARGB(255, 85, 85, 85),
                        ),
                        const SizedBox(width: 1.0),
                        Text(
                          "$time ago",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: const Color.fromARGB(255, 85, 85, 85),
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
