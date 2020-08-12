import 'package:flutter/material.dart';

//packages
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';

//widgets
import '../widgets/sidenavbar.dart';
import '../widgets/carousel.dart';
import '../widgets/filter.dart';

//
import '../utils/constant.dart';
import '../utils/routetransition.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFilterON = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141D26),
      appBar: AppBar(
        title: Text(
          'Something',
          style: GoogleFonts.montserrat(),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      drawer: sidenavbar(),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Top Anime's",
                        style: TextStyles().primaryTextStyle,
                      ),
                      carousel(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilterWidget(),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(RouteTransitions().createRoute());
                          },
                          child: Text(
                            'Quiz',
                            style: TextStyle(fontSize: 20),
                          ),
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 8.0 / 12.0,
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
              children: List.generate(
                4,
                (int index) => Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          placeholder: (context, url) => Center(
                            child: Container(
                              color: Colors.white,
                              child: FlareActor(
                                'assests/loading (1).flr',
                                animation: 'loading',
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          color: Colors.black.withOpacity(0.4),
                          colorBlendMode: BlendMode.darken,
                          imageUrl:
                              'https://images.unsplash.com/photo-1596929323656-0bcee1dafe8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Naruto',
                          style: TextStyles().secondaryTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
