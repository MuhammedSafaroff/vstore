import 'package:equatable/equatable.dart';

class HaveAStoreState extends Equatable {
  final bool haveAStore;

  HaveAStoreState(this.haveAStore);
  @override
  List<Object> get props => [haveAStore];
}
