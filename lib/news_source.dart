import "package:flutter/material.dart";
import "package:newsapp/fill_profile.dart";

class NewsSource extends StatefulWidget {
  const NewsSource({super.key});

  @override
  State<NewsSource> createState() => _NewsSourceState();
}

class _NewsSourceState extends State<NewsSource> {
  final List<Map<String, dynamic>> sources = [
    {"name": "BBC News", "isFollowing": false},
    {"name": "CNN", "isFollowing": false},
    {"name": "VICE", "isFollowing": false},
    {"name": "Vox", "isFollowing": true},
    {"name": "CNET", "isFollowing": false},
    {"name": "TIME", "isFollowing": false},
    {"name": "Buzzfeed", "isFollowing": false},
    {"name": "MSN", "isFollowing": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your News Sources"),
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
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 78, 75, 102),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 78, 75, 102),
                      size: 24,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: List.generate(sources.length, (index) {
                      final source = sources[index];
                      return SizedBox(
                        width: MediaQuery.of(context).size.width / 3 - 32,
                        child: NewsSourceCard(
                          name: source["name"],
                          isFollowing: source["isFollowing"],
                          onTap: () {
                            setState(() {
                              source["isFollowing"] = !source["isFollowing"];
                            });
                          },
                          logo: const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.black,
                            child: Icon(Icons.newspaper, color: Colors.white),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FillProfile()),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsSourceCard extends StatelessWidget {
  final String name;
  final bool isFollowing;
  final VoidCallback onTap;
  final Widget? logo;

  const NewsSourceCard({
    super.key,
    required this.name,
    required this.isFollowing,
    required this.onTap,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo ??
              const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey,
                child: Icon(Icons.public, color: Colors.white),
              ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              backgroundColor: isFollowing ? Colors.blue : Colors.white,
              foregroundColor: isFollowing ? Colors.white : Colors.blue,
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              minimumSize: const Size(60, 32),
              textStyle: const TextStyle(fontSize: 12),
            ),
            child: Text(isFollowing ? 'Following' : 'Follow'),
          ),
        ],
      ),
    );
  }
}
