// To parse this JSON data, do
//
//     final petResponse = petResponseFromJson(jsonString);

import 'dart:convert';

PetResponse petResponseFromJson(String str) => PetResponse.fromJson(json.decode(str));

String petResponseToJson(PetResponse data) => json.encode(data.toJson());

class PetResponse {
  String status;
  List<Pet> pets;

  PetResponse({
    required this.status,
    required this.pets,
  });

  factory PetResponse.fromJson(Map<String, dynamic> json) => PetResponse(
    status: json["status"],
    pets: List<Pet>.from(json["pets"].map((x) => Pet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
  };
}

class Pet {
  Type type;
  Gender gender;
  Size size;
  String age;
  List<Photo> photos;
  bool goodWithChildren;
  String petId;
  String source;

  Pet({
    required this.type,
    required this.gender,
    required this.size,
    required this.age,
    required this.photos,
    required this.goodWithChildren,
    required this.petId,
    required this.source,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    type: typeValues.map[json["type"]]!,
    gender: genderValues.map[json["gender"]]!,
    size: sizeValues.map[json["size"]]!,
    age: json["age"]!,
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    goodWithChildren: json["good_with_children"],
    petId: json["pet_id"],
    source: json["source"]!,
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "gender": genderValues.reverse[gender],
    "size": sizeValues.reverse[size],
    "age": age,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "good_with_children": goodWithChildren,
    "pet_id": petId,
    "source": source,
  };
}
enum Gender { MALE,FEMALE }

final genderValues = EnumValues({
  "male": Gender.MALE,
  "female":Gender.FEMALE
});

class Photo {
  String? url;

  Photo({
    this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

enum Size { MEDIUM, TINY }

final sizeValues = EnumValues({
  "medium": Size.MEDIUM,
  "tiny": Size.TINY
});


enum Type { CAT, MICE, DICE, WHAT }

final typeValues = EnumValues({
  "Cat": Type.CAT,
  "dice": Type.DICE,
  "mice": Type.MICE,
  "WHAT": Type.WHAT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
