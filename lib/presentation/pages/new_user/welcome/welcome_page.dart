import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/assets.dart';
import 'package:flutter_boilerplate/constants/dimens.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/widgets/app_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.horizontalPaddingLarge),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imageWelcome),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            0,
                            Dimens.welcomeImageTextSpace,
                            0,
                            Dimens.horizontalPadding),
                        child: Text(
                          S.current.welcome_title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Text(
                        S.current.welcome_description,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButtonLarge(
                      text: S.current.start,
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Text(
                        S.current.already_account,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
