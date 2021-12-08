import 'package:biocheck_flutter/app/data/models/template.dart';
import 'package:biocheck_flutter/app/global_widgets/input.dart';
import 'package:biocheck_flutter/app/utils/palette.dart';
import 'package:biocheck_flutter/app/utils/typography_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  var isDarkMode = false;
  var isNotifications = false;
  var isFaceid = false;
  var isBigFont = false;

  final AppBar appbar = AppBar(
    title: const Text(
      'Settings',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        body: Center(
          child: Column(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.settings.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = controller.settings.keys.elementAt(index);
                    return SwitchListTile(
                        title: Text(key),
                        value: controller.settings[key],
                        onChanged: (value) {
                          controller.box.write(controller.settings[key], value);
                        });
                  }),
              ElevatedButton(
                child: Text('Save Settings'),
                onPressed: () async {
                  await controller.box.write('settings', controller.settings);
                },
              )
            ],
          ),
        ));
  }
}
