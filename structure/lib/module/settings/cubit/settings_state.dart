import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitState extends SettingsState {}
class LoadingState extends SettingsState {}

class SuccessState extends SettingsState {
  final dynamic data;
  SuccessState({required this.data});
}

class ErrorState extends SettingsState {
  final String message;
  ErrorState({required this.message});
}