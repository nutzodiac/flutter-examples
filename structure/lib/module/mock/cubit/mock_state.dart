import 'package:equatable/equatable.dart';

abstract class MockState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitState extends MockState {}
class LoadingState extends MockState {}

class SuccessState extends MockState {
  final dynamic data;
  SuccessState({required this.data});
}

class DepositSuccessState extends MockState {
  final dynamic data;
  DepositSuccessState({required this.data});
}

class WithDrawSuccessState extends MockState {
  final dynamic data;
  WithDrawSuccessState({required this.data});
}

class ErrorState extends MockState {
  final String message;
  ErrorState({required this.message});
}