import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vstore_appl/data/models/store_model.dart';

part 'there_is_store_state.dart';

class ThereIsStoreCubit extends Cubit<ThereIsStoreState> {
  ThereIsStoreCubit() : super(ThereIsStoreInitial());
}
