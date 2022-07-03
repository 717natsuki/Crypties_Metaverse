import 'package:crypties_app/exports.dart';

import '../ImageView.dart';

class PostImage extends StatelessWidget {
  final image1;
  PostImage(this.image1);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        HapticFeedback.selectionClick();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ImageViewPage(
                url: image1,
              )),
        );

      },
      child: Container(
        // color: Colors.blueAccent,
        width: MediaQuery.of(context).size.width,
        height: 250,
        child:  CachedNetworkImage(
          imageUrl: image1,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              postImageShimmer(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
