import 'package:flutter/material.dart';
import 'package:perfect_body/WaterTrack/homepage.dart';
import 'package:perfect_body/WaterTrack/widgets/buttons/custom_wide_flat_button.dart';
import 'package:perfect_body/WaterTrack/widgets/popups/custom_amount_onboarding_popup.dart';
import 'package:perfect_body/services/firestore/firestore_user_service.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int selectedAmount = 2500;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100, width: double.infinity),
            appIcon(),
            smallTextSpace,
            subtitle1(textTheme),
            smallTextSpace,
            subsubtitle1(textTheme),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 42, vertical: 16),
                    onPressed: () async {
                      int amount = await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return CustomAmountOnboardingPopup();
                        },
                      );
                      setState(() => selectedAmount = amount);
                    },
                    child: Text(
                      '$selectedAmount ml',
                      style: textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ),
            CustomWideFlatButton(
              backgroundColor: Colors.blue.shade300,
              foregroundColor: Colors.blue.shade900,
              isRoundedAtBottom: false,
              text: 'Start',
              onPressed: () async {
                await FirestoreUserService.updateTotalWater(selectedAmount);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget get smallTextSpace => SizedBox(height: 8);

  Widget appIcon() {
    return Image.asset(
      'assets/sign_in_icon.png',
      width: 125,
      height: 125,
    );
  }

  Text subtitle1(TextTheme textTheme) {
    return Text(
      'We help you drink water',
      style: textTheme.subtitle1.copyWith(
        fontSize: 24,
      ),
    );
  }

  Text subsubtitle1(TextTheme textTheme) {
    return Text(
      'Set your daily water intake goal',
      style: textTheme.subtitle1.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
