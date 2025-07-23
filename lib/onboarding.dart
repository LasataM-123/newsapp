import "package:flutter/material.dart";
import "package:newsapp/comments.dart";
import "package:newsapp/login.dart";

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingData> pages = [
    OnboardingData(
      image:
          'https://th.bing.com/th/id/OIP.s4SAePe1s_gS9SuCj6HJ9wHaEC?w=331&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      title: 'Lorem Ipsum is simply \ndummy',
      subtitle:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    ),
    OnboardingData(
      image:
          'https://th.bing.com/th/id/OIP.VVPQIqDqf-OxZPXu07XWKwHaEK?w=322&h=181&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      title: 'Lorem Ipsum is simply\n dummy',
      subtitle:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    ),
    OnboardingData(
      image:
          'https://th.bing.com/th/id/OIF.9tfAGTjIxvWpg4Z3pkDXSg?w=287&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3',
      title: 'Lorem Ipsum is simply\n dummy',
      subtitle:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemBuilder: (context, index) {
          final page = pages[index];
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: Image.network(
                  page.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        page.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        page.subtitle,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Dots on the left
                          Row(
                            children: List.generate(
                              pages.length,
                              (dotIndex) => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == dotIndex
                                      ? Colors.blue
                                      : Colors.grey[300],
                                ),
                              ),
                            ),
                          ),

                          // Buttons: Back + Next
                          Row(
                            children: [
                              if (_currentPage != 0)
                                TextButton(
                                  onPressed: _prevPage,
                                  child: const Text("Back"),
                                ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: _currentPage == pages.length - 1
                                    ? () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const LoginPage(),
                                          ),
                                        );
                                      }
                                    : _nextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  _currentPage == pages.length - 1
                                      ? "Get Started"
                                      : "Next",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingData {
  final String image, title, subtitle;

  OnboardingData({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}
