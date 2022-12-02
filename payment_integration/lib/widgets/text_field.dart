
import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final InputBorder? border;
  final TextInputType? keyBoardType;

  const TextFieldCommon(
      {Key? key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.fillColor,
      this.keyBoardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r8),
        borderSide: BorderSide(color: appCtrl.appTheme.indigoShade));
    // TextField Common
    return TextFormField(
        keyboardType: keyBoardType,
        validator: validator,
        controller: controller,

        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r8),
                borderSide: BorderSide(color: appCtrl.appTheme.error)),
            filled: true,
            fillColor: fillColor,
            focusedBorder: border ?? inputBorder,
            border: border?? inputBorder ,
            enabledBorder: border ?? inputBorder,
            contentPadding: const EdgeInsets.symmetric(horizontal: Insets.i10),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle:
                AppCss.montserratRegular16.textColor(appCtrl.appTheme.indigo),
            hintText: hintText));
  }
}
