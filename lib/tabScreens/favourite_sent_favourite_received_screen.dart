import 'package:flutter/material.dart';
class FavouriteSentFavououriteReceivedScreen extends StatefulWidget {
  const FavouriteSentFavououriteReceivedScreen({super.key});

  @override
  State<FavouriteSentFavououriteReceivedScreen> createState() => _FavouriteSentFavououriteReceivedScreenState();
}

class _FavouriteSentFavououriteReceivedScreenState extends State<FavouriteSentFavououriteReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favourite sent favourite received",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
         ),
        ),
    );
  }
}