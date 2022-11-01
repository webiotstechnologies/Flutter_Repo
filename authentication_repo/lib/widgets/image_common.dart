import '../config.dart';

class ImagesCommon extends StatelessWidget {
  final String? image;
  final GestureTapCallback? onTap;

  const ImagesCommon({Key? key, this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Social Login Images Common
    return Image.asset(image!, scale: 15).inkWell(onTap: onTap);
  }
}
