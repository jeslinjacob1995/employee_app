import 'package:get/get.dart';

class ApiConnector extends GetConnect {
  // Get request
  Future<Response> getUser() => get('http://www.mocky.io/v2/5d565297300000680030a986');

}