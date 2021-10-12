part of 'there_is_store_cubit.dart';

abstract class ThereIsStoreState extends Equatable {
  const ThereIsStoreState();

  @override
  List<Object> get props => [];
}

class ThereIsStoreInitial extends ThereIsStoreState {}

class ThereIsStoreLoading extends ThereIsStoreState {}

class ThereIsStoreLoaded extends ThereIsStoreState {
  final StoreModel storeModel;

  ThereIsStoreLoaded(this.storeModel);
  @override
  List<Object> get props => [storeModel];
}

class ThereIsStoreError extends ThereIsStoreState {
  final String message;

  ThereIsStoreError(this.message);
  @override
  List<Object> get props => [message];
}
