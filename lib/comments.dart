import "package:flutter/material.dart";

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Comments",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Transform.translate(
                          offset: Offset(0, -105), // Negative Y moves it upward
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              "https://tse1.mm.bing.net/th/id/OIP.a_C9v1H7RBbVyFjU4udThgHaKX?rs=1&pid=ImgDetMain&o=7&rm=3",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wilson Franci",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "4w",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        255,
                                        91,
                                        91,
                                        91,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                    color: const Color.fromARGB(
                                      255,
                                      91,
                                      91,
                                      91,
                                    ),
                                  ),
                                  const SizedBox(width: 2),

                                  Text(
                                    "125 Likes",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        255,
                                        91,
                                        91,
                                        91,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Icon(
                                    Icons.reply,
                                    size: 20,
                                    color: const Color.fromARGB(
                                      255,
                                      91,
                                      91,
                                      91,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "reply",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(
                                        255,
                                        91,
                                        91,
                                        91,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Reply(),
                              const SizedBox(height: 8),
                              Text(
                                "See more (2)",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromARGB(255, 91, 91, 91),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Comments(
                    user: "Marley Botosh",
                    likes: "12",
                    url:
                        "https://th.bing.com/th/id/R.3bcbeff4ee0abb81ef150c9ea7e35730?rik=t3aMo1m4uUQi6g&riu=http%3a%2f%2fwww.newdesignfile.com%2fpostpic%2f2010%2f05%2ffree-stock-photos-people_102217.jpg&ehk=vGjIrntn5QyP%2fIXY2Ei7Iiz4%2fy%2byXvP8I8j0XxemwjI%3d&risl=&pid=ImgRaw&r=0",
                  ),
                  Comments(
                    user: "Alfonso Septimus",
                    likes: "14K",
                    url:
                        "https://tse1.mm.bing.net/th/id/OIP.kfM6gE5n_IxPxrdgZg7SigHaLH?rs=1&pid=ImgDetMain&o=7&rm=3",
                  ),
                  Comments(
                    user: "Omar Herwitz",
                    likes: "16",
                    url:
                        "https://cdn.pixabay.com/photo/2018/10/29/21/46/human-3782189_1280.jpg",
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 197, 197, 197),
                      offset: Offset(0, -2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(),
                            hintText: "Type your comment",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.blue, // move color here
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.send,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comments extends StatelessWidget {
  final String user;
  final String likes;
  final String url;
  const Comments({
    super.key,
    required this.user,
    required this.likes,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Transform.translate(
            offset: Offset(0, -42), // Negative Y moves it upward
            child: CircleAvatar(radius: 20, backgroundImage: NetworkImage(url)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "4w",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.favorite_border,
                      size: 20,
                      color: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    const SizedBox(width: 2),

                    Text(
                      '$likes Likes',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.reply,
                      size: 20,
                      color: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "reply",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "See more (2)",
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 91, 91, 91),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Reply extends StatelessWidget {
  const Reply({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Transform.translate(
            offset: Offset(0, -30), // Negative Y moves it upward
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                "https://tse1.explicit.bing.net/th/id/OIP.tZ98LGTSsnsCvhdGp6Ll3wHaE8?rs=1&pid=ImgDetMain&o=7&rm=3",
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Madelyn Saris",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and type...",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "4w",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.favorite, size: 20, color: Colors.red),
                    const SizedBox(width: 2),

                    Text(
                      "3 Likes",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.reply,
                      size: 20,
                      color: const Color.fromARGB(255, 91, 91, 91),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "reply",
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color.fromARGB(255, 91, 91, 91),
                      ),
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
