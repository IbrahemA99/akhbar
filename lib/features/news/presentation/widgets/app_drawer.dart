import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_forge/core/theme/app_text.dart';
import 'package:news_forge/core/theme/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80),
              color: Colors.white,
              child: Center(
                child: Text(
                  "News_Fprge".tr(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Go to Home
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Image.asset("assets/images/home_IC.png"),
              title: Text(
                "Go_to_Home".tr(),
                style: AppText.headline.copyWith(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Divider(
              color: Colors.white,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),

            // Theme// Theme
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              title: Text(
                "Theme".tr(),
                style: AppText.headline.copyWith(color: Colors.white),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text("Light".tr()),
                            onTap: () {
                              context.read<ThemeCubit>().changeTheme(
                                ThemeMode.light,
                              );
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text("Dark".tr()),
                            onTap: () {
                              context.read<ThemeCubit>().changeTheme(
                                ThemeMode.dark,
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Light".tr(),
                          style: AppText.headline.copyWith(color: Colors.white),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Divider(
              color: Colors.white,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),

            // Language
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              leading: Image.asset("assets/images/language_IC.png"),
              title: Text(
                "Language".tr(),
                style: AppText.headline.copyWith(color: Colors.white),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  if (context.locale.languageCode == "en") {
                    context.setLocale(const Locale("ar"));
                  } else {
                    context.setLocale(const Locale("en"));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "English".tr(),
                          style: AppText.headline.copyWith(color: Colors.white),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
