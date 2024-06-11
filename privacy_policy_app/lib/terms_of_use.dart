import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:privacy_policy_app/policy_dialog.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({
    super.key,
  });

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {
  bool isSwitchedTerms = false;
  bool isSwitchedPrivacy = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.amber,
        title: Text('Markdown Files Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By creating an account, you are agreeing to our\n",
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: "Terms & Conditions ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModal(
                              context: context,
                              configuration:
                                  const FadeScaleTransitionConfiguration(),
                              builder: (context) {
                                return PolicyDialog(
                                  mdFileName: 'terms_and_conditions.md',
                                );
                              },
                            );
                          },
                      ),
                      const TextSpan(text: "and "),
                      TextSpan(
                        text: "Privacy Policy! ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PolicyDialog(
                                  mdFileName: 'privacy_policy.md',
                                );
                              },
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isSwitchedTerms,
                  onChanged: (value) {
                    setState(() {
                      isSwitchedTerms = !isSwitchedTerms;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: "Terms & Conditions ",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final accepted = await showModal(
                          context: context,
                          configuration:
                              const FadeScaleTransitionConfiguration(),
                          builder: (context) {
                            return PolicyDialog(
                              mdFileName: 'terms_and_conditions.md',
                            );
                          },
                        );
                        debugPrint(accepted.toString());
                        if(accepted == true) {
                          setState(() {
                            isSwitchedTerms = true;
                          });
                        }
                      },
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isSwitchedPrivacy,
                  onChanged: (value) {
                    setState(() {
                      isSwitchedPrivacy = !isSwitchedPrivacy;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: "Privacy Policy",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showModal(
                          context: context,
                          configuration:
                              const FadeScaleTransitionConfiguration(),
                          builder: (context) {
                            return PolicyDialog(
                              mdFileName: 'privacy_policy.md',
                            );
                          },
                        );
                      },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
