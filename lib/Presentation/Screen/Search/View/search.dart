
import 'package:crypties_app/Presentation/Screen/Search/View/NFTs/popularNFTs.dart';
import 'package:crypties_app/Presentation/Screen/Timeline/View/timeline.dart';
import 'package:crypties_app/exports.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: tabsAppbar('NFTs',  "Recent",  'Hot'),
        body: TabBarView(
          children: [
            NFTs(),
            PopularNFTs(),
            // NFTs(),
          ],
        ),
      ),
    );
  }
}
