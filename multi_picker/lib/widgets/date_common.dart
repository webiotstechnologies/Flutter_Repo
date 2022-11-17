import 'package:flutter/cupertino.dart';
import '../config.dart';
class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      // Date Picker BottomSheet
      return DateTimePickerSheetCommon(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (val) => homeCtrl.onDateChange(val));
    });
  }
}
