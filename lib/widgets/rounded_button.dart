import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text;
  final Function press;
  final Icon icon;
  final Color textColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.icon,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          height: size.height * 0.1,
          child: _flag
              ? ElevatedButton(
                  child: Row(
                    children: [
                      this.widget.icon,
                      SizedBox(
                        width: 15,
                      ),
                      Text(this.widget.text, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () => setState(() => _flag = !_flag),
                )
              : ElevatedButton(
                  child: Row(
                    children: [
                      this.widget.icon,
                      SizedBox(
                        width: 15,
                      ),
                      Text(this.widget.text, style: TextStyle(fontSize: 14)),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.check_rounded)
                    ],
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        _flag ? Colors.red : Colors.teal,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () => setState(() => _flag = !_flag),
                )),
    );
  }
}
