import 'package:flutter/material.dart';

class LiekSentLikeReceivedScreen extends StatefulWidget {
  const LiekSentLikeReceivedScreen({super.key});

  @override
  State<LiekSentLikeReceivedScreen> createState() => _LiekSentLikeReceivedScreenState();
}

class _LiekSentLikeReceivedScreenState extends State<LiekSentLikeReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Like sent like received screen",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
         ),
        ),
    );
  }
}