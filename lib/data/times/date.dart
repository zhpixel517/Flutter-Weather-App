import 'package:weather/weather.dart';

class Dates {
  static int thisHour = DateTime.now().hour;

  String tommorrow() {
    String tommorrow = getWeekday(DateTime.now().day + 1, false);
    return tommorrow;
  }

  static int hourFormat(int hour) {
    if (hour > 12) {
      return (hour - 12);
    } else {
      return hour;
    }
  }

  String convertToDate(String date) {
    // convert "2022-08-03" into "Mon, August 8th"
    try {
      final DateTime? currentDate = DateTime.tryParse(date);
      String dateString =
          "${getWeekday(currentDate!.weekday, false)}, ${_getMonth(currentDate.month)} ${currentDate.day}";

      return dateString;
    } catch (e) {
      return "Waiting for data still";
    }
  }

  String getFormattedTime(String time) {
    final DateTime? currentTime = DateTime.tryParse(time);
    String minute = (currentTime?.minute ?? 0) < 10
        ? "0${currentTime?.minute}"
        : "${currentTime?.minute}"; // will take care of the minute if its a single digit
    String formattedTime = "${currentTime?.hour}:$minute";
    return formattedTime;
  }

  bool isNight(DateTime currentTime, Weather? weatherData) {
    if (currentTime.minute < (weatherData?.sunset?.minute ?? 0) &&
        currentTime.hour > (weatherData?.sunset?.hour ?? 0) &&
        currentTime.hour > 12) {
      // returns true if its night time
      return true;
    } else {
      return false;
    }
  }

  static String getWeekday(int weekday, bool long) {
    switch (weekday) {
      case 1:
        return long ? "Monday" : "Mon";
      case 2:
        return long ? "Tuesday" : "Tues";
      case 3:
        return long ? "Wednesday" : "Wed";
      case 4:
        return long ? "Thursday" : "Thu";
      case 5:
        return long ? "Friday" : "Fri";
      case 6:
        return long ? "Saturday" : "Sat";
      case 7:
        return long ? "Sunday" : "Sun";
      default:
        return "Mon";
    }
  }

  String _getMonth(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "January";
    }
  }
}
