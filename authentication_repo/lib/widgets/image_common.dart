import '../config.dart';

class ImagesCommon extends StatelessWidget {
  final String? image;
  final GestureTapCallback? onTap;

  const ImagesCommon({Key? key, this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image!, scale: 12).inkWell(onTap: onTap);
  }
}
