import '../config.dart';

class ImageCommon extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  const ImageCommon({Key? key,this.title,this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius:
        const BorderRadius.all(Radius.circular(AppRadius.r20)),
        child: Image.asset(title!,
            height: height, fit: BoxFit.cover, width: width));
  }
}
