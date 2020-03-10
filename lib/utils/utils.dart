import 'package:flutter/material.dart';

class Utils {

  static double deviceWidth(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth;
  }

  static double deviceHeight(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return deviceHeight;
  }

  static double deviceHeightWithoutAppBar(BuildContext context) {
    final double deviceHeight =
        MediaQuery.of(context).size.height - kToolbarHeight;
    return deviceHeight;
  }

  static String getDayName(int day) {
    switch (day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thurdsday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return "January";
        break;
      case 2:
        return "February";
        break;
      case 3:
        return "March";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "June";
        break;
      case 7:
        return "July";
        break;
      case 8:
        return "August";
        break;
      case 9:
        return "September";
        break;
      case 10:
        return "October";
        break;
      case 11:
        return "November";
        break;
      case 12:
        return "December";
        break;
      default:
        return "";
    }
  }
}
