import 'dart:async';

import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:wrg2/backend/models/messages.dart';
import 'package:wrg2/backend/services/service.baseExecutor.dart';

String baseUrl2 = '$baseUrl/msg';

class WebSocketOperations {
  IO.Socket socket = IO.io(
      baseUrl2,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setTimeout(1000)
          .disableAutoConnect()
          .setExtraHeaders({
            "Connetion": "Upgrade",
            "Upgrade": "websocket",
            "Sec-WebSocket-Version": 13
          })
          .build());

  connect() {
    socket.onConnecting((data) {
      print("connecting");
    });

    socket.onConnect((data) {
      print("connected");
    });

    socket.onConnectTimeout((data) {
      print("conncetion timed out");
      socket.dispose();
    });

    socket.onDisconnect((data) {
      print("disconnected");
    });

    try {
      socket.connect();
      // socket.open();
    } on DioError catch (e) {
      print(e);
      socket.disconnect();
      socket.close();
    } catch (e) {
      print(e);
      socket.disconnect();
      socket.close();
    } finally {}
  }

  createRoom(String roomId, StreamController<dynamic> stream) {
    socket.on(roomId, (data) {
      stream.sink.add(data);
    });

    socket.emit("create", roomId);
  }

  leaveRoom(String roomId) {
    socket.emit("leave", roomId);
    socket.dispose();
  }

  sendMessage(MessagesModel msg, String roomId) {
    socket.emit("$roomId", msg.toMap());
  }
}
