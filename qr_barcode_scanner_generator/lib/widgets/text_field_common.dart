import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;

  const TextFieldCommon({Key? key, this.controller, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextField Common
    return TextField(
            controller: controller,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: appCtrl.appTheme.indigoShade, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: appCtrl.appTheme.indigoShade, width: 2)),
                labelText: title,
                labelStyle: TextStyle(color: appCtrl.appTheme.indigo)))
        .paddingSymmetric(vertical: Insets.i10);
  }
}
