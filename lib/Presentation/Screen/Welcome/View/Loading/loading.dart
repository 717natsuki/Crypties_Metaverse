

import 'package:crypties_app/exports.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  @override
  void initState() {
    var providerUser = Provider.of<UserDomain>(context, listen: false);
    var providerPublic = Provider.of<PublicMetrics>(context, listen: false);
    var providerEntity = Provider.of<Entity>(context, listen: false);

    Future(() {
      checkUser(context, providerUser, providerPublic, providerEntity);
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Material(
        type: MaterialType.transparency,
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                progressIndicator(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
