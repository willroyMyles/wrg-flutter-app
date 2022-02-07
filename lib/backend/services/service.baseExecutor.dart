import 'package:dio/dio.dart';

mixin BaseExecutor {
  final dio = Dio();

  // String baseUrl = "http://localhost:3000";
  String baseUrl = "http://192.168.100.194:3000";
  // String baseUrl = "https://wrg-nest.herokuapp.com";
  String userinfo = "/user-info";
  String post = "/post";
  String commentUrl = "/comment";
  String messageUrl = "/message";
  String convoUrl = "/conversation";
  String offer = "/offer";

  initialize() {
    dio.options = BaseOptions(
      contentType: "application/json",
    );
  }

  Future<Response> create(String endpoint, dynamic data) async {
    var response = await dio.post(baseUrl + endpoint, data: data);
    return response;
  }

  Future<Response> findAll(String endpoint) async {
    var response = await dio.get("$baseUrl$endpoint",
        options: Options(receiveTimeout: 3000));
    return response;
  }

  Future<Response> findOne(String endpoint, String id) async {
    var response = await dio.get("$baseUrl$endpoint/$id");
    return response;
  }

  Future<Response> updateOne(String endpoint, String id, dynamic data) async {
    var response = await dio.patch("$baseUrl$endpoint/$id", data: data);
    return response;
  }

  Future<Response> delete(String endpoint, String id) async {
    var response = await dio.delete("$baseUrl$endpoint/$id");
    return response;
  }
}
