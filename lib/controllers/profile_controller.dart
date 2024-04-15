import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/models/person.dart';

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
}