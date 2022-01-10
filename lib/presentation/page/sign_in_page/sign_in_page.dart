import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:memo_sample/generated/l10n.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: SignInScreen(
        subtitleBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              action == AuthAction.signIn
                  ? S.of(context).signInDescription
                  : S.of(context).registerDescription,
            ),
          );
        },
        sideBuilder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).appName,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.edit,
                    size: 100,
                    color: Colors.brown,
                  ),
                  Icon(
                    Icons.my_library_books,
                    size: 100,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          );
        },
        providerConfigs: const [
          GoogleProviderConfiguration(
            clientId: '1:390695659143:android:62c6ab0d9fa6453e3cfa22',
          ),
          AppleProviderConfiguration(),
          EmailProviderConfiguration(),
        ],
      ),
    );
  }
}
