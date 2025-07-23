import "package:flutter/material.dart";

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            const Text(
              "Forgot \nPassword?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              "Don’t worry! it happens. Please select the\nemail or number associated with your account.",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 90, 90, 90),
              ),
            ),
            const SizedBox(height: 16.0),
            PasswordRecoveryBox(
              via: "via Email:",
              value: "lasata@gmail.com",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 16.0),
            PasswordRecoveryBox(
              via: "via SMS:",
              value: "+62-8421-4512251",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 300),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordRecoveryBox extends StatefulWidget {
  final String via;
  final String value;
  final IconData icon;

  const PasswordRecoveryBox({
    super.key,
    required this.via,
    required this.value,
    required this.icon,
  });

  @override
  State<PasswordRecoveryBox> createState() => _PasswordRecoveryBoxState();
}

class _PasswordRecoveryBoxState extends State<PasswordRecoveryBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 241, 241),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: const EdgeInsets.all(18.0),
      height: 100.0,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: const EdgeInsets.all(18.0),
            height: 64.0,
            width: 64.0,
            child: Icon(widget.icon, color: Colors.white),
          ),
          const SizedBox(width: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.via,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 162, 162, 162),
                  ),
                ),
                const SizedBox(height: 5),
                Text(widget.value, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(width: 78.0),

          GestureDetector(
            onTap: () => setState(() => isSelected = !isSelected),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 241, 241, 241),
                border: Border.all(
                  color: isSelected
                      ? Colors.blue
                      : const Color.fromARGB(255, 161, 161, 161),
                  width: 3,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.circle, color: Colors.blue, size: 16),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage 