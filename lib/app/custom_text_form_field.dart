import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
export 'package:get/get.dart';
export 'package:flutter/material.dart';
export 'package:pin_code_fields/pin_code_fields.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
   final String? Function(String?)? validator;
   final Function(String?)  onSaved;
  final Icon? iconData;
  final int? maxLine;
  final TextInputType? textInputType;
  final Color? fillColor;
  final String? textInitialValue;
  final TextEditingController? textEditingController;
  final bool? long;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final Color? hintColor;
  final Color? tabColor;
  final Color? untabColor;
  final bool? isHome;
  final bool? prefixIcon;
  final bool? autofocus;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final double screenWidth ;
  CustomTextFormField
      (
      {Key? key,
      this.hintText ,
      required this.validator ,
      required this.onSaved,
      this.iconData,
      this.maxLine,
      this.textInputType,
      this.fillColor,
      this.textInitialValue,
      this.textEditingController,
      this.long,
      this.suffixIcon,
      required this.isPassword,
      this.controller,
      this.hintColor,
      this.tabColor,
      this.untabColor,
      this.isHome,
      this.prefixIcon,
      this.autofocus,
      this.textAlign,
      this.contentPadding,
      required this.screenWidth,
      }); // CustomTextFormField
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField>
{
  IconData iconData = FontAwesomeIcons.eyeSlash;
  bool toggleEye = true;
  fmToggleEye() {
    toggleEye = !toggleEye;
    iconData = toggleEye ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye;
    setState(() {});
  }
  bool taped = false;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    focusNode.addListener(() {
      taped = focusNode.hasFocus;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.03),
      child: TextFormField(
        initialValue: widget.textInitialValue,
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),

        onSaved: widget.onSaved,
        validator: widget.validator,
        onChanged: widget.onSaved,
        controller: widget.controller,
        maxLines: widget.maxLine,
        obscureText: widget.isPassword == null ? toggleEye : widget.isPassword,
        keyboardType: widget.textInputType,
        textInputAction:TextInputAction.done,
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: Colors.blueGrey, width: 0.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 4.0,
            ),
          ),
          filled: true,
          fillColor: widget.fillColor == null ? Color(0xffefeff4) : widget.fillColor,
          suffix: widget.isPassword == null
              ? GestureDetector(
                  child: Icon(
                    iconData,
                    color: Get.theme.primaryColor,
                  ),
                  onTap: () {
                    fmToggleEye();
                  },
                )
              : null,
           hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white),
          labelStyle: Get.textTheme.headline4,
        ),
      ),
    );
  }
}





