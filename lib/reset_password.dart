import "package:flutter/material.dart";
import "package:newsapp/verification.dart";

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset\nPassword",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 13),
            _InputField(label: "New Password"),
            const SizedBox(height: 13),

            _InputField(label: "Confirm new Password"),
            const SizedBox(height: 390),
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
                  MaterialPageRoute(builder: (_) => Verification()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final bool isPassword;

  const _InputField({required this.label, this.isPassword = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: const TextStyle(fontSize: 16)),
            const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: isPassword ? const Icon(Icons.visibility_off) : null,
          ),
        ),
      ],
    );
  }
}
