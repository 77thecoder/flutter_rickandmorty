import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rickandmorty/models/character_list.dart';

class RestApiService {
  final dio = Dio();

  Future<CharacterList> getListCharacter(int page) async {
    var response =
        await dio.get('https://rickandmortyapi.com/api/character?page=$page');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return CharacterList.fromJson(data['results']);
    } else {
      throw Exception("Couldn't get characters");
    }
  }
}
