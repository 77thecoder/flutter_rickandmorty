import 'package:rickandmorty/models/character.dart';

class CharacterList {
  List<Character> characters;

  CharacterList(this.characters);

  CharacterList.fromJson(List<dynamic> json) {
    characters = <Character>[];
    json.forEach((value) {
      characters.add(Character.fromJson(value as Map<String, dynamic>));
    });
  }

  List<dynamic> toJson() {
    List<dynamic> result = <dynamic>[];

    characters.forEach((element) {
      result.add(element.toJson());
    });

    return result;
  }
}
