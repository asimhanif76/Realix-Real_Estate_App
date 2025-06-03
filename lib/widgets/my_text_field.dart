import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatefulWidget {
  final bool isPasswordField;
  final String labelText;
  final TextEditingController controller;
  final Widget? trailingIcon;
  final Widget? prefixIcon;
  final Color color;
  final bool border;
  final bool isReadable;
  final VoidCallback? onTap;
  final TextInputType keyBoardType;

  const MyTextField({
    super.key,
    this.isPasswordField = false,
    required this.labelText,
    required this.controller,
    this.trailingIcon,
    this.prefixIcon,
    this.color = const Color(0xFFF4F5F6),
    this.border = false,
    this.isReadable = false,
    this.onTap,
    this.keyBoardType = TextInputType.text,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isFocused = false;
  bool isObscure = true;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.025),
      child: Container(
        padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isFocused
                ? Color(0xFF2FA2B9)
                : widget.border
                    ? Color(0xFFF4F5F6)
                    : Colors.transparent,
            width: 1.5,
          ),
          color: widget.color,
        ),
        child: Center(
          child: TextField(
            keyboardType: widget.keyBoardType,
            onTap: widget.onTap,
            controller: widget.controller,
            focusNode: focusNode,
            readOnly: widget.isReadable,
            cursorHeight: 20,
            cursorColor: Colors.grey,
            obscureText: widget.isPasswordField ? isObscure : false,
            decoration: InputDecoration(
                contentPadding: widget.prefixIcon == null
                    ? EdgeInsets.only(left: width * 0.05)
                    : EdgeInsets.symmetric(horizontal: 0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                
                prefixIcon:
                    widget.prefixIcon != null ? widget.prefixIcon : null,
                suffixIcon: widget.trailingIcon != null
                    ? widget.trailingIcon
                    : widget.isPasswordField
                        ? IconButton(
                            icon: Icon(isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          )
                        : null,
                fillColor: widget.color,
                filled: true,
                hintText: widget.labelText,
                labelStyle: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
