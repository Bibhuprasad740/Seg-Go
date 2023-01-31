import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vidmo/views/widgets/custom_button.dart';
import 'package:vidmo/views/widgets/custom_field.dart';
import 'package:vidmo/views/widgets/login_sugnup_button.dart';

import '../../global_variables.dart';

class GoogleMapsScreen extends StatefulWidget {
  GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              GlobalVariables.backgroundImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 3,
          ),
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 40),
                CustomField(
                  controller: _fromController,
                  prefixIcon: Icons.location_city,
                  labelText: 'From',
                ),
                const SizedBox(height: 10),
                CustomField(
                  controller: _toController,
                  prefixIcon: Icons.location_city,
                  labelText: 'To',
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(47.785881, 25.929991),
                      zoom: 14.5,
                    ),
                    markers: {
                      const Marker(
                        markerId: MarkerId('Source'),
                        position: LatLng(47.785881, 25.929991),
                      ),
                    },
                  ),
                ),
                const SizedBox(height: 10),
                LoginSignupButton(
                  height: 50,
                  label: 'Book Your Ride',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
