import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;
  const SearchWidget({super.key, required this.text, required this.onChanged, required this.hintText});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;
    return Container(
      height: 42.h,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16).r,
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: const Icon(Icons.search,color: Colors.black,),
          suffixIcon: widget.text.isNotEmpty ? GestureDetector(
            child: Icon(Icons.close,color: style.color,),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ) : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
