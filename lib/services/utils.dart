import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String listToString(List<String> list, String seperator) {
    String generatedString = '';
    if (list == null) {
      return '---';
    } else {
      list.forEach((element) {
        generatedString += element + seperator;
      });
      return generatedString;
    }
  }

  static Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String trimString(String strToTrim, [int trimLimit = 40]) {
    if (strToTrim.length > trimLimit) {
      return '${strToTrim.substring(0, trimLimit)}...';
    }
    return strToTrim;
  }
}
