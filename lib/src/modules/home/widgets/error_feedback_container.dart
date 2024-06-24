import 'package:flutter/material.dart';
import 'package:reative_template_app_flutter/src/modules/home/widgets/reload_icon_button.dart';
import 'package:reative_template_app_flutter/src/shared/app_colors.dart';

class ErrorFeedbackContainer extends StatelessWidget {
  const ErrorFeedbackContainer({
    super.key,
    required this.errorMessage,
    required this.onTapReloadFunction,
  });

  final String errorMessage;
  final void Function() onTapReloadFunction;

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors();
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 7,
        margin: const EdgeInsets.only(left: 40, right: 40),
        padding: const EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          color: appColors.errorContainerBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(errorMessage),
            Align(
              alignment: Alignment.bottomRight,
              child: ReloadIconButton(onTapReloadFunction: onTapReloadFunction),
            )
          ],
        ),
      ),
    );
  }
}
