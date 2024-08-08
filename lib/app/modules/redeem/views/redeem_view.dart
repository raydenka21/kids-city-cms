import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter/foundation.dart';


import '../controllers/redeem_controller.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import 'package:kids_city_cms/app/routes/app_pages.dart';
import 'package:quickalert/quickalert.dart';



class RedeemView extends GetView<RedeemController> {
  const RedeemView({Key? key,String? res}) : super(key: key);

 


  @override
  Widget build(BuildContext context) {
    final RedeemController state = Get.put(RedeemController());

    return Scaffold(
      body: QRCodeDartScanView(
        scanInvertedQRCode: true, // enable scan invert qr code ( default = false)

        typeScan: TypeScan.live, // if TypeScan.takePicture will try decode when click to take a picture(default TypeScan.live)
        // intervalScan: const Duration(seconds:1)
        // onResultInterceptor: (old,new){
        //  do any rule to controll onCapture.
        // }
        // takePictureButtonBuilder: (context,controller,isLoading){ // if typeScan == TypeScan.takePicture you can customize the button.
        //    if(loading) return CircularProgressIndicator();
        //    return ElevatedButton(
        //       onPressed:controller.takePictureAndDecode,
        //       child:Text('Take a picture'),
        //    );
        // }
        // resolutionPreset: = QrCodeDartScanResolutionPreset.high,
        // formats: [ // You can restrict specific formats.
        //  BarcodeFormat.qrCode,
        //  BarcodeFormat.aztec,
        //  BarcodeFormat.dataMatrix,
        //  BarcodeFormat.pdf417,
        //  BarcodeFormat.code39,
        //  BarcodeFormat.code93,
        //  BarcodeFormat.code128,
        //  BarcodeFormat.ean8,
        //  BarcodeFormat.ean13,
        // ],
        onCapture: (Result result) async {
          String? voucher;
          voucher = result.text;
          await state.doRedeem(voucher);
          print(voucher);
          if(voucher!=''){
            if(state.statusRedeem == true){
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Transaction Completed Successfully!',
              );
              Get.toNamed(Routes.VOUCHER);
            }else{
              await QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: 'Oops...',
                text: 'Sorry, something went wrong',
              );

            }

          }
          // do anything with result
          // result.text
          // result.rawBytes
          // result.resultPoints
          // result.format
          // result.numBits
          // result.resultMetadata
          // result.time
        },
      ),
    );
  }
}
