import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String url;
  String location;
  String flag;

  WorldTime(this.url, this.location, this.flag);

  String time = '';
  bool isDaytime = false;

  Future<void> getTime() async {

    try {

      Uri url_casted = await Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(url_casted);

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}