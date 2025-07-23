import 'package:flutter/material.dart';
import 'package:newsapp/core/network/news_service.dart';

class PostMethodScreen extends StatefulWidget {
  const PostMethodScreen({super.key});

  @override
  State<PostMethodScreen> createState() => _PostMethodScreenState();
}

class _PostMethodScreenState extends State<PostMethodScreen> {
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  NewsService service = NewsService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void postMethod() async {
    setState(() {
      isLoading = true;
    });
    try {
      final res = await service.postMethod("posts", {
        "title": _titleController.text,
        "body": _messageController.text,
        "userId": 1,
      });
      setState(() {
        isLoading = false;
      });
      if (res.statusCode == 201 || res.statusCode == 200) {
        setState(() {
          isError = false;
          errorMessage = res.data.toString();
        });
      } else {
        setState(() {
          isError = true;
          errorMessage = "Something went wrong with ${res.toString()}";
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
        errorMessage = "Something went wrong $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Posts'), leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InputField(label: "Title", controller: _titleController),
            const SizedBox(height: 24),
            _InputField(label: "Message", controller: _messageController),
            const SizedBox(height: 24),

            Text("UserId: 1", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),

            Center(
              child: (isLoading)
                  ? CircularProgressIndicator()
                  : ElevatedButton(
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
                        postMethod();
                      },
                    ),
            ),
            const SizedBox(height: 14),
            Text(
              errorMessage ?? "",
              style: TextStyle(color: isError ? Colors.red : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const _InputField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(border: const OutlineInputBorder()),
        ),
      ],
    );
  }
}
