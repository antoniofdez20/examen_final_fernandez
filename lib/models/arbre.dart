import 'dart:convert';

class Arbre {
  String? id;
  String nom;
  String varietat;
  String tipus;
  bool autocton;
  String imageURL;
  String detall;

  Arbre({
    this.id,
    required this.nom,
    required this.varietat,
    required this.tipus,
    required this.autocton,
    required this.imageURL,
    required this.detall,
  });

  factory Arbre.fromJson(String str) => Arbre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Arbre.fromMap(Map<String, dynamic> json) => Arbre(
        nom: json["nom"],
        varietat: json["varietat"],
        tipus: json["tipus"],
        autocton: json["autocton"],
        imageURL: json["imageURL"],
        detall: json["detall"],
      );

  Map<String, dynamic> toMap() => {
        "nom": nom,
        "varietat": varietat,
        "tipus": tipus,
        "autocton": autocton,
        "imageURL": imageURL,
        "detall": detall,
      };
}
