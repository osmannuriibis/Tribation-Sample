import 'package:web_socket_channel/io.dart';

class WebSocketService /* extends IOWebSocketChannel */{
  final url = "wss://demo.piesocket.com/v3/channel_123?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self";
  

  IOWebSocketChannel connect() => IOWebSocketChannel.connect(url);
}
