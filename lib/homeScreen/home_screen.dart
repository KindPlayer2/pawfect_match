import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawfect_match/tabScreens/favourite_sent_favourite_received_screen.dart';
import 'package:pawfect_match/tabScreens/like_sent_like_received_screen.dart';
import 'package:pawfect_match/tabScreens/swippingScreen.dart';
import 'package:pawfect_match/tabScreens/user_details_screen.dart';
import 'package:pawfect_match/tabScreens/view_sent_view_received_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  List tabScreensList = [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavouriteSentFavououriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailScreen(
      userID: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber) {
          setState(() {
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.122),
        currentIndex: screenIndex,
        items: [
          //Swiping screen
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ""),

          //sent
          BottomNavigationBarItem(
              icon: Icon(
                Icons.remove_red_eye,
                size: 30,
              ),
              label: ""),

          //favourites
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 30,
              ),
              label: ""),

          //likes
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ""),

          //user details
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: ""),
        ],
      ),
      body: tabScreensList[screenIndex],
    );
  }
}
