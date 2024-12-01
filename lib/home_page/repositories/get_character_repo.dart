import 'package:dio/dio.dart';
import 'package:rick_and_mort/home_page/models/character_model.dart';

class GetCharacterRepo {
  final Dio dio;
  GetCharacterRepo({required this.dio});

  Future<CharacterModel> getCharacrerData({required String name}) async {
    final response = await dio.get('character/?name=$name');
    return CharacterModel.fromJson(response.data);
  }
}
 