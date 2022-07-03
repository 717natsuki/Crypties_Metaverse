import 'package:crypties_app/Presentation/Screen/Login/Controller/loginUserController.dart';
import 'package:crypties_app/exports.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        ShaderMask(
                          shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                          ),
                          child: Text(
                            StringButtonConst.login,
                            style: ThemeTextConst.introBigText,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 8),
                      child: Text(
                        StringButtonConst.email,
                        style: ThemeTextConst.textFormFieldExplain,
                      ),
                    ),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value){
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: textBoxStyle('test@gmail.com'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 8),
                      child: Text(
                        StringButtonConst.password,
                        style: ThemeTextConst.textFormFieldExplain,
                      ),
                    ),

                    TextFormField(
                      obscureText: true,
                      onChanged: (value){
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: textBoxStyle('Password'),
                    ),
                    // Expanded(child: Container()),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0, left: 60),
                      child: GestureDetector(
                          onTap: () async {
                            HapticFeedback.lightImpact();
                            loginUserController(email, password, context,);
                          },
                          child: buttonStyle(StringButtonConst.login)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              HapticFeedback.lightImpact();
                            },
                            child:
                            Text('Cancel', style: ThemeTextConst.subText)),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
