import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class OnlineTime {
  String? time;
  String? location;
  String? url;
  OnlineTime({this.location, this.url});
  Future<void> gettime() async {
    Response response =
    await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = {};
    data = jsonDecode(response.body);
    DateTime currenttime = DateTime.parse(data['datetime']);
    String locoffsite = data['utc_offset'].substring(1, 3);
    currenttime = currenttime.add(Duration(hours: int.parse(locoffsite)));
    time = DateFormat.jm().format(currenttime);
  }
}
