import 'package:crypties_app/exports.dart';

Widget newPostProfileIcon(){
  return  ClipRRect(
      borderRadius: BorderRadius.circular(280.0),
      child: Container(
        height: 48,
        width: 48,
        child: CachedNetworkImage(
          imageUrl: 'https://lh3.googleusercontent.com/AJrJQRSG9Dv6aZbZWWFrYZXtYEA1g5uOno3josLAO0vP-Nr1VWZ6c9JDR-wnMajhtzzh0huDXuUfkTJ8Rry3iGAZUTAlKvofkwcbvuY=w600',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Padding(
                padding: const EdgeInsets.all(48.0),
                child:
                CircularProgressIndicator(value: downloadProgress.progress),
              ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ));
}