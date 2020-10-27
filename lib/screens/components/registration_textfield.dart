import 'package:flutter/material.dart';

class RegTextField extends StatefulWidget {

  @override
  _RegTextFieldState createState() => _RegTextFieldState();

  RegTextField({this.inputTitle, this.onChanged});

  final String inputTitle;
  final Function onChanged;
}

class _RegTextFieldState extends State<RegTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.inputTitle, style: TextStyle(color: Colors.grey.shade800),),
          Container(
            padding: EdgeInsets.only(bottom: 20, left: 8, right: 8),
            child: TextField(
              onChanged: widget.onChanged,
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0x44F16C6C),
              borderRadius: BorderRadius.circular(5),

            ),

          ),
        ],
      ),
    );
  }
}
