import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pawfect_match/global.dart';

class ViewSentViewReceivedScreen extends StatefulWidget {
  const ViewSentViewReceivedScreen({super.key});

  @override
  State<ViewSentViewReceivedScreen> createState() => _ViewSentViewReceivedScreenState();
}

class _ViewSentViewReceivedScreenState extends State<ViewSentViewReceivedScreen> 
{
  bool isViewSentClicked = true;
  List<String> ViewSentList = [];
  List<String> ViewReceivedList = [];
  List ViewsList = [];



  geViewListKeys() async
  {
    if(isViewSentClicked)
    {
      var viewSentDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID.toString()).collection("viewSent").get();

      for(int i = 0; i < viewSentDocument.docs.length; i++)
      {
        ViewSentList.add(viewSentDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(ViewSentList);
    }
    else
    {
      var viewRecievedDocument = await FirebaseFirestore.instance.collection("users").doc(currentUserID.toString()).collection("viewReceived").get();

      for(int i = 0; i < viewRecievedDocument.docs.length; i++)
      {
        ViewReceivedList.add(viewRecievedDocument.docs[i].id);
      }

      getKeysDataFromUserCollection(ViewReceivedList);
    } 
  }

  getKeysDataFromUserCollection(List<String> keysList) async
  {
    var allUsersDocument = await FirebaseFirestore.instance.collection("users").get();

    for(int i = 0; i < allUsersDocument.docs.length; i++)
    {
      for(int j = 0; j < keysList.length; j++)
      {
        if(((allUsersDocument.docs[i].data() as dynamic)["uid"]) == keysList[j])
        {
          ViewsList.add(allUsersDocument.docs[i].data());
        }
      }
    }

    setState(() {
      ViewsList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    geViewListKeys();
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
              onPressed:()
              {
                ViewSentList.clear();
                ViewSentList = [];
                ViewReceivedList.clear();
                ViewReceivedList = [];
                ViewsList.clear();
                ViewsList = [];

                setState(() {
                  isViewSentClicked = true;
                });

                geViewListKeys();
              },
              child: Text(
                "viewed profiles",
                style: TextStyle(
                  color: isViewSentClicked ? Colors.white : Colors.grey,
                  fontWeight: isViewSentClicked ? FontWeight.bold : FontWeight.normal,
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
              onPressed:()
              {
                ViewSentList.clear();
                ViewSentList = [];
                ViewReceivedList.clear();
                ViewReceivedList = [];
                ViewsList.clear();
                ViewsList = [];

                setState(() {
                  isViewSentClicked = false;
                });

                geViewListKeys();
              },
              child: Text(
                "viewed by",
                style: TextStyle(
                  color: isViewSentClicked ? Colors.grey : Colors.white,
                  fontWeight: isViewSentClicked ? FontWeight.normal : FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
        centerTitle: true,
        ),
      body: ViewsList.isEmpty ? Center(
        child: Icon(Icons.person_off_sharp, color: Colors.white, size: 60,),
      ) 
      : GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8),
        children: List.generate(ViewsList.length, (index){
          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                color: Colors.blue.shade200,
                child: GestureDetector(
                  onTap: ()
                  {

                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(ViewsList[index]["imageProfile"],),
                      fit: BoxFit.cover,
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          children: [

                            const Spacer(),

                            Expanded(
                              child: Text(
                                ViewsList[index]["name"].toString() + " • " + ViewsList[index]["age"].toString(),
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            ),  
                            

                            const SizedBox(
                              height: 4,
                            ),

                            Expanded(
                              child: Text(
                                ViewsList[index]["city"].toString() + " • " + ViewsList[index]["country"].toString(),
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ) ,
          );
        }),
      )
    );
  }
}