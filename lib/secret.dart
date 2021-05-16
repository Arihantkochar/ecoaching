import 'dart:io';

class Secret {
  static const ANDROID_CLIENT_ID = "364898962763-obtlck6q9v62qspo59jsaarjbi6s8uev.apps.googleusercontent.com";
  // static const IOS_CLIENT_ID = "<enter your iOS client secret>";
  static String getId() =>Secret.ANDROID_CLIENT_ID;
      // Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : Secret.IOS_CLIENT_ID;
}