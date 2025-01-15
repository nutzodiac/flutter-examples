import 'package:equatable/equatable.dart';

abstract class TempState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitState extends TempState {}
class LoadingState extends TempState {}

class SuccessState extends TempState {
  final dynamic data;
  SuccessState({required this.data});
}

class ErrorState extends TempState {
  final String message;
  ErrorState({required this.message});
}