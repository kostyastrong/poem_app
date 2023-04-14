import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:poem_app/presentation/navigation/named_routes.dart';


void main() {
  // Slow down time to see lerping.
  timeDilation = 0.5;
  runApp(const NamedRoutesWithParams());
}
