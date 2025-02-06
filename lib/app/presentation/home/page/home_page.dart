import 'package:asset_tracker/app/core/utils/constants/app_texts.dart';
import 'package:asset_tracker/app/presentation/home_content/page/home_page_content.dart';
import 'package:asset_tracker/app/presentation/profile/page/profile_page.dart';
import 'package:asset_tracker/app/providers/home_page_view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = AppTexts.homePageId;

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomePageViewModel>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: PageView(
          controller: homeViewModel.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePageContent(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeViewModel.selectedIndex,
          onTap: homeViewModel.onPageChange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppTexts.homePageBottomNavBar,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppTexts.profileBottomNavBar,
            ),
          ],
        ),
      ),
    );
  }
}
