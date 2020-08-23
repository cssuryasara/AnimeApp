import 'package:flutter/material.dart';
//widgets
import '../widgets/poster.dart';

class AnimeDetail extends StatefulWidget {
  final String s;
  AnimeDetail(this.s);

  @override
  _AnimeDetailState createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  String popularity = "450";
  String rank = "10";
  String numEpisodes = "500";
  String description =
      "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. It tells the story of Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF141d26),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 450,
            collapsedHeight: 100,
            pinned: true,
            floating: true,
            elevation: 0,
            backgroundColor: Color(0xff141d26),
            flexibleSpace: Poster(widget.s),
            centerTitle: true,
            title: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Naruto",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      offset: Offset.fromDirection(5),
                      color: Color(0xffc4c4c4),
                    ),
                  ],
                  color: Color(0xffc4c4c4),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              
            ]),
          )
        ],
      ),
    );
  }
}
