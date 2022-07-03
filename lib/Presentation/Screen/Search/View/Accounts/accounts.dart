import 'package:crypties_app/exports.dart';


class Accounts extends StatefulWidget {
  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              TextFormField(
                decoration: searchTextBox('@Natsuki'),
              ),
              SizedBox(height: 16,),

              Text(
                'New',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 16,),

              Text(
                'Popular',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
    );
  }
}
