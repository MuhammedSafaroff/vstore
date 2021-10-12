import 'package:flutter/material.dart';
import '../../sing_in_up/sign_in.dart';
import '../../../../core/constants/statics.dart';

class ProfileNull extends StatelessWidget {
  const ProfileNull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [backgroundColor, backgroundColor],
              ).createShader(bounds);
            },
            child: Image.asset('assets/images/no_account.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Hesabınıza baxmaq üçün xahiş olunur daxil olun.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                style: ElevatedButton.styleFrom(
                  primary: backgroundColor,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18),
                )),
          ),
        )
      ],
    );
  }
}
