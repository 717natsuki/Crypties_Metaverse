import 'package:crypties_app/exports.dart';


class ImageViewPage extends StatelessWidget {
  final url;
  ImageViewPage({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: settingAppbar(context, ''),
      body: Container(
          child: PhotoView(
            errorBuilder:(context, url, error) => Container() ,
            imageProvider: NetworkImage(url),
          )
      ),
    );
  }}