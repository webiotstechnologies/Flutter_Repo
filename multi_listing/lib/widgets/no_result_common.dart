import '../config.dart';

class NoItemFound extends StatelessWidget {
  const NoItemFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.search_off),
      Text(appFonts.itemNotFound,
          style: AppCss.montserratSemiBold14)
    ]);
  }
}
