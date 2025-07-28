import "package:flutter/material.dart";
import "package:newsapp/navbar.dart";

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today, April 22",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Text(
                "Yesterday, April 21",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Notifications(),
              const SizedBox(height: 16),
              Notifications(),
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

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 239, 239),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                "https://th.bing.com/th/id/OIP.kfrG3qG7NTiajxeIkl72ggHaEK?w=282&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "BBC News has posted new Europe news: “Ukraine's President Zele…”",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "14m ago",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
