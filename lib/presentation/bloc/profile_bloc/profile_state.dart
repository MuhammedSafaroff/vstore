import 'package:equatable/equatable.dart';
import 'package:vstore_appl/data/models/profile_model.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final String? token;
  final ProfileModel? model;

  ProfileLoadedState({this.model, this.token});
  List<Object> get props => [model!, token!];
}

class ProfileErrorState extends ProfileState {
  final String message;
  ProfileErrorState(this.message);
  @override
  List<Object> get props => [message];
}
