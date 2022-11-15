import 'package:flutter/cupertino.dart';
import '../config.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      // Date & Time Picker BottomSheet
      return DateTimePickerSheetCommon(
        mode: CupertinoDatePickerMode.dateAndTime,
        onDateTimeChanged: (val) => homeCtrl.onDateTimeChange(val),
      );
    });
  }
}
