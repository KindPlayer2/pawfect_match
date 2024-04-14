import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  // Personal Info
  String? imageProfile;
  String? name;
  int? age;
  String? email;
  String? password;
  String? phone;
  String? city;
  String? country;
  String? genderPreference;
  int? publishedDateTime;

  // Apperance
  String? height;
  String? weight;
  String? gender;

  // Lifestyle
  String? drink;
  String? smoke;
  String? children;
  String? profession;
  String? income;
  String? living;
  String? breed;
  String? size;

  // background
  String? nationality;
  String? language;
  String? education;
  String? religion;

  Person({
    this.imageProfile,
    this.name,
    this.age,
    this.email,
    this.password,
    this.phone,
    this.city,
    this.country,
    this.genderPreference,
    this.publishedDateTime,
    this.height,
    this.weight,
    this.gender,
    this.drink,
    this.smoke,
    this.children,
    this.profession,
    this.income,
    this.living,
    this.breed,
    this.size,
    this.nationality,
    this.language,
    this.education,
    this.religion,
  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      name: dataSnapshot["name"],
      imageProfile: dataSnapshot["imageProfile"],
      age: dataSnapshot["age"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      phone: dataSnapshot["phone"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      genderPreference: dataSnapshot["genderPrefernce"],
      publishedDateTime: dataSnapshot["publishedDateTime"],
      height: dataSnapshot["height"],
      weight: dataSnapshot["weight"],
      gender: dataSnapshot["gender"],
      drink: dataSnapshot["drink"],
      smoke: dataSnapshot["smoke"],
      children: dataSnapshot["children"],
      profession: dataSnapshot["profession"],
      income: dataSnapshot["income"],
      living: dataSnapshot["living"],
      breed: dataSnapshot["breed"],
      size: dataSnapshot["size"],
      nationality: dataSnapshot["nationality"],
      language: dataSnapshot["language"],
      education: dataSnapshot["education"],
      religion: dataSnapshot["religion"],
    );
  }

  Map<String, dynamic> toJson() => {

        "imageProfile": imageProfile,
        "name": name,
        "age": age,
        "email": email,
        "password": password,
        "phone": phone,
        "city": city,
        "country": country,
        "genderPrefernce": genderPreference,
        "publishedDateTime": publishedDateTime,
        "height": height,
        "weight": weight,
        "gender": gender,
        "drink": drink,
        "smoke": smoke,
        "children": children,
        "profession": profession,
        "income": income,
        "living": living,
        "breed": breed,
        "size": size,
        "nationality": nationality,
        "language": language,
        "education": education,
        "religion": religion,

      };

}
