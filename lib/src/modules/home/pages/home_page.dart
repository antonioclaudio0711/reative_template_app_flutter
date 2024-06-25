import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reative_template_app_flutter/src/modules/home/widgets/custom_device_button.dart';
import 'package:reative_template_app_flutter/src/modules/home/widgets/error_feedback_container.dart';
import 'package:reative_template_app_flutter/src/modules/home/widgets/reload_icon_button.dart';
import 'package:reative_template_app_flutter/src/shared/app_colors.dart';
import 'package:reative_template_app_flutter/src/shared/states/app_states.dart';
import 'package:reative_template_app_flutter/src/shared/store/app_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppStore appStore = AppStore();
  final AppColors appColors = AppColors();

  @override
  void initState() {
    appStore.fetchPageInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: appStore,
          builder: (context, state, widget) {
            if (state is LoadingAppState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccesAppState) {
              final Color primaryColor = Color.fromARGB(
                state.pageInformation.primaryColor.alphaIndex,
                state.pageInformation.primaryColor.redIndex,
                state.pageInformation.primaryColor.greenIndex,
                state.pageInformation.primaryColor.blueIndex,
              );

              final Color secondaryColor = Color.fromARGB(
                state.pageInformation.secondaryColor.alphaIndex,
                state.pageInformation.secondaryColor.redIndex,
                state.pageInformation.secondaryColor.greenIndex,
                state.pageInformation.secondaryColor.blueIndex,
              );

              final Color tertiaryColor = Color.fromARGB(
                state.pageInformation.tertiaryColor.alphaIndex,
                state.pageInformation.tertiaryColor.redIndex,
                state.pageInformation.tertiaryColor.greenIndex,
                state.pageInformation.tertiaryColor.blueIndex,
              );

              return Container(
                height: MediaQuery.of(context).size.height,
                color: primaryColor,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: secondaryColor,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: ReloadIconButton(
                          onTapReloadFunction: () =>
                              appStore.fetchPageInformation(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Center(
                          child: FittedBox(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.pageInformation.templateNumber == 1)
                                Text(
                                  'ShowUp',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                              if (state.pageInformation.templateNumber == 2)
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: state.pageInformation.imageFilePath ==
                                          'assets/images/show_up_logo.png'
                                      ? Image.asset(
                                          state.pageInformation.imageFilePath,
                                        )
                                      : Image.memory(
                                          base64Decode(
                                            state.pageInformation.imageFilePath,
                                          ),
                                        ),
                                ),
                              const SizedBox(height: 20),
                              CustomDeviceButton(
                                buttonIcon: Icons.person_add,
                                buttonDescription: 'Activate Kiosk',
                                secondaryColor: secondaryColor,
                                tertiaryColor: tertiaryColor,
                              ),
                              CustomDeviceButton(
                                buttonIcon: Icons.qr_code_scanner,
                                buttonDescription: 'Activate Session Scanner',
                                secondaryColor: secondaryColor,
                                tertiaryColor: tertiaryColor,
                              ),
                              CustomDeviceButton(
                                buttonIcon: Icons.people_alt,
                                buttonDescription: 'Activate Leads',
                                secondaryColor: secondaryColor,
                                tertiaryColor: tertiaryColor,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorAppState) {
              return ErrorFeedbackContainer(
                errorMessage: state.message,
                onTapReloadFunction: () => appStore.fetchPageInformation(),
              );
            }
            return Container();
          }),
    );
  }
}
