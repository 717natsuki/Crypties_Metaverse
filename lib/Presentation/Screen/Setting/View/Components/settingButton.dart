import 'package:crypties_app/exports.dart';

Widget settingButton(title,icon){
  return  Padding(
    padding: const EdgeInsets.all(11.0),
    child: Row(
      children: <Widget>[
        Icon(icon,size: 18,),
        SizedBox(width: 8,),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Expanded(child: Container()),
        trailingIcon(),
      ],
    ),
  );
}
Widget settingButtonMetamask(title){
  return  Padding(
    padding: const EdgeInsets.only(right:11.0,left: 11,top: 4,bottom: 4),
    child: Row(
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          child: Image.asset('Assets/Images/metamask.png',
              fit: BoxFit.fitHeight,
              color: Color.fromRGBO(255, 255, 255, 1),
              colorBlendMode: BlendMode.modulate),
          // height: MediaQuery.of(context).size.height,
        ),
        SizedBox(width: 8,),

        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),

        Expanded(child: Container()),
        trailingIcon(),
      ],
    ),
  );
}
Widget settingButtonGradient(title){
  return  Padding(
    padding: const EdgeInsets.all(11.0),
    child: Row(
      children: <Widget>[
        ShaderMask(
          shaderCallback: (bounds) => GradientConst.themeGradientLine.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: Text(

            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
              color: Colors.white,

              // foreground: Paint()..shader = GradientConst.themeGradient,

            ),
          ),
        ),
        Expanded(child: Container()),
        trailingIcon(),
      ],
    ),
  );
}
Widget settingRedButton(title){
  return  Padding(
    padding: const EdgeInsets.all(11.0),
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.red),
        ),
        Expanded(child: Container()),
      ],
    ),
  );
}


Widget settingInputButton(title, field){
  return  Padding(
    padding: const EdgeInsets.all(11.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        Expanded(
          child: Text(field,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsConst.link)),
        ),

        // Expanded(child: Container()),
        trailingIcon(),

      ],
    ),
  );
}
Widget settingEditProfileImage(title, image, providerUser){
  return  Padding(
    padding: const EdgeInsets.all(11.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100,
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        providerUser.profileNFT != null &&  providerUser.profileNFT.length >4?
        profileNFT(providerUser.profileNFT, 100):

        profileNFT(providerUser.profileImage, 100),





        Expanded(child: Container(),),
        // Expanded(child: Container()),

      ],
    ),
  );
}
