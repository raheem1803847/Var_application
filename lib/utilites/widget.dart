import 'package:flutter/material.dart';

   const x=InputDecoration(
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color:Colors.blue,
      width: 2.0,
    ),
  ),
);

MaterialButton longButtons(String title, final VoidCallback? fun,
    {Color color: Colors.black, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun,
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}

InputDecoration buildInputDecoration2(String hintText) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
