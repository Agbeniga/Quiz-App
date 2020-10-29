import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List summaries = [];

  loadSummaries(String allsummariesJson) async {
    var jsonResponse = jsonDecode(allsummariesJson);
    print(jsonResponse.length);
    summaries = jsonResponse["allSummaries"];
    summaries.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("asset/summary.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            loadSummaries(snapshot.data.toString());

            return Swiper(
              layout: SwiperLayout.CUSTOM,
              customLayoutOption:
                  new CustomLayoutOption(startIndex: -1, stateCount: 3)
                      .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate(
                [
                  Offset(-470.0, -40),
                  Offset(0.0, 0.0),
                  Offset(470.0, -40),
                ],
              ),
              itemWidth: 400.0,
              itemHeight: 400.0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // print(summaries.length);
                  },
                  child: new Container(
                    padding: EdgeInsets.all(15.0),
                    margin: EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.blueAccent, width: 3.0),
                    ),
                    child: new Center(
                      child: Text(
                        // 'CALEB',
                        summaries[index],
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                );
              },
              itemCount:
                  // 2,
                  summaries.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
