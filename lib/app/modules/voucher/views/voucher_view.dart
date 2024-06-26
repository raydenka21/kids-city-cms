import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voucher_controller.dart';


class VoucherView extends StatelessWidget {
  const VoucherView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final VoucherController state = Get.put(VoucherController());
    state.getAllVoucher();

    Future onRefresh() async {
      state.refreshData();
    }

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && state.hasMore.value) {
        state.getAllVoucher();
      }
    }

    scrollController.addListener(onScroll);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Obx(() => ListView.builder(
            controller: scrollController,
            itemCount: state.hasMore.value
                ? state.voucher.length + 1
                : state.voucher.length,
            itemBuilder: (context, index) {
              if (index < state.voucher.length) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                    NetworkImage(state.voucher[index].avatar ?? ''),
                  ),
                  title: Text(state.voucher[index].number_voucher.toString() ?? ''),
                  subtitle: Text(state.voucher[index].redeem_by ?? ''),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              }
            })),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

