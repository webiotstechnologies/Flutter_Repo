import 'package:flutter/cupertino.dart';
import '../config.dart';
import 'date_time_sheet_common.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return DateTimePickerSheetCommon(
        mode: CupertinoDatePickerMode.time,
        onDateTimeChanged: (val) => homeCtrl.onTimeChange(val),
      );
    });
  }
}