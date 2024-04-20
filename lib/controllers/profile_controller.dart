import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/global.dart';
import 'package:pawfect_match/models/person.dart';
import 'package:pawfect_match/tabScreens/favourite_sent_favourite_received_screen.dart';

class ProfileController extends GetxController
{
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  @override
  void onInit()
  {
    //Todo: Implemend OnInity
    super.onInit();

    usersProfileList.bindStream(
      FirebaseFirestore.instance
        .collection("users")
        .snapshots()
        .map((QuerySnapshot queryDataSnapshot)
      {
        List<Person> profilesList = [];

        for(var eachProfile in queryDataSnapshot.docs)
        {
          profilesList.add(Person.fromDataSnapshot(eachProfile));
        }
        return profilesList;
      })
    );
  }

  FavouriteSentFavououriteReceived(String toUserID, String SenderName) async
  {
    var document = await FirebaseFirestore.instance
    .collection("users")
    .doc(toUserID)
    .collection("favoriteReceived")
    .doc(currentUserID)
    .get();

    //remove previous favourite if one already exists
    if(document.exists)
    {
      //removed current user from the favorite received list of that profile
      await FirebaseFirestore.instance
      .collection("users")
      .doc(toUserID).collection("favoriteReceived").doc(currentUserID)
      .delete();

      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("favoriteSent").doc(toUserID)
      .delete();

    }
    else //mark the new account as the first favourite in database
    {
      await FirebaseFirestore.instance
      .collection("users").doc(toUserID)
      .collection("favoriteReceived")
      .doc(currentUserID)
      .set({});

      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID)
      .collection("favoriteSent")
      .doc(toUserID)
      .set({});

      //send notification
    }

    update();
  }

  LikeSentLikeReceived(String toUserID, String SenderName) async
  {
    var document = await FirebaseFirestore.instance
    .collection("users")
    .doc(toUserID)
    .collection("likeReceived")
    .doc(currentUserID)
    .get();

    //remove previous favourite if one already exists
    if(document.exists)
    {
      //removed current user from the like received list of that profile
      await FirebaseFirestore.instance
      .collection("users")
      .doc(toUserID).collection("likeReceived").doc(currentUserID)
      .delete();

      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID).collection("likeSent").doc(toUserID)
      .delete();

    }
    else //mark the new account as the first favourite in database
    {
      await FirebaseFirestore.instance
      .collection("users").doc(toUserID)
      .collection("likeReceived")
      .doc(currentUserID)
      .set({});

      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID)
      .collection("likeSent")
      .doc(toUserID)
      .set({});

      //send notification
    }

    update();
  }

  ViewSentViewReceived(String toUserID, String SenderName) async
  {
    var document = await FirebaseFirestore.instance
    .collection("users")
    .doc(toUserID)
    .collection("viewReceived")
    .doc(currentUserID)
    .get();

    //remove previous favourite if one already exists
    if(document.exists)
    {
      print("already in view list");
    }
    else //mark the new account as the first favourite in database
    {
      await FirebaseFirestore.instance
      .collection("users").doc(toUserID)
      .collection("viewReceived")
      .doc(currentUserID)
      .set({});

      await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserID)
      .collection("viewSent")
      .doc(toUserID)
      .set({});

      //send notification
    }

    update();
  }


}