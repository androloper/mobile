import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_events.dart';
import '../bloc/chat_states.dart';
import '../common/api/api_provider.dart';
import '../common/progress_bar.dart';
import '../common/shared_preference.dart';
import '../common/toast_utility.dart';
import '../common/widgets/common_text_button_widget.dart';
import '../common/widgets/common_textfield.dart';
import '../repository/chat_repository.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  final String? platformVersion;
  const HomeScreen({super.key, this.platformVersion});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ChatBloc? chatBloc;

  String? identity;
  final TextEditingController _userNameController = TextEditingController();
  SharedPreference sharedPreference = SharedPreference();

  @override
  void initState() {
    super.initState();
    chatBloc = BlocProvider.of<ChatBloc>(context);
  }

  //message attempt from mobile app

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Twilio Chat Conversation'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: BlocConsumer<ChatBloc, ChatStates>(
            builder: (BuildContext context, ChatStates state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: SvgPicture.asset(
                      "assets/images/twilio_logo_red.svg",
                      color: Colors.red,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.16,
                ),
                const Text(
                  "🧑 Please Enter User Name",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.visible,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.050,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.82,
                    child: TextInputField(
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 0.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      textCapitalization: TextCapitalization.none,
                      hintText: "",
                      maxLength: 100,
                      textInputFormatter: const [],
                      keyboardType: TextInputType.text,
                      width: MediaQuery.of(context).size.width * 0.90,
                      color: Colors.white,
                      borderColor: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.31),
                          blurRadius: 15,
                          offset: const Offset(-5, 5),
                        )
                      ],
                      controller: _userNameController,
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.visible,
                        decoration: TextDecoration.none,
                      ),
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CommonTextButtonWidget(
                  isIcon: false,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.82,
                  bgColor: Colors.blueGrey,
                  borderColor: Colors.white,
                  title: "Generate Token and Initialize Client",
                  titleFontSize: 14.0,
                  titleFontWeight: FontWeight.w600,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_userNameController.text.trim().isNotEmpty) {
                      identity == _userNameController.text;
                      String? accountSid =
                          await ApiProvider.getEnvironmentKeyByName(
                              keyName: 'twilio_account_sid');
                      String? apiKey =
                          await ApiProvider.getEnvironmentKeyByName(
                              keyName: 'twilio_api_key');
                      String? apiSecret =
                          await ApiProvider.getEnvironmentKeyByName(
                              keyName: 'twilio_api_secret');
                      String? serviceSid =
                          await ApiProvider.getEnvironmentKeyByName(
                              keyName: 'twilio_service_sid');
                      chatBloc!.add(GenerateTokenEvent(credentials: {
                        "accountSid": accountSid,
                        "apiKey": apiKey,
                        "apiSecret": apiSecret,
                        "identity": _userNameController.text,
                        "serviceSid": serviceSid
                      }));
                    } else {
                      ToastUtility.showToastAtCenter("Please enter user name.");
                    }
                  },
                ),
              ],
            ),
          );
        }, listener: (BuildContext context, ChatStates state) {
          if (state is GenerateTokenLoadingState) {
            ProgressBar.show(context);
          }
          if (state is GenerateTokenLoadedState) {
            ProgressBar.dismiss(context);
            initializeConversationClient(accessToken: state.token);
            //  ProgressBar.dismiss(context);
          }
          if (state is GenerateTokenErrorState) {
            ProgressBar.dismiss(context);
            ToastUtility.showToastAtCenter(state.message);
          }

          if (state is InitializeConversationClientLoadingState) {
            ProgressBar.show(context);
          }
          if (state is InitializeConversationClientLoadedState) {
            ProgressBar.dismiss(context);
            SharedPreference.setIdentity(identity: _userNameController.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                    create: (context) =>
                        ChatBloc(chatRepository: ChatRepositoryImpl()),
                    child: ChatScreen(identity: _userNameController.text)),
              ),
            );
          }
          if (state is InitializeConversationClientErrorState) {
            ProgressBar.dismiss(context);
            ToastUtility.showToastAtCenter(state.message);
          }
        }));
  }

  void initializeConversationClient({required String accessToken}) {
    chatBloc!.add(InitializeConversationClientEvent(accessToken: accessToken));
  }
}
