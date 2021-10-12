import 'package:equatable/equatable.dart';

class MenuSelectedState extends Equatable {
  final String key;
  final int navItemIndex;

  MenuSelectedState(this.key, this.navItemIndex);

  @override
  List<Object> get props => [key, navItemIndex];
}
