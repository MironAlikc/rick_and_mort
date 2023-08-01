import 'package:dio/dio.dart';
import 'package:rick_and_mort/home_page/models/character_model.dart';

class GetCharacterRepo {
  final Dio dio;
  GetCharacterRepo({required this.dio});

  Future<CharacterModel> getCharacrerData() async {
    final response = await dio.get('character');
    return CharacterModel.fromJson(response.data);
  }
}
