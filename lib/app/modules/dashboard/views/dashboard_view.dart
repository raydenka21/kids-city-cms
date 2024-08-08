import 'package:kids_city_cms/app/modules/redeem/views/redeem_view.dart';
import 'package:kids_city_cms/app/modules/profile/views/profile_view.dart';
import 'package:kids_city_cms/app/modules/voucher/views/voucher_view.dart';
import 'package:kids_city_cms/app/modules/home/views/home_view.dart';

import 'package:kids_city_cms/app/modules/notification/views/notification_view.dart';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:kids_city_cms/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("CMS Kids City", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: getBody(),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          items: [
            TabItem(icon: Icons.sell),
            TabItem(icon: Icons.notifications),
            TabItem(icon: Icons.qr_code_2),
            TabItem(icon: Icons.account_circle),
            TabItem(icon: Icons.logout),
          ],
          initialActiveIndex: 0,
          onTap: (int i) => {
                if (i < 4)
                  {
                    setState(() {
                      _currentIndex = i;
                    })
                  }else
                  {
                    Get.toNamed(Routes.HOME)
                  }
              }),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      VoucherView(title: 'Infinite Pagination'),
      NotificationView(),
      RedeemView(),
      ProfileView(),
      HomeView(),
    ];
    return Scaffold(
      body: pages[_currentIndex],
    );
  }
}
