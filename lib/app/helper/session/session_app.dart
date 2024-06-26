import 'package:flutter_session_manager/flutter_session_manager.dart';

class SessionApp{

  getSession() async {
    String token = await SessionManager().get("token");
    String os = await SessionManager().get("os");
    String deviceId = await SessionManager().get("device_id");
    var data = Map<String, String>();
    data['token'] = token;
    data['os'] = os;
    data['device_id'] = deviceId;
    return data;

  }


  forgotSession() async {
    print('forgot');
    dynamic statusLogout = await SessionManager().destroy();
    return statusLogout;
  }

}
