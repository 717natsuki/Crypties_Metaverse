import 'package:crypties_app/Presentation/Screen/Signup/Controller/createUserController.dart';
import 'package:crypties_app/exports.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String nickname = '';
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
                            StringButtonConst.signup,
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
                        StringButtonConst.nickname,
                        style: ThemeTextConst.textFormFieldExplain,
                      ),
                    ),
                    TextFormField(
                      maxLength: 20,
                      onChanged: (value){
                        setState(() {
                          nickname = value;
                        });
                      },
                      decoration: textBoxStyle('Jack'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                      decoration: textBoxStyle('example@gmail.com'),
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
                    terms(),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0, left: 60),
                      child: GestureDetector(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            createUserView(nickname, email, password, context,);
                          },
                          child: buttonStyle(StringButtonConst.signup)),
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
