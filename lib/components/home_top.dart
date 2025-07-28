import "package:flutter/material.dart";
import 'package:newsapp/notification.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/kabar.png", width: 100, height: 100),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 246, 246),
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationScreen()),
              );
            },
            icon: Icon(Icons.notifications_none_outlined),
          ),
        ),
      ],
    );
  }
}
