import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pawfect_match/global.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() =>
      _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState
    extends State<LikeSentLikeReceivedScreen> {
  bool isLikeSentClicked = true;
  List<String> likeSentList = [];
  List<String> likeReceivedList = [];
  List likeList = [];

  getLikeListKeys() async {
    if (isLikeSentClicked) {
      var likeSentDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString())
          .collection("likeSent")
          .get();

      for (int i = 0; i < likeSentDocument.docs.length; i++) {
        likeSentList.add(likeSentDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(likeSentList);
    } else {
      var likeRecievedDocument = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserID.toString())
          .collection("likeReceived")
          .get();

      for (int i = 0; i < likeRecievedDocument.docs.length; i++) {
        likeReceivedList.add(likeRecievedDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(likeReceivedList);
    }
  }

  getKeysDataFromUserCollection(List<String> keysList) async {
    var allUsersDocument =
        await FirebaseFirestore.instance.collection("users").get();

    for (int i = 0; i < allUsersDocument.docs.length; i++) {
      for (int j = 0; j < keysList.length; j++) {
        if (((allUsersDocument.docs[i].data() as dynamic)["uid"]) ==
            keysList[j]) {
          likeList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      likeList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getLikeListKeys();
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
                  likeSentList.clear();
                  likeSentList = [];
                  likeReceivedList.clear();
                  likeReceivedList = [];
                  likeList.clear();
                  likeList = [];

                  setState(() {
                    isLikeSentClicked = true;
                  });

                  getLikeListKeys();
                },
                child: Text(
                  "My Likes",
                  style: TextStyle(
                    color: isLikeSentClicked ? Colors.white : Colors.grey,
                    fontWeight:
                        isLikeSentClicked ? FontWeight.bold : FontWeight.normal,
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
                  likeSentList.clear();
                  likeSentList = [];
                  likeReceivedList.clear();
                  likeReceivedList = [];
                  likeList.clear();
                  likeList = [];

                  setState(() {
                    isLikeSentClicked = false;
                  });

                  getLikeListKeys();
                },
                child: Text(
                  "Liked By",
                  style: TextStyle(
                    color: isLikeSentClicked ? Colors.grey : Colors.white,
                    fontWeight:
                        isLikeSentClicked ? FontWeight.normal : FontWeight.bold,
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
            child: likeList.isEmpty
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
                    children: List.generate(likeList.length, (index) {
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
                                    likeList[index]["imageProfile"],
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
                                              likeList[index]["name"]
                                                      .toString() +
                                                  " • " +
                                                  likeList[index]["age"]
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
                                              likeList[index]["city"]
                                                      .toString() +
                                                  " • " +
                                                  likeList[index]["country"]
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
