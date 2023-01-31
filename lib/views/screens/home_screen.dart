import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/screens/book_vehicle_screen.dart';
import 'package:vidmo/views/widgets/service_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: GlobalVariables.primaryTextColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/map.jpg',
                height: size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 1,
              ),
              children: [
                ServiceItem(
                  onTap: () => Get.to(() => const BookVehicleScreen()),
                  icon: Icons.electric_bike,
                  text: 'Book a Vehicle',
                ),
                ServiceItem(
                  onTap: () {},
                  icon: Icons.troubleshoot,
                  text: 'Troubleshoot',
                ),
                ServiceItem(
                  onTap: () {},
                  icon: Icons.health_and_safety,
                  text: 'Vehicle health check',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/* 
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1,
                )
*/
