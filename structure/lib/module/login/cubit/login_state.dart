import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitState extends LoginState {}
class LoadingState extends LoginState {}

class SuccessState extends LoginState {
  final dynamic data;
  SuccessState({required this.data});
}

class ErrorState extends LoginState {
  final String message;
  ErrorState({required this.message});
}