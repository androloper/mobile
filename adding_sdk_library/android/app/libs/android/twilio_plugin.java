package android.app.libs.android;

import com.twilio.chat.ChatClient;

public class TwilioPlugin implements MethodCallHandler {

    private ChatClient chatClient;
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "twilio_chat_conversation/onNewNotifications");
        TwilioPlugin instance = new TwilioPlugin();
        channel.setMethodCallHandler(instance);
    }
    @override
    public void onMethodCall(MethodCall call, Result result){
        switch(call.method){
            case "registerFCMToken":
                String fcmToken = call.argument("token");
                registerFCMToken(fcmToken, result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void registerFCMToken(String token, Result result) {
        if (chatClient != null) {
            chatClient.registerFCMToken(token, new StatusListener() {
                @Override
                public void onSuccess() {
                    result.success("FCM token registered successfully"); }

                @Override
                public void onError(ErrorInfo errorInfo) {
                    result.error("FCM token registration failed", errorInfo.toString(), null);
                }
            });
        } else {
            result.error("Chat client not initialized", "Initialize Twilio first", null);
        }
    }

}