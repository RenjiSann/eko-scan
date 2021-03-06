import 'package:flutter/material.dart';
import 'themes.dart';

void main() => runApp(MaterialApp(home: Memo()));

class Memo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memo de recyclage',
            style: Theme.of(context).textTheme.headline2),
        centerTitle: true,
        backgroundColor: EkoScanThemes.ekoGreen,
        //elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.autorenew_rounded,
                        color: EkoScanThemes.ekoGreen,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('À recycler :',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- papiers : journaux, magazines...',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- emballages en cartonette (petit carton)',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      '- bouteilles et flacons en plastique : de produits d\'entretien, de salle de bain, de boisson, de sauce',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      '- boîtes métalliques : conserves, aérosols, de boisson, aluminium...',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- briques : de boissons, soupe.',
                      style: Theme.of(context).textTheme.bodyText1),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.rotate_right_rounded,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('À jeter :',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- films et sacs plastiques',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- boîtes de viennoiseries, gâteaux',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- barquettes en polystyrène, de beurre, bacs de glace',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- barquettes de salade, plats préparés',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- barquettes contenant des restes',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- épluchures de légumes, fruits (à composter sinon)',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- pots de produits laitiers : yaourt, crème...',
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('- articles d\'hygiène',
                      style: Theme.of(context).textTheme.bodyText1),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.brightness_1_outlined,
                        color: Colors.brown[500],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('Le verre',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Le jeter dans les points de collecte.',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          letterSpacing: 1.0)),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.yellow[800],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('Les ampoules',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      'Les jeter dans les points de collecte dans les supermarchés ou magasin d\'électroménager.',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          letterSpacing: 1.0)),
                  Divider(
                    height: 30.0,
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.battery_charging_full_rounded,
                        color: Colors.blue[800],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text('Les piles',
                            style: Theme.of(context).textTheme.headline1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      'Les jeter dans les points de collecte dans les supermarchés ou magasins d\'électroménager.',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          letterSpacing: 1.0)),
                ])),
      ),
    );
  }
}
