import 'package:flutter/material.dart';
import 'package:newsapp/search.dart';

class NewsInfo extends StatelessWidget {
  final String email;
  const NewsInfo({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, size: 30.0),
                  Icon(Icons.more_vert, size: 30.0),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                      "https://tse4.mm.bing.net/th/id/OIP.9-2rUx4PF_-oBbG2xcDhSgHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "1.2M",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: const Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "124K",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: const Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "326",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "News",
                        style: TextStyle(
                          fontSize: 17.0,
                          color: const Color.fromARGB(255, 42, 42, 42),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                email,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "is an operational business division of the British Broadcasting Corporation responsible for the gathering and broadcasting of news and current affairs.",
                style: TextStyle(
                  fontSize: 17.0,
                  color: const Color.fromARGB(255, 42, 42, 42),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 10.0,
                      ),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Following",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 52.0,
                        vertical: 10.0,
                      ),

                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Website",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("News", style: TextStyle(fontSize: 18.0)),
                  const SizedBox(width: 20.0),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Recent",
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
              RecentNews(),
              RecentNews(),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentNews extends StatelessWidget {
  const RecentNews({super.key});

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
              "https://www.eyerevolution.co.uk/wp-content/uploads/2013/02/bbc-new-broadcasting-house-babita1.jpg",
              width: 100.0,
              height: 100.0,
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
                  "Europe",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 42, 42, 42),
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  "Ukraine's President Zelensky to BBC: Blood money being paid...",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.0,
                          backgroundImage: NetworkImage(
                            "https://tse4.mm.bing.net/th/id/OIP.9-2rUx4PF_-oBbG2xcDhSgHaEK?rs=1&pid=ImgDetMain&o=7&rm=3",
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "BBC News",
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
