import 'package:bloc/bloc.dart';
import 'package:rick_and_mort/home_page/models/character_model.dart';
import 'package:rick_and_mort/home_page/repositories/get_character_repo.dart';

part 'getcharacter_state.dart';

class GetcharacterCubit extends Cubit<GetcharacterState> {
  GetcharacterCubit({required this.repo}) : super(GetcharacterInitial());

  final GetCharacterRepo repo;

  Future getCharecter() async {
    try {
      final model = await repo.getCharacrerData();
      emit(GetcharacterSuccess(model: model));
    } catch (e) {
      emit(GetcharacterError());
    }
  }
}
