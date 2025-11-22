import 'package:equatable/equatable.dart';

abstract class ProductListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductListEvent {}
