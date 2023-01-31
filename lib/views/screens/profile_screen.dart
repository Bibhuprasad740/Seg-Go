import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/widgets/big_button.dart';
import 'package:vidmo/views/widgets/setting_option.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logoutDialog() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log out?'),
        actions: [
          ElevatedButton(onPressed: Get.back, child: const Text('No')),
          ElevatedButton(
              onPressed: GlobalVariables.authController.logout,
              child: const Text('Yes')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => Container(
          alignment: Alignment.center,
          child: GlobalVariables.firestoreController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: GlobalVariables.accentColor,
                          borderRadius: BorderRadius.circular(77),
                          gradient: const LinearGradient(
                            colors: [
                              GlobalVariables.accentColor,
                              GlobalVariables.backgroundColor,
                              GlobalVariables.accentColor,
                              GlobalVariables.primaryTextColor,
                              Colors.red,
                              GlobalVariables.secondaryTextColor,
                              GlobalVariables.accentColor,
                            ],
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: GlobalVariables.secondaryTextColor,
                          backgroundImage: NetworkImage(
                            GlobalVariables.firestoreController.userModel.value!
                                .profileImage,
                          ),
                          radius: 75,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        GlobalVariables
                            .firestoreController.userModel.value!.name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        GlobalVariables
                            .firestoreController.userModel.value!.email,
                        style: const TextStyle(
                          fontSize: 16,
                          color: GlobalVariables.secondaryTextColor,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigButton(
                            onTap: () {},
                            text: 'Edit Profile',
                            width: size.width * 0.55,
                          ),
                          IconButton(
                            onPressed:
                                GlobalVariables.firestoreController.addData,
                            icon: const Icon(Icons.refresh),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SettingOption(
                        onTap: () {},
                        width: size.width * 0.85,
                        icon: Icons.settings,
                        text: 'Settings',
                      ),
                      const SizedBox(height: 15),
                      SettingOption(
                        onTap: () {},
                        width: size.width * 0.85,
                        icon: Icons.save_as,
                        text: 'Credit Cards',
                      ),
                      const SizedBox(height: 15),
                      SettingOption(
                        onTap: () {},
                        width: size.width * 0.85,
                        icon: Icons.article,
                        text: 'FAQ',
                      ),
                      const SizedBox(height: 15),
                      SettingOption(
                        onTap: () => showLicensePage(context: context),
                        width: size.width * 0.85,
                        icon: Icons.content_paste,
                        text: 'Show Licence',
                      ),
                      const SizedBox(height: 15),
                      SettingOption(
                        onTap: _logoutDialog,
                        width: size.width * 0.85,
                        icon: Icons.logout,
                        text: 'Log Out',
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
