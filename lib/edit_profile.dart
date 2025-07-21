import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController bio = TextEditingController();
  final TextEditingController website = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  var box = Hive.box('myBox');
  void setData() {
    box.put('username', username.text);
    box.put('fullName', fullName.text);
    box.put('email', email.text);
    box.put('phone', phone.text);
    box.put('bio', bio.text);
    box.put('website', website.text);
  }

  void loadData() {
    setState(() {
      username.text = box.get('username', defaultValue: '');
      fullName.text = box.get('fullName', defaultValue: '');
      email.text = box.get('email', defaultValue: '');
      phone.text = box.get('phone', defaultValue: '');
      bio.text = box.get('bio', defaultValue: '');
      website.text = box.get('website', defaultValue: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              setData();
              Navigator.pop(context);
            },
          ),
        ],
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
                  left: 90,
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
            ProfileTextField(label: 'Username', controller: username),
            ProfileTextField(label: 'Full Name', controller: fullName),
            ProfileTextField(
              label: 'Email Address',
              isRequired: true,
              controller: email,
            ),
            ProfileTextField(
              label: 'Phone Number',
              isRequired: true,
              controller: phone,
            ),
            ProfileTextField(label: 'Bio', controller: bio),
            ProfileTextField(label: 'Website', controller: website),
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextEditingController controller;

  const ProfileTextField({
    super.key,
    required this.label,
    this.isRequired = false,
    required this.controller,
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
            height: 45,
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
