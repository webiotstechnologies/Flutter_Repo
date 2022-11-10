import 'package:flutter/cupertino.dart';
import '../config.dart';
import 'date_time_sheet_common.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return DateTimePickerSheetCommon(
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (val) => homeCtrl.onDateTimeChange(val),
      );
    });
  }
}
