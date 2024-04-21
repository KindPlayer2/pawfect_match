import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/global.dart';
import 'package:pawfect_match/userSettingsScreen/account_settings_screen.dart';

class UserDetailScreen extends StatefulWidget {
  String? userID;

  UserDetailScreen({super.key, this.userID,});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  //personal info
  String name = ' ';
  String age = ' ';
  String phone = ' ';
  String city = ' ';
  String country = ' ';
  String genderPrefernce = ' ';

  //Appearance
  String height = ' ';
  String weight = ' ';
  String gender = ' ';

  //Life style
  String drink = ' ';
  String smoke = ' ';
  String children = ' ';
  String profession = ' ';
  String income = ' ';
  String living = ' ';
  String hasDog = ' ';
  String favouriteBreed = ' ';
  String size = ' ';

  //bckground
  String nationality = ' ';
  String language = ' ';
  String education = ' ';
  String religion = ' ';

  //slider images
  String urlImage1 = "https://firebasestorage.googleapis.com/v0/b/pawfect-match-7748f.appspot.com/o/Place%20Holder%2Favatar.png?alt=media&token=3a23c3b1-d549-477b-ac5d-ac8ee89e1829";
  String urlImage2 = "https://firebasestorage.googleapis.com/v0/b/pawfect-match-7748f.appspot.com/o/Place%20Holder%2Favatar.png?alt=media&token=3a23c3b1-d549-477b-ac5d-ac8ee89e1829";
  String urlImage3 = "https://firebasestorage.googleapis.com/v0/b/pawfect-match-7748f.appspot.com/o/Place%20Holder%2Favatar.png?alt=media&token=3a23c3b1-d549-477b-ac5d-ac8ee89e1829";
  String urlImage4 = "https://firebasestorage.googleapis.com/v0/b/pawfect-match-7748f.appspot.com/o/Place%20Holder%2Favatar.png?alt=media&token=3a23c3b1-d549-477b-ac5d-ac8ee89e1829";
  String urlImage5 = "https://firebasestorage.googleapis.com/v0/b/pawfect-match-7748f.appspot.com/o/Place%20Holder%2Favatar.png?alt=media&token=3a23c3b1-d549-477b-ac5d-ac8ee89e1829";

  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance.collection("users").doc(widget.userID).get().then((snapshot)
    {
      if(snapshot.exists)
      {
        if(snapshot.data()!["urlImage1"] != null)
        {
          setState(() {
            urlImage1 = snapshot.data()!["urlImage1"];
            urlImage2 = snapshot.data()!["urlImage2"];
            urlImage3 = snapshot.data()!["urlImage3"];
            urlImage4 = snapshot.data()!["urlImage4"];
            urlImage5 = snapshot.data()!["urlImage5"];
          });
        }

          setState(() {
            //personal info
             name = snapshot.data()!["name"];
             age = snapshot.data()!["age"].toString();
             phone = snapshot.data()!["phone"];
             city = snapshot.data()!["city"];
             country = snapshot.data()!["country"];
             genderPrefernce = snapshot.data()!["genderPrefernce"];

            //Appearance
             height = snapshot.data()!["height"];
             weight = snapshot.data()!["weight"];
             gender = snapshot.data()!["gender"];

            //Life style
             drink = snapshot.data()!["drink"];
             smoke = snapshot.data()!["smoke"];
             children = snapshot.data()!["children"];
             profession = snapshot.data()!["profession"];
             income = snapshot.data()!["income"];
             living = snapshot.data()!["living"];
           //  hasDog = snapshot.data()!["hasDog"];
             //favouriteBreed = snapshot.data()!["favouriteBreed"];
             size = snapshot.data()!["size"];

            //bckground
             nationality = snapshot.data()!["nationality"];
             language = snapshot.data()!["language"];
             education = snapshot.data()!["education"];
             religion = snapshot.data()!["religion"];
          });

      }
    });
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Profile",
          style:TextStyle(
            color: Colors.white,
          )
        ),
        centerTitle: true,
        automaticallyImplyLeading: widget.userID == currentUserID ? false : true,
        actions: [
          widget.userID == currentUserID ?
          Row(
            children: [
              IconButton(
                onPressed: ()
                {
                  Get.to(AccountSettingsScreen());
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                )
              ),
              IconButton(
                onPressed: ()
                {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                )
              ),
            ],
          ) : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              //image slider
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    indicatorBarColor: Colors.black.withOpacity(0.3),
                    autoScrollDuration: const Duration(seconds: 2),
                    animationPageDuration: const Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.black,
                    animationPageCurve: Curves.easeIn,
                    indicatorBarHeight: 30,
                    indicatorHeight: 10,
                    indicatorWidth: 10,
                    unActivatedIndicatorColor: Colors.grey,
                    stopAtEnd: false,
                    autoScroll: true,
                    items: [
                      Image.network(urlImage1, fit: BoxFit.cover,),
                      Image.network(urlImage2, fit: BoxFit.cover,),
                      Image.network(urlImage3, fit: BoxFit.cover,),
                      Image.network(urlImage4, fit: BoxFit.cover,),
                      Image.network(urlImage5, fit: BoxFit.cover,),
                    ]
                  ),
                )
              ),

              const SizedBox(height: 10.0,),

              //personal info title
              const SizedBox(height: 30.0,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Info",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  )
                ),

              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //personal info table data
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                    
                    //name
                    TableRow(
                      children: [
                        const Text(
                          "name: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Age
                    TableRow(
                      children: [
                        const Text(
                          "age: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //phone
                    TableRow(
                      children: [
                        const Text(
                          "phone number: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          phone,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //City
                    TableRow(
                      children: [
                        const Text(
                          "City: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Country
                    TableRow(
                      children: [
                        const Text(
                          "Country: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Gender preference
                    TableRow(
                      children: [
                        const Text(
                          "Gender preference: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          genderPrefernce,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    
                  ],
                ),
              ),

              //My dog title
              const SizedBox(height: 30.0,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My dog",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  )
                ),

              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                    
                    //name
                    TableRow(
                      children: [
                        const Text(
                          "name: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Age
                    TableRow(
                      children: [
                        const Text(
                          "age: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //breed
                    TableRow(
                      children: [
                        const Text(
                          "breed: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //size
                    TableRow(
                      children: [
                        const Text(
                          "Size: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          size,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),           
                  ],
                ),
              ),

              //Appearance title
              const SizedBox(height: 30.0,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Appearance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  )
                ),

              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                    
                    //height
                    TableRow(
                      children: [
                        const Text(
                          "Height: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          height,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Age
                    TableRow(
                      children: [
                        const Text(
                          "Weight: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          weight,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Gender
                    TableRow(
                      children: [
                        const Text(
                          "Gender: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          gender,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),         
                  ],
                ),
              ),

              //Lifestyle title
              const SizedBox(height: 30.0,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lifestyle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  )
                ),

              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                    
                    //Smoke
                    TableRow(
                      children: [
                        const Text(
                          "Do you smoke?: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          smoke,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Drink
                    TableRow(
                      children: [
                        const Text(
                          "Do you drink?: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          drink,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),
                    //name
                    TableRow(
                      children: [
                        const Text(
                          "Do you have children? : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          children,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    TableRow(
                      children: [
                        const Text(
                          "Profession : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          profession,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Income
                    TableRow(
                      children: [
                        const Text(
                          "Income: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          income,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //living situation
                    TableRow(
                      children: [
                        const Text(
                          "Living situation : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          living,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),             
                  ],
                ),
              ),

              //Background title
              const SizedBox(height: 30.0,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Background",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  )
                ),

              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [
                    
                    //name
                    TableRow(
                      children: [
                        const Text(
                          "nationality: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          nationality,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),

                    //Age
                    TableRow(
                      children: [
                        const Text(
                          "Education: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          education,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],        
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),
                    //name
                    TableRow(
                      children: [
                        const Text(
                          "Language : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          language,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),
                    //name
                    TableRow(
                      children: [
                        const Text(
                          "Religion : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          religion,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        )
                      ],

                      
                    ),
                    //EXTRA ROW
                    const TableRow(
                      children: [
                        Text(""),
                        Text(""),
                      ]
                    ),           
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}