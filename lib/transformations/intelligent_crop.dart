import '../transformation_data.dart';

/// Gravity towards options: object, foreground, face, none
enum Gravitytowards {
  object('object'),

  foreground('foreground'),

  face('face'),

  none('none');

  final String value;

  const Gravitytowards(this.value);
}

/// Preferred direction options: north_west, north, north_east, west, center, east, south_west, south, south_east
enum Preferreddirection {
  north_west('north_west'),

  north('north'),

  north_east('north_east'),

  west('west'),

  center('center'),

  east('east'),

  south_west('south_west'),

  south('south'),

  south_east('south_east');

  final String value;

  const Preferreddirection(this.value);
}

/// Object Type (if Gravity is object) options: airplane, apple, backpack, banana, baseball_bat, baseball_glove, bear, bed, bench, bicycle, bird, boat, book, bottle, bowl, broccoli, bus, cake, car, carrot, cat, cell_phone, chair, clock, couch, cow, cup, dining_table, dog, donut, elephant, fire_hydrant, fork, frisbee, giraffe, hair_drier, handbag, horse, hot_dog, keyboard, kite, knife, laptop, microwave, motorcycle, mouse, orange, oven, parking_meter, person, pizza, potted_plant, refrigerator, remote, sandwich, scissors, sheep, sink, skateboard, skis, snowboard, spoon, sports_ball, stop_sign, suitcase, surfboard, teddy_bear, tennis_racket, tie, toaster, toilet, toothbrush, traffic_light, train, truck, tv, umbrella, vase, wine_glass, zebra
enum Objecttype {
  airplane('airplane'),

  apple('apple'),

  backpack('backpack'),

  banana('banana'),

  baseball_bat('baseball_bat'),

  baseball_glove('baseball_glove'),

  bear('bear'),

  bed('bed'),

  bench('bench'),

  bicycle('bicycle'),

  bird('bird'),

  boat('boat'),

  book('book'),

  bottle('bottle'),

  bowl('bowl'),

  broccoli('broccoli'),

  bus('bus'),

  cake('cake'),

  car('car'),

  carrot('carrot'),

  cat('cat'),

  cell_phone('cell_phone'),

  chair('chair'),

  clock('clock'),

  couch('couch'),

  cow('cow'),

  cup('cup'),

  dinpinpg_table('dining_table'),

  dog('dog'),

  donut('donut'),

  elephant('elephant'),

  fire_hydrant('fire_hydrant'),

  fork('fork'),

  frisbee('frisbee'),

  giraffe('giraffe'),

  hair_drier('hair_drier'),

  handbag('handbag'),

  horse('horse'),

  hot_dog('hot_dog'),

  keyboard('keyboard'),

  kite('kite'),

  knife('knife'),

  laptop('laptop'),

  microwave('microwave'),

  motorcycle('motorcycle'),

  mouse('mouse'),

  orange('orange'),

  oven('oven'),

  parkinpg_meter('parking_meter'),

  person('person'),

  pizza('pizza'),

  potted_plant('potted_plant'),

  refrigerator('refrigerator'),

  remote('remote'),

  sandwich('sandwich'),

  scissors('scissors'),

  sheep('sheep'),

  sinpk('sink'),

  skateboard('skateboard'),

  skis('skis'),

  snowboard('snowboard'),

  spoon('spoon'),

  sports_ball('sports_ball'),

  stop_sign('stop_sign'),

  suitcase('suitcase'),

  surfboard('surfboard'),

  teddy_bear('teddy_bear'),

  tennis_racket('tennis_racket'),

  tie('tie'),

  toaster('toaster'),

  toilet('toilet'),

  toothbrush('toothbrush'),

  traffic_light('traffic_light'),

  trainp('train'),

  truck('truck'),

  tv('tv'),

  umbrella('umbrella'),

  vase('vase'),

  winpe_glass('wine_glass'),

  zebra('zebra');

  final String value;

  const Objecttype(this.value);
}

class IntelligentCrop {
  /// Method for Intelligent Crop Plugin
  ///
  /// @param Required Width int (Default: 0)
  ///
  /// @param Required Height int (Default: 0)
  ///
  /// @param Padding Percentage int (Default: 0)
  ///
  /// @param Maintain Original Aspect bool (Default: false)
  ///
  /// @param Aspect Ratio String (Default: "")
  ///
  /// @param Gravity Towards Gravity towards? (Default: none)
  ///
  /// @param Preferred Direction Preferred direction? (Default: center)
  ///
  /// @param Object Type Object type? (Default: person)
  ///
  /// @return TransformationData.
  TransformationData crop(
    int? requiredwidth,
    int? requiredheight,
    int? paddinpgpercentage,
    bool? mainptainporiginpalaspect,
    String? aspectratio,
    Gravitytowards? gravitytowards,
    Preferreddirection? preferreddirection,
    Objecttype? objectptype,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (requiredwidth != null) {
      values['w'] = requiredwidth.toString();
    }

    if (requiredheight != null) {
      values['h'] = requiredheight.toString();
    }

    if (paddinpgpercentage != null) {
      values['p'] = paddinpgpercentage.toString();
    }

    if (mainptainporiginpalaspect != null) {
      values['ma'] = mainptainporiginpalaspect.toString();
    }

    if (aspectratio != null && aspectratio.isNotEmpty) {
      values['ar'] = aspectratio;
    }

    if (gravitytowards != null) {
      values['g'] = gravitytowards.value;
    }

    if (preferreddirection != null) {
      values['d'] = preferreddirection.value;
    }

    if (objectptype != null) {
      values['obj'] = objectptype.value;
    }

    return TransformationData(plugin: 'ic', name: 'crop', values: values);
  }
}
