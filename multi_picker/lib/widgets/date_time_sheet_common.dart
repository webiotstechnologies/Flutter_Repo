import 'package:flutter/cupertino.dart';
import '../config.dart';

class DateTimePickerSheetCommon extends StatelessWidget {
  final CupertinoDatePickerMode mode;
  final ValueChanged<DateTime> onDateTimeChanged;
  const DateTimePickerSheetCommon({Key? key,required this.mode,required this.onDateTimeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Container(
          color: appCtrl.appTheme.greyShade,
          child: Column(children: [
            // CupertinoDatePicker Common
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: CupertinoDatePicker(
                    mode: mode,
                    initialDateTime: DateTime.now(),
                    dateOrder: DatePickerDateOrder.dmy,
                    onDateTimeChanged: onDateTimeChanged)),
            // Close the modal
            CupertinoButton(
                child: Text(appFonts.ok,style: AppCss.montserratSemiBold16,), onPressed: () => Get.back())
          ])).height(MediaQuery.of(context).size.height * 0.5);
    });
  }
}
