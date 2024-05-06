import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class TabViewBar extends StatefulWidget {
  const TabViewBar({super.key});
  @override
  State<TabViewBar> createState() => _TabViewBarState();
}

class _TabViewBarState extends State<TabViewBar> {
  bool isScrollable = true;

  List<TabData> tabs = [
    TabData(
      index: 1,
      title: const Tab(
        child: Text('For You'),
      ),
      content: const Center(child: Text('Content for Tab 1')),
    ),
    TabData(
      index: 2,
      title: const Tab(
        child: Text('Treands'),
      ),
      content: const Center(child: Text('Content for Tab 2')),
    ),
    TabData(
      index: 3,
      title: const Tab(
        child: Text('Users'),
      ),
      content: const Center(child: Text('Content for Tab 3')),
    ),
    TabData(
      index: 4,
      title: const Tab(
        child: Text('Posts'),
      ),
      content: const Center(child: Text('Content for Tab 4')),
    ),
    // Add more tabs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DynamicTabBarWidget(
        dynamicTabs: tabs,
        indicatorColor: AppColors.mainColor,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.fill,
        onTabControllerUpdated: (controller) {},
        onTabChanged: (index) {},
        onAddTabMoveTo: MoveToTab.last,
        labelColor: AppColors.white,
      ),
    );
  }
}
