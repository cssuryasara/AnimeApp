import 'package:animeapp/provider/scrollEvent.dart';
import 'package:animeapp/screens/animeDetails.dart';
import 'package:animeapp/utils/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HpCards extends StatefulWidget {
  HpCards({Key key}) : super(key: key);

  @override
  _HpCardsState createState() => _HpCardsState();
}

class _HpCardsState extends State<HpCards> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var scrolllistener = Provider.of<Scrollevent>(context);
        bool isscrolling = Provider.of<Scrollevent>(context).getscrooling;
        return NotificationListener<ScrollNotification>(
          onNotification: (n) {
            if (n is ScrollStartNotification) {
              scrolllistener.setscrolling = true;
            } else if (n is ScrollEndNotification) {
              scrolllistener.setscrolling = false;
            }
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 14, 10, 20),
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween(
                    begin: isscrolling ? 0.0 : 0.1,
                    end: isscrolling ? 0.1 : 0.0),
                builder: (BuildContext context, dynamic value, Widget child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.01)
                      ..rotateY(value),
                    child: InkWell(
                      onTap: () {
                        print('tap');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => AnimeDetail(
                                'https://images.unsplash.com/photo-1596929323656-0bcee1dafe8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                          ),
                        );
                      },
                      child: Container(
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
                                'Naruto ',
                                style: TextStyles().secondaryTextStyle,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
