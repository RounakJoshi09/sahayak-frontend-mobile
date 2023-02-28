import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.controller,
      this.isObscure = false, this.showSuffixIcon = false});
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final bool isObscure;
  final bool showSuffixIcon;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  Icon visibility_on = Icon(Icons.visibility_outlined);
  Icon visibility_off = Icon(Icons.visibility_off_outlined);
  bool isVisible = false;
  late bool obscure;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      obscure = widget.isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: TextField(
        controller: widget.controller,
        obscureText: obscure,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(220, 228, 230, 234),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(220, 228, 230, 234), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            hintText: widget.title,
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.showSuffixIcon == true ? IconButton(
                icon: isVisible == true ? visibility_on : visibility_off,
                onPressed: () {
                  if (isVisible == false) {
                    setState(() {
                      isVisible = true;
                      obscure = false;
                    });
                  } else {
                    setState(() {
                      isVisible = false;
                      obscure = true;
                    });
                  }
                }) : SizedBox(),)
      ),
    );
  }
}
