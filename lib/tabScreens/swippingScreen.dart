import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/controllers/profile_controller.dart';
import 'package:pawfect_match/global.dart';
import 'package:pawfect_match/tabScreens/user_details_screen.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  ProfileController profileController = Get.put(ProfileController());

  String SenderName = ' ';

  readCurrentUserData() async {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get();

    var data = documentSnapshot.data();
    if (data != null && data["name"] != null) {
      setState(() {
        SenderName = data["name"].toString();
      });
    } else {
      setState(() {
        SenderName = 'Name'; // Provide a default name if "name" is not found
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            itemCount: profileController.allUsersProfileList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final eachProfileInfo =
                  profileController.allUsersProfileList[index];

              return DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        eachProfileInfo.imageProfile.toString(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          //filter icon button
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.filter_list,
                                    size: 30,
                                  ),
                                )),
                          ),

                          const Spacer(),

                          //user data
                          GestureDetector(
                            onTap: () {
                              profileController.ViewSentViewReceived(
                                eachProfileInfo.uid.toString(),
                                SenderName,
                              );

                              Get.to(UserDetailScreen(
                                userID: eachProfileInfo.uid,
                              ));
                            },
                            child: Column(
                              children: [
                                //name
                                Text(
                                  eachProfileInfo.name.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                //age - city
                                Text(
                                  eachProfileInfo.age.toString() +
                                      " - " +
                                      eachProfileInfo.city.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 4,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //favourite button
                              GestureDetector(
                                onTap: () {
                                  profileController
                                      .FavouriteSentFavououriteReceived(
                                    eachProfileInfo.uid.toString(),
                                    SenderName,
                                  );
                                },
                                child: Image.asset(
                                  "images/star.png",
                                  width: 60,
                                ),
                              ),

                              //like button
                              GestureDetector(
                                onTap: () {
                                  profileController.LikeSentLikeReceived(
                                    eachProfileInfo.uid.toString(),
                                    SenderName,
                                  );
                                },
                                child: Image.asset(
                                  "images/Buttonliked.png",
                                  width: 190,
                                ),
                              ),

                              //like button
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  "images/Chat.png",
                                  width: 60,
                                ),
                              )
                            ],
                          )
                        ],
                      )));
            });
      }),
    );
  }
}
