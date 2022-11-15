import 'package:flutter/cupertino.dart';
import '../config.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      // Select Time BottomSheet
      return DateTimePickerSheetCommon(
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (val) => homeCtrl.onTimeChange(val));
    });
  }
}
