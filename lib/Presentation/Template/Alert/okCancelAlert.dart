import 'package:crypties_app/exports.dart';


 Future<bool> okCancelAlert(title, message, okLabel, cancelLabel, isDestructiveAction, context) async {
  final result = await showAlertDialog<OkCancelResult>(
    context: context,
    title: title,
    message: message,
    // barrierDismissible: barrierDismissible,
    // style: alertStyle,
    // useActionSheetForCupertino: useActionSheetForCupertino,
    // useRootNavigator: useRootNavigator,
    // actionsOverflowDirection: actionsOverflowDirection,
    // fullyCapitalizedForMaterial: fullyCapitalizedForMaterial,
    // onWillPop: onWillPop,
    actions: [
      AlertDialogAction(
        label: cancelLabel ,
        key: OkCancelResult.cancel,
        // isDefaultAction: defaultType == OkCancelAlertDefaultType.cancel,
      ),
      AlertDialogAction(
        label: okLabel ?? MaterialLocalizations.of(context).okButtonLabel,
        key: OkCancelResult.ok,
        // isDefaultAction: defaultType == OkCancelAlertDefaultType.ok,
        isDestructiveAction: isDestructiveAction,
      ),
    ],
  );
  return result == OkCancelResult.ok ? true: false;
}