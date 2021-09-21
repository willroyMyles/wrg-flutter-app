import 'package:dio/dio.dart';

mixin SlackExecutor {
  final dio = Dio();
  final String slack =
      "https://hooks.slack.com/services/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";

  sendSlackMessage(String msg) async {
    Map<String, String> payload = Map();
    payload.putIfAbsent("text", () => msg);

    var ans = await dio.post(slack, data: payload);
    if (ans.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
