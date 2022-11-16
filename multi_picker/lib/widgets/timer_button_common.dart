import '../config.dart';

class TimeButtons extends StatelessWidget {
  const TimeButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Text(appFonts.pickDateTime,
                  style: AppCss.montserratExtraBold16)),
          // Selected Date Time
          Expanded(
              child: ElevatedButtonCommon(
                  title: homeCtrl.dateTime != null
                      ? "${homeCtrl.dateTime?.month}-${homeCtrl.dateTime?.day}-${homeCtrl.dateTime?.year} | ${homeCtrl.morningTime?.hour}:${homeCtrl.morningTime?.minute} ${homeCtrl.morningTime!.period == DayPeriod.am ? "AM" : "PM"}"
                      : appFonts.clickHere,
                  onPressed: () => appCtrl.onDateTimeSelect()))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child:
                  Text(appFonts.pickDate, style: AppCss.montserratExtraBold16)),
          // Selected Date
          Expanded(
              child: ElevatedButtonCommon(
                  title: homeCtrl.date != null
                      ? '${homeCtrl.date?.month}-${homeCtrl.date?.day}-${homeCtrl.date?.year}'
                      : appFonts.clickHere,
                  onPressed: () => appCtrl.onDateSelect()))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child:
                  Text(appFonts.pickTime, style: AppCss.montserratExtraBold16)),
          // Selected Time
          Expanded(
              child: ElevatedButtonCommon(
                  title: homeCtrl.noonTime != null
                      ? '${homeCtrl.noonTime?.hour}:${homeCtrl.noonTime?.minute} ${homeCtrl.noonTime!.period == DayPeriod.am ? "AM" : "PM"}'
                      : appFonts.clickHere,
                  onPressed: () => appCtrl.onTimeSelect()))
        ])
      ]);
    });
  }
}
