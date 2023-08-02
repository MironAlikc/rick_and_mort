part of 'getcharacter_cubit.dart';

abstract class GetcharacterState {}

class GetcharacterInitial extends GetcharacterState {}

class GetcharacterError extends GetcharacterState {}

class GetcharacterSuccess extends GetcharacterState {
  final CharacterModel model;

  GetcharacterSuccess({required this.model});
}
