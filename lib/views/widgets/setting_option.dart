import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/neumorph_item.dart';

class SettingOption extends StatelessWidget {
  final double width;
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const SettingOption({
    Key? key,
    required this.width,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorph(
      onTap: onTap,
      borderRadius: 25,
      width: width + 20,
      lightColor: GlobalVariables.secondaryTextColor.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        // height: height,
        width: width,
        decoration: BoxDecoration(
          color: GlobalVariables.blackColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: GlobalVariables.accentColor.withOpacity(0.1),
              child: Icon(
                icon,
                size: 25,
                color: GlobalVariables.accentColor,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: onTap,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: GlobalVariables.accentColor.withOpacity(0.1),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: GlobalVariables.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
