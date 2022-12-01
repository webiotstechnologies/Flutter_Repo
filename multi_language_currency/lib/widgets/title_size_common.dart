import '../config.dart';

class TitleSizeCommon extends StatelessWidget {
  final String? title;
  final String? size;

  const TitleSizeCommon({Key? key, this.size, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Title
      SizedBox(
          width: Sizes.s200,
          child: Text(title!,
                  overflow: TextOverflow.fade,
                  style: AppCss.montserratSemiBold14
                      .textColor(appCtrl.appTheme.indigo))
              .paddingSymmetric(vertical: Insets.i5)),
      // Size
      Text('${appFonts.size.tr} $size',
          style: AppCss.montserratExtraBold11
              .textColor(appCtrl.appTheme.lightBlack))
    ]);
  }
}
