import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/spacing.dart';
import 'widgets/user_image_and_cover.dart';
import 'widgets/user_info.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height + 280.h,
            child: Column(
              children: [
                const UserImageAndCover(),
                verticalSpace(12),
                const UserInfo(),
                SizedBox(
                  height: 50,
                  child: AppBar(
                    bottom: TabBar(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      indicatorColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(
                          child: Text('Posts'),
                        ),
                        Tab(
                          child: Text('Followers'),
                        ),
                        Tab(
                          child: Text('Following'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const <Widget>[
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                      Center(
                        child: Text("It's sunny here"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
