import '../transformation_data.dart';

/// Gravity towards options: object, foreground, face, none
enum IcGravitytowards {
  object('object'),

  foreground('foreground'),

  face('face'),

  none('none');

  final String value;

  const IcGravitytowards(this.value);
}

/// Preferred direction options: north_west, north, north_east, west, center, east, south_west, south, south_east
enum IcPreferreddirection {
  northWest('north_west'),

  north('north'),

  northEast('north_east'),

  west('west'),

  center('center'),

  east('east'),

  southWest('south_west'),

  south('south'),

  southEast('south_east');

  final String value;

  const IcPreferreddirection(this.value);
}

/// Object Type (if Gravity is object) options: airplane, apple, backpack, banana, baseball_bat, baseball_glove, bear, bed, bench, bicycle, bird, boat, book, bottle, bowl, broccoli, bus, cake, car, carrot, cat, cell_phone, chair, clock, couch, cow, cup, dining_table, dog, donut, elephant, fire_hydrant, fork, frisbee, giraffe, hair_drier, handbag, horse, hot_dog, keyboard, kite, knife, laptop, microwave, motorcycle, mouse, orange, oven, parking_meter, person, pizza, potted_plant, refrigerator, remote, sandwich, scissors, sheep, sink, skateboard, skis, snowboard, spoon, sports_ball, stop_sign, suitcase, surfboard, teddy_bear, tennis_racket, tie, toaster, toilet, toothbrush, traffic_light, train, truck, tv, umbrella, vase, wine_glass, zebra
enum IcObjectType {
  airplane('airplane'),

  apple('apple'),

  backpack('backpack'),

  banana('banana'),

  baseballBat('baseball_bat'),

  baseballGlove('baseball_glove'),

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

  cellPhone('cell_phone'),

  chair('chair'),

  clock('clock'),

  couch('couch'),

  cow('cow'),

  cup('cup'),

  dinpinpgTable('dining_table'),

  dog('dog'),

  donut('donut'),

  elephant('elephant'),

  fireHydrant('fire_hydrant'),

  fork('fork'),

  frisbee('frisbee'),

  giraffe('giraffe'),

  hairDrier('hair_drier'),

  handbag('handbag'),

  horse('horse'),

  hotDog('hot_dog'),

  keyboard('keyboard'),

  kite('kite'),

  knife('knife'),

  laptop('laptop'),

  microwave('microwave'),

  motorcycle('motorcycle'),

  mouse('mouse'),

  orange('orange'),

  oven('oven'),

  parkinpgMeter('parking_meter'),

  person('person'),

  pizza('pizza'),

  pottedPlant('potted_plant'),

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

  sportsBall('sports_ball'),

  stopSign('stop_sign'),

  suitcase('suitcase'),

  surfboard('surfboard'),

  teddyBear('teddy_bear'),

  tennisRacket('tennis_racket'),

  tie('tie'),

  toaster('toaster'),

  toilet('toilet'),

  toothbrush('toothbrush'),

  trafficLight('traffic_light'),

  trainp('train'),

  truck('truck'),

  tv('tv'),

  umbrella('umbrella'),

  vase('vase'),

  winpeGlass('wine_glass'),

  zebra('zebra');

  final String value;

  const IcObjectType(this.value);
}

class IcCrop {
  /// Method for Intelligent Crop Plugin
  ///
  ///
  /// - [requiredWidth] : Required Width (Default: 0)
  ///
  ///
  ///
  /// - [requiredHeight] : Required Height (Default: 0)
  ///
  ///
  ///
  /// - [paddingPercentage] : Padding Percentage (Default: 0)
  ///
  ///
  ///
  /// - [maintainOriginalAspect] : Maintain Original Aspect (Default: false)
  ///
  ///
  ///
  /// - [aspectRatio] : Aspect Ratio (Default: "")
  ///
  ///
  ///
  /// - [gravityTowards] : IcGravitytowards (Default: none)
  ///
  ///
  ///
  /// - [preferredDirection] : IcPreferreddirection (Default: center)
  ///
  ///
  ///
  /// - [objectType] : IcObjectType (Default: person)
  ///
  ///
  /// Returns [TransformationData].
  TransformationData crop(
    int? requiredWidth,
    int? requiredHeight,
    int? paddingPercentage,
    bool? maintainOriginalAspect,
    String? aspectRatio,
    IcGravitytowards? gravityTowards,
    IcPreferreddirection? preferredDirection,
    IcObjectType? objectType,
  ) {
    // Determine if there are values to add to the dictionary

    var values = <String, String>{};

    if (requiredWidth != null) {
      values['w'] = requiredWidth.toString();
    }

    if (requiredHeight != null) {
      values['h'] = requiredHeight.toString();
    }

    if (paddingPercentage != null) {
      values['p'] = paddingPercentage.toString();
    }

    if (maintainOriginalAspect != null) {
      values['ma'] = maintainOriginalAspect.toString();
    }

    if (aspectRatio != null && aspectRatio.isNotEmpty) {
      values['ar'] = aspectRatio;
    }

    if (gravityTowards != null) {
      values['g'] = gravityTowards.value;
    }

    if (preferredDirection != null) {
      values['d'] = preferredDirection.value;
    }

    if (objectType != null) {
      values['obj'] = objectType.value;
    }

    return TransformationData(plugin: 'ic', name: 'crop', values: values);
  }
}
