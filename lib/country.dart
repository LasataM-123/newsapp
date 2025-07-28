import 'package:flutter/material.dart';
import 'package:newsapp/topics.dart';

class Country extends StatefulWidget {
  const Country({super.key});

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
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
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 78, 75, 102),
                      size: 24,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: CountryFlag(isSelected: selectedIndex == index),
                    );
                  },
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
                    MaterialPageRoute(builder: (_) => Topics()),
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

class CountryFlag extends StatelessWidget {
  final bool isSelected;

  const CountryFlag({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Text('🇺🇸', style: TextStyle(fontSize: 34)),
          const SizedBox(width: 10),
          Text(
            "United States",
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
