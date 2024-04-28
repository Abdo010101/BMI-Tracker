import 'package:flutter/material.dart';

navigatTo(context, Widget nextWidget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return nextWidget;
  }));
}
