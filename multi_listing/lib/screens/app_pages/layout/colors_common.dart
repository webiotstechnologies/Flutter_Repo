import '../../../config.dart';

class ColorsCommon extends StatelessWidget {
  final Color? color;

  const ColorsCommon({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
          width: 25,
        ).decorated(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r50))),
        const VSpace(Sizes.s8),
        Container(height: 1,width: 30,color: appCtrl.appTheme.blackColor)
      ]
    );
  }
}
