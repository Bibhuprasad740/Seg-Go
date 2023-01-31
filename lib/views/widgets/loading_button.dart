import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../global_variables.dart';

class LoadingButton extends StatelessWidget {
  final double height;
  const LoadingButton({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: GlobalVariables.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: const LoadingIndicator(
          indicatorType: Indicator.ballPulse,
          colors: [
            GlobalVariables.primaryTextColor,
          ],
          pathBackgroundColor: GlobalVariables.blackColor,
        ),
      ),
    );
  }
}
