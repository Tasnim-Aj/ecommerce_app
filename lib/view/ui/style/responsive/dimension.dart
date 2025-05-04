import 'package:flutter/material.dart';

double responsive(context, double size) {
  double width = MediaQuery.of(context).size.width;
  double screenWidth = 375;
  return (size / screenWidth) * width;
}
