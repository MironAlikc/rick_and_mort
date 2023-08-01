part of 'getcharacter_cubit.dart';

abstract class GetcharacterState {
  const GetcharacterState();

  @override
  List<Object> get props => [];
}

class GetcharacterInitial extends GetcharacterState {}

class GetcharacterError extends GetcharacterState {}

class GetcharacterSuccess extends GetcharacterState {
  final CharacterModel model;

  GetcharacterSuccess({required this.model});
}
