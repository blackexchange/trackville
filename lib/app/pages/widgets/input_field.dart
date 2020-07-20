import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final Stream<String> stream;
  final Function(String) onChanged;
  final bool enabled;
  final String initialValue;

  InputField ({this.hint, this.obscure, this.icon, this.stream, this.onChanged, this.enabled, this.initialValue});

  @override

  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: stream,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.white24,
                      width: 0.5,
                    )
                )
            ),
            child: TextFormField(
              onChanged: onChanged,
              obscureText: obscure,
              enabled: enabled,
              initialValue: initialValue,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  icon: Icon(
                    icon,
                    color: Colors.indigo,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                  ),
                  contentPadding: EdgeInsets.only(
                      top: 30,
                      right: 30,
                      bottom: 30,
                      left: 5
                  ),
                  errorText: snapshot.hasError ? snapshot.error : null
              ),
            ),
          );
        }
    );
  }
}
