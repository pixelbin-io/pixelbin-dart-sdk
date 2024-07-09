import 'package:pixelbin/transformation_data.dart';
import 'package:pixelbin/transformations/super_resolution.dart';
import 'package:pixelbin/transformations/text_detectionand_recognition.dart';
import 'package:pixelbin/transformations/video_watermark_removal.dart';
import 'package:pixelbin/transformations/view_detection.dart';
import 'package:pixelbin/transformations/watermark_detection.dart';
import 'package:pixelbin/transformations/watermark_removal.dart';
import 'transformations/a_w_s_rekognition_plugin.dart';
import 'transformations/artifact.dart';
import 'transformations/background_generator.dart';
import 'transformations/basic.dart';
import 'transformations/check_object_size.dart';
import 'transformations/check_product_visibility.dart';
import 'transformations/detect_background_type.dart';
import 'transformations/erase_b_g.dart';
import 'transformations/google_vision_plugin.dart';
import 'transformations/image_centering.dart';
import 'transformations/intelligent_crop.dart';
import 'transformations/n_s_f_w_detection.dart';
import 'transformations/number_plate_detection.dart';
import 'transformations/object_counter.dart';
import 'transformations/object_detection.dart';
import 'transformations/pdf_watermark_removal.dart';
import 'transformations/product_tagging.dart';
import 'transformations/remove_b_g.dart';
import 'transformations/soft_shadow_generator.dart';
import 'transformations/variation_generator.dart';

class Transformation {
  // DetectBackgroundType

  /// Classifies the background of a product as plain, clean or busy
  ///
  /// Returns [TransformationData].
  static TransformationData detectbackgroundtype() {
    // Call the generated class method
    return DetectBackgroundType().detect();
  }

  // Artifact

  /// Artifact Removal Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData artifact() {
    // Call the generated class method
    return Artifact().remove();
  }

  // AWSRekognitionPlugin

  /// Detect objects and text in images
  ///
  /// - [maximumlabels] : Maximum Labels (Default: 5)
  ///
  /// - [minpimumconfidence] : Minimum Confidence (Default: 55)
  ///
  /// Returns [TransformationData].
  static TransformationData detectlabels(
      {int? maximumlabels = 5, int? minpimumconfidence = 55}) {
    // Call the generated class method
    return Detectlabels().detectLabels(maximumlabels, minpimumconfidence);
  }

  /// Detect objects and text in images
  ///
  /// - [minpimumconfidence] : Minimum Confidence (Default: 55)
  ///
  /// Returns [TransformationData].
  static TransformationData moderation({int? minpimumconfidence = 55}) {
    // Call the generated class method
    return Moderation().moderation(minpimumconfidence);
  }

  // BackgroundGenerator

  /// AI Background Generator
  ///
  /// - [backgroundprompt] : Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  ///
  /// - [focus] : focus (Default: Product)
  ///
  /// - [negativeprompt] : Negative prompt (Default: )
  ///
  /// - [seed] : seed (Default: 123)
  ///
  /// Returns [TransformationData].
  static TransformationData backgroundgenerator(
      {String? backgroundprompt =
          "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
      Focus? focus = Focus.product,
      String? negativeprompt = "",
      int? seed = 123}) {
    // Call the generated class method
    return BackgroundGenerator()
        .bg(backgroundprompt, focus, negativeprompt, seed);
  }

  // VariationGenerator

  /// AI Variation Generator
  ///
  /// - [generatevariationprompt] : Generate variation prompt (Default: )
  ///
  /// - [noofvariations] : No. of Variations (Default: 1)
  ///
  /// - [seed] : Seed (Default: 0)
  ///
  /// - [autoscale] : Autoscale (Default: true)
  ///
  /// Returns [TransformationData].
  static TransformationData variationgenerator(
      {String? generatevariationprompt = "",
      int? noofvariations = 1,
      int? seed = 0,
      bool? autoscale = true}) {
    // Call the generated class method
    return VariationGenerator()
        .generate(generatevariationprompt, noofvariations, seed, autoscale);
  }

  // EraseBG

  /// EraseBG Background Removal Module
  ///
  /// - [industryptype] : Industry Type (Default: general)
  ///
  /// - [addshadow] : Add Shadow (Default: false)
  ///
  /// - [refinpe] : Refine (Default: true)
  ///
  /// Returns [TransformationData].
  static TransformationData erasebg(
      {Industrytype? industryptype = Industrytype.general,
      bool? addshadow = false,
      bool? refinpe = true}) {
    // Call the generated class method
    return EraseBG().bg(industryptype, addshadow, refinpe);
  }

  // GoogleVisionPlugin

  /// Detect content and text in images
  ///
  /// - [maximumlabels] : Maximum Labels (Default: 5)
  ///
  /// Returns [TransformationData].
  static TransformationData googlevisionplugin({int? maximumlabels = 5}) {
    // Call the generated class method
    return GoogleVisionPlugin().detectLabels(maximumlabels);
  }

  // ImageCentering

  /// Image Centering Module
  ///
  /// - [distancepercentage] : Distance percentage (Default: 10)
  ///
  /// Returns [TransformationData].
  static TransformationData imagecentering({int? distancepercentage = 10}) {
    // Call the generated class method
    return ImageCentering().detect(distancepercentage);
  }

  // IntelligentCrop

  /// Intelligent Crop Plugin
  ///
  /// - [requiredwidth] : Required Width (Default: 0)
  ///
  /// - [requiredheight] : Required Height (Default: 0)
  ///
  /// - [paddinpgpercentage] : Padding Percentage (Default: 0)
  ///
  /// - [mainptainporiginpalaspect] : Maintain Original Aspect (Default: false)
  ///
  /// - [aspectratio] : Aspect Ratio (Default: "")
  ///
  /// - [gravitytowards] : Gravity Towards (Default: none)
  ///
  /// - [preferreddirection] : Preferred Direction (Default: center)
  ///
  /// - [objectptype] : Object Type (Default: person)
  ///
  /// Returns [TransformationData].
  static TransformationData intelligentcrop(
      {int? requiredwidth = 0,
      int? requiredheight = 0,
      int? paddinpgpercentage = 0,
      bool? mainptainporiginpalaspect = false,
      String? aspectratio = "",
      Gravitytowards? gravitytowards = Gravitytowards.none,
      Preferreddirection? preferreddirection = Preferreddirection.center,
      Objecttype? objectptype = Objecttype.person}) {
    // Call the generated class method
    return IntelligentCrop().crop(
        requiredwidth,
        requiredheight,
        paddinpgpercentage,
        mainptainporiginpalaspect,
        aspectratio,
        gravitytowards,
        preferreddirection,
        objectptype);
  }

  // ObjectCounter

  /// Classifies whether objects in the image are single or multiple
  ///
  /// Returns [TransformationData].
  static TransformationData objectcounter() {
    // Call the generated class method
    return ObjectCounter().detect();
  }

  // NSFWDetection

  /// Detect NSFW content in images
  ///
  /// - [minpimumconfidence] : Minimum Confidence (Default: 0.5)
  ///
  /// Returns [TransformationData].
  static TransformationData nsfwdetection({double? minpimumconfidence = 0.5}) {
    // Call the generated class method
    return NSFWDetection().detect(minpimumconfidence);
  }

  // NumberPlateDetection

  /// Number Plate Detection Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData numberplatedetection() {
    // Call the generated class method
    return NumberPlateDetection().detect();
  }

  // ObjectDetection

  /// Detect bounding boxes of objects in the image
  ///
  /// Returns [TransformationData].
  static TransformationData objectdetection() {
    // Call the generated class method
    return ObjectDetection().detect();
  }

  // CheckObjectSize

  /// Calculates the percentage of the main object area relative to image dimensions.
  ///
  /// - [objectthresholdpercent] : Object Threshold Percent (Default: 50)
  ///
  /// Returns [TransformationData].
  static TransformationData checkobjectsize(
      {int? objectthresholdpercent = 50}) {
    // Call the generated class method
    return CheckObjectSize().detect(objectthresholdpercent);
  }

  // TextDetectionandRecognition

  /// OCR Module
  ///
  /// - [detectonly] : Detect Only (Default: false)
  ///
  /// Returns [TransformationData].
  static TransformationData textdetectionandrecognition(
      {bool? detectonly = false}) {
    // Call the generated class method
    return TextDetectionandRecognition().extract(detectonly);
  }

  // PdfWatermarkRemoval

  /// PDF Watermark Removal Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData pdfwatermarkremoval() {
    // Call the generated class method
    return PdfWatermarkRemoval().remove();
  }

  // ProductTagging

  /// AI Product Tagging
  ///
  /// Returns [TransformationData].
  static TransformationData producttagging() {
    // Call the generated class method
    return ProductTagging().tag();
  }

  // CheckProductVisibility

  /// Classifies whether the product in the image is completely visible or not
  ///
  /// Returns [TransformationData].
  static TransformationData checkproductvisibility() {
    // Call the generated class method
    return CheckProductVisibility().detect();
  }

  // RemoveBG

  /// Remove background from any image
  ///
  /// Returns [TransformationData].
  static TransformationData removebg() {
    // Call the generated class method
    return RemoveBG().bg();
  }

  // Basic

  /// Basic Transformations
  ///
  /// - [height] : height (Default: 0)
  ///
  /// - [width] : width (Default: 0)
  ///
  /// - [fit] : fit (Default: cover)
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// - [position] : position (Default: center)
  ///
  /// - [algorithm] : algorithm (Default: lanczos3)
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  /// Returns [TransformationData].
  static TransformationData resize(
      {int? height = 0,
      int? width = 0,
      Fit? fit = Fit.cover,
      String? background = "000000",
      Position? position = Position.center,
      Algorithm? algorithm = Algorithm.lanczos3,
      double? dpr = 1}) {
    // Call the generated class method
    return Resize()
        .resize(height, width, fit, background, position, algorithm, dpr);
  }

  /// Basic Transformations
  ///
  /// - [quality] : quality (Default: 80)
  ///
  /// Returns [TransformationData].
  static TransformationData compress({int? quality = 80}) {
    // Call the generated class method
    return Compress().compress(quality);
  }

  /// Basic Transformations
  ///
  /// - [top] : top (Default: 10)
  ///
  /// - [left] : left (Default: 10)
  ///
  /// - [bottom] : bottom (Default: 10)
  ///
  /// - [right] : right (Default: 10)
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// - [borderptype] : Border Type (Default: constant)
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  /// Returns [TransformationData].
  static TransformationData extend(
      {int? top = 10,
      int? left = 10,
      int? bottom = 10,
      int? right = 10,
      String? background = "000000",
      Bordertype? borderptype = Bordertype.constant,
      double? dpr = 1}) {
    // Call the generated class method
    return Extend()
        .extend(top, left, bottom, right, background, borderptype, dpr);
  }

  /// Basic Transformations
  ///
  /// - [top] : top (Default: 10)
  ///
  /// - [left] : left (Default: 10)
  ///
  /// - [height] : height (Default: 50)
  ///
  /// - [width] : width (Default: 20)
  ///
  /// - [boundinpgbox] : Bounding Box (Default: )
  ///
  /// Returns [TransformationData].
  static TransformationData extract(
      {int? top = 10,
      int? left = 10,
      int? height = 50,
      int? width = 20,
      String? boundinpgbox}) {
    // Call the generated class method
    return Extract().extract(top, left, height, width, boundinpgbox);
  }

  /// Basic Transformations
  ///
  /// - [threshold] : threshold (Default: 10)
  ///
  /// Returns [TransformationData].
  static TransformationData trim({int? threshold = 10}) {
    // Call the generated class method
    return Trim().trim(threshold);
  }

  /// Basic Transformations
  ///
  /// - [angle] : angle (Default: 0)
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// Returns [TransformationData].
  static TransformationData rotate(
      {int? angle = 0, String? background = "000000"}) {
    // Call the generated class method
    return Rotate().rotate(angle, background);
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData flip() {
    // Call the generated class method
    return Flip().flip();
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData flop() {
    // Call the generated class method
    return Flop().flop();
  }

  /// Basic Transformations
  ///
  /// - [sigma] : sigma (Default: 1.5)
  ///
  /// Returns [TransformationData].
  static TransformationData sharpen({double? sigma = 1.5}) {
    // Call the generated class method
    return Sharpen().sharpen(sigma);
  }

  /// Basic Transformations
  ///
  /// - [size] : size (Default: 3)
  ///
  /// Returns [TransformationData].
  static TransformationData median({int? size = 3}) {
    // Call the generated class method
    return Median().median(size);
  }

  /// Basic Transformations
  ///
  /// - [sigma] : sigma (Default: 0.3)
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  /// Returns [TransformationData].
  static TransformationData blur({double? sigma = 0.3, double? dpr = 1}) {
    // Call the generated class method
    return Blur().blur(sigma, dpr);
  }

  /// Basic Transformations
  ///
  /// - [background] : background (Default: "000000")
  ///
  /// Returns [TransformationData].
  static TransformationData flatten({String? background = "000000"}) {
    // Call the generated class method
    return Flatten().flatten(background);
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData negate() {
    // Call the generated class method
    return Negate().negate();
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData normalise() {
    // Call the generated class method
    return Normalise().normalise();
  }

  /// Basic Transformations
  ///
  /// - [a] : a (Default: 1)
  ///
  /// - [b] : b (Default: 0)
  ///
  /// Returns [TransformationData].
  static TransformationData linear({int? a = 1, int? b = 0}) {
    // Call the generated class method
    return Linear().linear(a, b);
  }

  /// Basic Transformations
  ///
  /// - [brightness] : brightness (Default: 1)
  ///
  /// - [saturation] : saturation (Default: 1)
  ///
  /// - [hue] : hue (Default: 90)
  ///
  /// Returns [TransformationData].
  static TransformationData modulate(
      {double? brightness = 1, double? saturation = 1, int? hue = 90}) {
    // Call the generated class method
    return Modulate().modulate(brightness, saturation, hue);
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData grey() {
    // Call the generated class method
    return Grey().grey();
  }

  /// Basic Transformations
  ///
  /// - [color] : color (Default: "000000")
  ///
  /// Returns [TransformationData].
  static TransformationData tint({String? color = "000000"}) {
    // Call the generated class method
    return Tint().tint(color);
  }

  /// Basic Transformations
  ///
  /// - [format] : format (Default: jpeg)
  ///
  /// - [quality] : quality (Default: 75)
  ///
  /// Returns [TransformationData].
  static TransformationData toformat(
      {Format? format = Format.jpeg, int? quality = 75}) {
    // Call the generated class method
    return Toformat().toFormat(format, quality);
  }

  /// Basic Transformations
  ///
  /// - [density] : density (Default: 300)
  ///
  /// Returns [TransformationData].
  static TransformationData density({int? density = 300}) {
    // Call the generated class method
    return Density().density(density);
  }

  /// Basic Transformations
  ///
  /// - [mode] : mode (Default: overlay)
  ///
  /// - [image] : image (Default: )
  ///
  /// - [transformation] : transformation (Default: )
  ///
  /// - [background] : background (Default: "00000000")
  ///
  /// - [height] : height (Default: 0)
  ///
  /// - [width] : width (Default: 0)
  ///
  /// - [top] : top (Default: 0)
  ///
  /// - [left] : left (Default: 0)
  ///
  /// - [gravity] : gravity (Default: center)
  ///
  /// - [blend] : blend (Default: over)
  ///
  /// - [tile] : tile (Default: false)
  ///
  /// - [listofbboxes] : List of bboxes (Default: )
  ///
  /// - [listofpolygons] : List of Polygons (Default: )
  ///
  /// Returns [TransformationData].
  static TransformationData merge(
      {Mode? mode = Mode.overlay,
      String? image = "",
      String? transformation = "",
      String? background = "00000000",
      int? height = 0,
      int? width = 0,
      int? top = 0,
      int? left = 0,
      Gravity? gravity = Gravity.center,
      Blend? blend = Blend.over,
      bool? tile = false,
      String? listofbboxes = "",
      String? listofpolygons = ""}) {
    // Call the generated class method
    return Merge().merge(mode, image, transformation, background, height, width,
        top, left, gravity, blend, tile, listofbboxes, listofpolygons);
  }

  // SoftShadowGenerator

  /// AI Soft Shadow Generator
  ///
  /// - [backgroundimage] : Background Image (Default: )
  ///
  /// - [backgroundcolor] : Background Color (Default: "ffffff")
  ///
  /// - [shadowangle] : Shadow Angle (Default: 120)
  ///
  /// - [shadowintensity] : Shadow Intensity (Default: 0.5)
  ///
  /// Returns [TransformationData].
  static TransformationData softshadowgenerator(
      {String? backgroundimage = "",
      String? backgroundcolor = "ffffff",
      double? shadowangle = 120,
      double? shadowintensity = 0.5}) {
    // Call the generated class method
    return SoftShadowGenerator()
        .gen(backgroundimage, backgroundcolor, shadowangle, shadowintensity);
  }

  // SuperResolution

  /// Super Resolution Module
  ///
  /// - [ptype] : Type (Default: 2x)
  ///
  /// - [enhanceface] : Enhance Face (Default: false)
  ///
  /// - [model] : Model (Default: Picasso)
  ///
  /// - [enhancequality] : Enhance Quality (Default: false)
  ///
  /// Returns [TransformationData].
  static TransformationData superresolution(
      {PType? ptype = PType.p2x,
      bool? enhanceface = false,
      Model? model = Model.picasso,
      bool? enhancequality = false}) {
    // Call the generated class method
    return SuperResolution().upscale(ptype, enhanceface, model, enhancequality);
  }

  // VideoWatermarkRemoval

  /// Video Watermark Removal Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData videowatermarkremoval() {
    // Call the generated class method
    return VideoWatermarkRemoval().remove();
  }

  // ViewDetection

  /// Classifies wear type and view type of products in the image
  ///
  /// Returns [TransformationData].
  static TransformationData viewdetection() {
    // Call the generated class method
    return ViewDetection().detect();
  }

  // WatermarkRemoval

  /// Watermark Removal Plugin
  ///
  /// - [removetext] : Remove Text (Default: false)
  ///
  /// - [removelogo] : Remove Logo (Default: false)
  ///
  /// - [box1] : Box 1 (Default: "0_0_100_100")
  ///
  /// - [box2] : Box 2 (Default: "0_0_0_0")
  ///
  /// - [box3] : Box 3 (Default: "0_0_0_0")
  ///
  /// - [box4] : Box 4 (Default: "0_0_0_0")
  ///
  /// - [box5] : Box 5 (Default: "0_0_0_0")
  ///
  /// Returns [TransformationData].
  static TransformationData watermarkremoval(
      {bool? removetext = false,
      bool? removelogo = false,
      String? box1 = "0_0_100_100",
      String? box2 = "0_0_0_0",
      String? box3 = "0_0_0_0",
      String? box4 = "0_0_0_0",
      String? box5 = "0_0_0_0"}) {
    // Call the generated class method
    return WatermarkRemoval()
        .remove(removetext, removelogo, box1, box2, box3, box4, box5);
  }

  // WatermarkDetection

  /// Watermark Detection Plugin
  ///
  /// - [detecttext] : Detect Text (Default: false)
  ///
  /// Returns [TransformationData].
  static TransformationData watermarkdetection({bool? detecttext = false}) {
    // Call the generated class method
    return WatermarkDetection().detect(detecttext);
  }
}
