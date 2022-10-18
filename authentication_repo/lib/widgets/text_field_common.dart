import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final String? hintText;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? keyboardType;

  const TextFieldCommon(
      {Key? key, this.controller, this.validator, this.hintText,this.maxLength,this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(hintText: hintText
        ),
    );
  }
}
