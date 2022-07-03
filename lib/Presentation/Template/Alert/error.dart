import 'package:crypties_app/exports.dart';


void errorPopup(title,content,context) async{
  showAlertDialog<OkCancelResult>(
    context: context,
    title: title,
    message: content,
    // barrierDismissible: barrierDismissible,
    // style: alertStyle,
    // useActionSheetForCupertino: useActionSheetForCupertino,
    // useRootNavigator: useRootNavigator,
    // actionsOverflowDirection: actionsOverflowDirection,
    // fullyCapitalizedForMaterial: fullyCapitalizedForMaterial,
    // onWillPop: onWillPop,
    actions: [
      AlertDialogAction(
        label: 'Ok',
        key: OkCancelResult.cancel,
        // isDefaultAction: defaultType == OkCancelAlertDefaultType.cancel,
      ),
    ],
  );

}
