import 'package:crypties_app/exports.dart';


Widget shimmerPost() {

  return SingleChildScrollView(
    child: Column(
      children: [
        postShimmer,
        postShimmer,
        postShimmer,
        postShimmer,
        postShimmer,
      ],
    ),
  );
}

var postShimmer = SizedBox(
  width: double.infinity,
  height: 140.0,
  child: Shimmer.fromColors(
    baseColor: ColorsConst.gray,
    highlightColor: ColorsConst.whiteGrey,
    child: Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(280.0),
                      child: Container(
                          height: 48,
                          width: 48,
                          color: ColorsConst.gray,
                          child: Container())),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFF1E1E31),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 300,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF1E1E31),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 300,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF1E1E31),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 300,
                        height: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF1E1E31),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 1)
      ],
    ),
  ),
);


Widget nftShimmer(){
  return Shimmer.fromColors(
    baseColor: ColorsConst.gray,
    highlightColor: ColorsConst.whiteGrey,
    child:  StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: 29,
      itemBuilder: (BuildContext context, int index) => Container(
        color: Colors.grey,
        child: Container(),),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(index == 0 ? 2 : index % 12 == 0 ? 2 :1, index == 0 ? 2 :  index % 7 ==0 ? 2 : index % 12 == 0 ? 2 :1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    )
  );
}


  Widget postImageShimmer(){
    return Shimmer.fromColors(
        baseColor: ColorsConst.gray,
        highlightColor: ColorsConst.whiteGrey,
        child:  Container(
          width:  double.maxFinite,
          height: 250,
        )
    );
  }