import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:newsapp/edit_profile.dart';
import 'package:newsapp/navbar.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  // void setUsername() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('username', 'John Doe');
  //   loadData();
  // }

  // void loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = prefs.getString('username') ?? 'Wilson Franci';
  //   });
  // }
  var box = Hive.box('myBox');
  void setUsername() {
    box.put('username', 'John Doe');
    loadData();
  }

  void loadData() {
    setState(() {
      username = box.get('username', defaultValue: 'Wilson Franci');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.settings, size: 30.0),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        "https://tse4.mm.bing.net/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain&o=7&rm=3",
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "2156",
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
                          "567",
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
                          "23",
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
                  username,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
                          horizontal: 40.0,
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
                            builder: (context) => const EditProfilePage(),
                          ),
                        );
                      },
                      child: Text(
                        "Edit Profile",
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
                        setUsername();
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
                RecentNews(
                  title: "NFTs",
                  description:
                      "Minting Your First NFT: A Beginner’s Guide to Creating...",
                  imageUrl:
                      "https://th.bing.com/th/id/OIP.p0lXohjJlbXjJy-yBORLpQHaD4?w=287&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                  time: "15m",
                ),
                RecentNews(
                  title: "Business",
                  description:
                      "5 things to know before the stock market opens Monday",
                  imageUrl:
                      "https://th.bing.com/th/id/OIP.qLj9KsAw9zr_OaqKdGs9tQHaDF?w=297&h=145&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                  time: "1h",
                ),
                RecentNews(
                  title: "Travel",
                  description:
                      "Bali plans to reopen to international tourists in Septe...",
                  imageUrl:
                      "https://th.bing.com/th/id/OIP.yy06KdzagGxvP2dk1vxcLwHaEh?w=261&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                  time: "1w",
                ),
                RecentNews(
                  title: "NFTs",
                  description:
                      "Minting Your First NFT: A Beginner’s Guide to Creating...",
                  imageUrl:
                      "https://www.reuters.com/resizer/v2/https%3A%2F%2Fcloudfront-us-east-2.images.arcpublishing.com%2Freuters%2F34GWN2I7W5LJJDYR7VOOLE7MLY.jpg?auth=174c9a568d240674032234eda543d49ec017fa11f6dc6ee6f33225dc11977237&width=1080&quality=80",
                  time: "15m",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        isHomeSelected: false,
        isExploreSelected: false,
        isBookmarkSelected: false,
        isProfileSelected: true,
      ),
    );
  }
}

class RecentNews extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String time;
  const RecentNews({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.time,
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
              imageUrl,
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
                  title,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 42, 42, 42),
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  description,
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
                            "https://tse4.mm.bing.net/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain&o=7&rm=3",
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          "Wilson Franci",
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
                          "$time ago",
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
