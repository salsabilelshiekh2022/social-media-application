import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../home/presentation/views/widgets/post.dart';

import '../../../../../core/theme/app_colors.dart';
import 'for_you_content_body.dart';
import 'trends_content_body.dart';
import 'users_content_body.dart';

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
      content: const Center(child: ForYouContantBody()),
    ),
    TabData(
      index: 2,
      title: const Tab(
        child: Text('Treands'),
      ),
      content: const Center(child: TrendsContentBody()),
    ),
    TabData(
      index: 3,
      title: const Tab(
        child: Text('Users'),
      ),
      content: const Center(child: UsersContantBody()),
    ),
    TabData(
      index: 4,
      title: const Tab(
        child: Text('Posts'),
      ),
      content: const Center(child: PostContentBody()),
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

class PostContentBody extends StatelessWidget {
  const PostContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: const Post(),
              )),
    );
  }
}
