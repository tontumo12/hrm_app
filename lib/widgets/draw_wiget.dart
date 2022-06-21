import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hrm_app/utils/text_style.dart';

class DrawWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: const Color(0xFF050B5B),
            height: 98,
            child: Column(
              children: [
                SizedBox(height: 50),
                Text('Nguyễn Tôn Tú', style: TextUtils().boldQuickSand.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )),
              ]
            )
          ),
          ListTile(
            title: Text('Cá nhân', style: TextUtils().boldQuickSand.copyWith(
              fontSize: 16,
              color: const Color(0xFF050B5B),
              fontWeight: FontWeight.bold
            )),
            onTap: () {
              // Get.back();
            },
          ),
          ListTile(
            title: Text('Team', style: TextUtils().boldQuickSand.copyWith(
              fontSize: 16,
              color: const Color(0xFF050B5B),
              fontWeight: FontWeight.bold
            )),
            onTap: () {
              // Get.back();
            },
          ),
        ],
      ),
    );
  }
}