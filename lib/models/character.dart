import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.gender,
    this.origin,
    this.location,
    this.image,
  });

  int id;
  String name;
  String status;
  String species;
  String gender;
  Location origin;
  Location location;
  String image;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    gender: json["gender"],
    origin: Location.fromJson(json["origin"]),
    location: Location.fromJson(json["location"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "gender": gender,
    "origin": origin.toJson(),
    "location": location.toJson(),
    "image": image,
  };
}

class Location {
  Location({
    this.name,
  });

  String name;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
