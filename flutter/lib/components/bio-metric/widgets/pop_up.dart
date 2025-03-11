import 'package:components/common/title.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';


void qrPopup(BuildContext context) async {
  final String url = "https://www.github.com";

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: SizedBox(
          child: Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText("Scan this QR Code"),
                QrImageView(
                  data: url, 
                  size: 200, 
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(onPressed: (){}, child: Text("Download")),
          TextButton(onPressed: () async => await Share.share(url), child: Text("Share as URL")),
        ],
      );
    },
  );
}

