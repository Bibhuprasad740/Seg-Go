import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          vertical: 3,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          color: GlobalVariables.blackColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: GlobalVariables.accentColor.withOpacity(0.2),
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: GlobalVariables.accentColor,
              radius: 20,
              child: Text(
                'T',
                style: TextStyle(
                  color: GlobalVariables.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Vehicle 1',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextSpan(
                        text: '  (id - @19BTEV1)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'SUIIT - Laxmi Takis',
                  style: TextStyle(
                    fontSize: 12,
                    color: GlobalVariables.secondaryTextColor,
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  '-67',
                  style: TextStyle(
                    fontSize: 25,
                    color: GlobalVariables.accentColor,
                  ),
                ),
                Text(
                  '01 Jan, 2023',
                  style: TextStyle(
                    fontSize: 12,
                    color: GlobalVariables.secondaryTextColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
