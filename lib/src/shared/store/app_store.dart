import 'package:flutter/material.dart';
import 'package:reative_template_app_flutter/src/shared/models/page_information_model.dart';
import 'package:reative_template_app_flutter/src/shared/services/app_service.dart';
import 'package:reative_template_app_flutter/src/shared/states/app_states.dart';

class AppStore extends ValueNotifier<AppState> {
  AppStore() : super(InitialAppState());

  final AppService appService = AppService();

  Future<void> fetchPageInformation() async {
    value = LoadingAppState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final PageInformationModel pageInformation =
          await appService.fetchPageInformation();

      value = SuccesAppState(pageInformation);
    } catch (e) {
      value = ErrorAppState(e.toString());
    }
  }
}
