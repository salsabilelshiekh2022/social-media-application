import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../chats/presentation/views/chats_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../search/presentation/views/search_view.dart';
import '../../../../core/theme/app_colors.dart';
import 'home_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const SearchView(),
      Container(),
      const ChatsView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        title: 'Home',
        iconSize: 24,
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.grey500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        title: 'Discover',
        iconSize: 20,
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.grey500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_rounded),
        iconSize: 24,
        activeColorPrimary: AppColors.mainColor,
        activeColorSecondary: AppColors.white,
        inactiveColorSecondary: AppColors.grey500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.signalMessenger),
        title: 'Inbox',
        iconSize: 24,
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.grey500,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_rounded),
        title: 'Profile',
        iconSize: 24,
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: AppColors.grey500,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: AppColors.dark1, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: const Border(
                top: BorderSide(
              color: AppColors.dark3,
            )),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  blurStyle: BlurStyle.solid),
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15,

        // Choose the nav bar style with this property.
      ),
    );
  }
}
