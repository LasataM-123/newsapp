import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () {
          Navigator.pop(context);
        }),
        actions: [IconButton(icon: const Icon(Icons.check), onPressed: () {
          // Save changes logic here
          Navigator.pop(context);
        })],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 68,
                  backgroundColor: Color(0xFFE0E0E0),
                ),
                Positioned(
                  bottom: 0,
                  left:90,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const ProfileTextField(label: 'Username'),
            const ProfileTextField(label: 'Full Name'),
            const ProfileTextField(label: 'Email Address', isRequired: true),
            const ProfileTextField(label: 'Phone Number', isRequired: true),
            const ProfileTextField(label: 'Bio'),
            const ProfileTextField(label: 'Website'),
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final bool isRequired;

  const ProfileTextField({
    super.key,
    required this.label,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isRequired ? '$label*' : label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height:45,
            child: TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              
              )),
            ),
          ),
        ],
      ),
    );
  }
}
