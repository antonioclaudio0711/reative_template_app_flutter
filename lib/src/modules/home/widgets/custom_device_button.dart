import 'package:flutter/material.dart';

class CustomDeviceButton extends StatelessWidget {
  const CustomDeviceButton({
    super.key,
    required this.buttonIcon,
    required this.buttonDescription,
    required this.secondaryColor,
    required this.tertiaryColor,
  });

  final IconData buttonIcon;
  final String buttonDescription;
  final Color secondaryColor;
  final Color tertiaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton.icon(
        icon: Icon(
          buttonIcon,
          color: secondaryColor,
        ),
        onPressed: () {},
        label: FittedBox(
          child: Text(
            buttonDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: secondaryColor,
                ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width / 1.2),
          backgroundColor: tertiaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
