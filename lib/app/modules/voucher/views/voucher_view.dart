import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/voucher_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class VoucherView extends StatelessWidget {
  const VoucherView({super.key, required this.title, this.message});

  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    print(message);
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
                  title: Text(state.voucher[index].code.toString() ?? ''),
                  subtitle: Text(state.voucher[index].status ?? ''),
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

  _getWidgetFloating(message,BuildContext context) {
    if (message!=null) {
      return Alert(
        context: context,
        title: "RFLUTTER ALERT",
        desc: "Flutter is more awesome with RFlutter Alert.",
      ).show();
    } else {
      return Alert(
        context: context,
        title: "RFLUTTER ALERT",
        desc: "Flutter is more awesome with RFlutter Alert.",
      ).show();
    }
  }
}
