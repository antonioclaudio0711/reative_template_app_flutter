import 'package:reative_template_app_flutter/src/shared/models/page_information_model.dart';

abstract class AppState {}

class InitialAppState extends AppState {}

class SuccesAppState extends AppState {
  final PageInformationModel pageInformation;

  SuccesAppState(this.pageInformation);
}

class ErrorAppState extends AppState {
  final String message;

  ErrorAppState(this.message);
}

class LoadingAppState extends AppState {}
