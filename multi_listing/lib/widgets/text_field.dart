import '../config.dart';

class TextFields extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final InputBorder? border;
 final ValueChanged? onChanged;

  const TextFields(
      {Key? key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.fillColor,
      this.onChanged,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.r20),
        borderSide: BorderSide.none);
    return TextFormField(
      onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            focusedBorder: border ?? inputBorder,
            enabledBorder: border ?? inputBorder,
            contentPadding: const EdgeInsets.symmetric(horizontal: Insets.i25),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle:
                AppCss.montserratRegular16.textColor(appCtrl.appTheme.content),
            hintText: hintText));
  }
}
