// TODO Implement this library.
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServerStatus {
  final String url;

  ServerStatus(this.url);

  Future<bool> isServerOnline() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Server is online
        return true;
      } else {
        // Server is offline
        return false;
      }
    } catch (e) {
      // Error occurred while fetching server status
      return false;
    }
  }
}
