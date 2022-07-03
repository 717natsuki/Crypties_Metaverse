import 'package:crypties_app/exports.dart';

void showProgressBar(BuildContext context) {
  showDialog(
    useRootNavigator: false, //this property needs to be added
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          alignment: AlignmentDirectional.center,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                    valueColor:
                    new AlwaysStoppedAnimation<Color>(
                        ColorsConst.blue)),
              ],
            ),
          ),
        ),
      );
    },
  );
}