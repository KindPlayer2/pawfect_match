import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawfect_match/global.dart';

class FavouriteSentFavououriteReceivedScreen extends StatefulWidget {
  const FavouriteSentFavououriteReceivedScreen({super.key});

  @override
  State<FavouriteSentFavououriteReceivedScreen> createState() =>
      _FavouriteSentFavououriteReceivedScreenState();
}

class _FavouriteSentFavououriteReceivedScreenState
    extends State<FavouriteSentFavououriteReceivedScreen> {
  bool isFavouriteSentClicked = true;
  List<String> favouriteSentList = [];
  List<String> favouriteReceivedList = [];
  List favouriteList = [];

  getFavoriteListKeys() async {
    if (isFavouriteSentClicked) {
      var favoriteSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString())
          .collection("favoriteSent")
          .get();

      for (int i = 0; i < favoriteSentDocument.docs.length; i++) {
        favouriteSentList.add(favoriteSentDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(favouriteSentList);
    } else {
      var favoriteRecievedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString())
          .collection("favoriteReceived")
          .get();

      for (int i = 0; i < favoriteRecievedDocument.docs.length; i++) {
        favouriteReceivedList.add(favoriteRecievedDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(favouriteReceivedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keysList) async {
    var allUsersDocument =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < allUsersDocument.docs.length; i++) {
      for (int j = 0; j < keysList.length; j++) {
        if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) ==
            keysList[j]) {
          favouriteList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      favouriteList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getFavoriteListKeys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  favouriteSentList.clear();
                  favouriteSentList = [];
                  favouriteReceivedList.clear();
                  favouriteReceivedList = [];
                  favouriteList.clear();
                  favouriteList = [];

                  setState(() {
                    isFavouriteSentClicked = true;
                  });

                  getFavoriteListKeys();
                },
                child: Text(
                  "My Favourites",
                  style: TextStyle(
                    color: isFavouriteSentClicked ? Colors.white : Colors.grey,
                    fontWeight: isFavouriteSentClicked
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                "   |   ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextButton(
                onPressed: () {
                  favouriteSentList.clear();
                  favouriteSentList = [];
                  favouriteReceivedList.clear();
                  favouriteReceivedList = [];
                  favouriteList.clear();
                  favouriteList = [];

                  setState(() {
                    isFavouriteSentClicked = false;
                  });

                  getFavoriteListKeys();
                },
                child: Text(
                  "Favourited By",
                  style: TextStyle(
                    color: isFavouriteSentClicked ? Colors.grey : Colors.white,
                    fontWeight: isFavouriteSentClicked
                        ? FontWeight.normal
                        : FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 209, 171, 125), // Top Color
                  Color.fromARGB(255, 189, 147, 104), // Middle Color
                  Color.fromARGB(255, 96, 68, 47), // Bottom Color
                ],
                stops: [0.1, 0.5, 0.9],
              ),
            ),
            child: favouriteList.isEmpty
                ? Center(
                    child: Icon(
                      Icons.person_off_sharp,
                      color: Colors.white,
                      size: 60,
                    ),
                  )
                : GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(8),
                    children: List.generate(favouriteList.length, (index) {
                      return GridTile(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: Colors.blue.shade200,
                            child: GestureDetector(
                              onTap: () {},
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                    favouriteList[index]["imageProfile"],
                                  ),
                                  fit: BoxFit.cover,
                                )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Spacer(),
                                        Expanded(
                                          child: Text(
                                              favouriteList[index]["name"]
                                                      .toString() +
                                                  " • " +
                                                  favouriteList[index]["age"]
                                                      .toString(),
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                              favouriteList[index]["city"]
                                                      .toString() +
                                                  " • " +
                                                  favouriteList[index]
                                                          ["country"]
                                                      .toString(),
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )));
  }
}
