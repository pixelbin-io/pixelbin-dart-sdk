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
  /// @return The generated TransformationData.
  static TransformationData detectbackgroundtype() {
    // Call the generated class method
    return DetectBackgroundType().detect();
  }

  // Artifact

  /// Artifact Removal Plugin
  ///
  /// @return The generated TransformationData.
  static TransformationData artifact() {
    // Call the generated class method
    return Artifact().remove();
  }

  // AWSRekognitionPlugin

  /// Detect objects and text in images
  ///
  /// @param maximumlabels Maximum labels (Default: 5)
  ///
  /// @param minpimumconfidence Minimum confidence (Default: 55)
  ///
  /// @return The generated TransformationData.
  static TransformationData detectlabels(
      {int? maximumlabels = 5, int? minpimumconfidence = 55}) {
    // Call the generated class method
    return Detectlabels().detectLabels(maximumlabels, minpimumconfidence);
  }

  /// Detect objects and text in images
  ///
  /// @param minpimumconfidence Minimum confidence (Default: 55)
  ///
  /// @return The generated TransformationData.
  static TransformationData moderation({int? minpimumconfidence = 55}) {
    // Call the generated class method
    return Moderation().moderation(minpimumconfidence);
  }

  // BackgroundGenerator

  /// AI Background Generator
  ///
  /// @param backgroundprompt Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  ///
  /// @param focus Focus (Default: Product)
  ///
  /// @param negativeprompt Negative prompt (Default: )
  ///
  /// @param seed Seed (Default: 123)
  ///
  /// @return The generated TransformationData.
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
  /// @param generatevariationprompt Generate variation prompt (Default: )
  ///
  /// @param noofvariations No. of variations (Default: 1)
  ///
  /// @param seed Seed (Default: 0)
  ///
  /// @param autoscale Autoscale input if it exceeds maximum resolution (Default: true)
  ///
  /// @return The generated TransformationData.
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
  /// @param foregroundptype Foreground type (Default: general)
  ///
  /// @param addshadow Add Shadow (cars only) (Default: false)
  ///
  /// @param refinpe Refine Output (Default: true)
  ///
  /// @return The generated TransformationData.
  static TransformationData erasebg(
      {Foregroundtype? foregroundptype = Foregroundtype.general,
      bool? addshadow = false,
      bool? refinpe = true}) {
    // Call the generated class method
    return EraseBG().bg(foregroundptype, addshadow, refinpe);
  }

  // GoogleVisionPlugin

  /// Detect content and text in images
  ///
  /// @param maximumlabels Maximum labels (Default: 5)
  ///
  /// @return The generated TransformationData.
  static TransformationData googlevisionplugin({int? maximumlabels = 5}) {
    // Call the generated class method
    return GoogleVisionPlugin().detectLabels(maximumlabels);
  }

  // ImageCentering

  /// Image Centering Module
  ///
  /// @param distancepercentage Distance percentage (Default: 10)
  ///
  /// @return The generated TransformationData.
  static TransformationData imagecentering({int? distancepercentage = 10}) {
    // Call the generated class method
    return ImageCentering().detect(distancepercentage);
  }

  // IntelligentCrop

  /// Intelligent Crop Plugin
  ///
  /// @param requiredwidth Required width (Default: 0)
  ///
  /// @param requiredheight Required height (Default: 0)
  ///
  /// @param paddinpgpercentage Padding percentage (Default: 0)
  ///
  /// @param mainptainporiginpalaspect Maintain original aspect (Default: false)
  ///
  /// @param aspectratio Aspect Ratio (16_9 or 2 or 0.25) (Default: )
  ///
  /// @param gravitytowards Gravity towards (Default: none)
  ///
  /// @param preferreddirection Preferred direction (Default: center)
  ///
  /// @param objectptype Object Type (if Gravity is object) (Default: person)
  ///
  /// @return The generated TransformationData.
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
  /// @return The generated TransformationData.
  static TransformationData objectcounter() {
    // Call the generated class method
    return ObjectCounter().detect();
  }

  // NSFWDetection

  /// Detect NSFW content in images
  ///
  /// @param minpimumconfidence Minimum confidence (Default: 0.5)
  ///
  /// @return The generated TransformationData.
  static TransformationData nsfwdetection({double? minpimumconfidence = 0.5}) {
    // Call the generated class method
    return NSFWDetection().detect(minpimumconfidence);
  }

  // NumberPlateDetection

  /// Number Plate Detection Plugin
  ///
  /// @return The generated TransformationData.
  static TransformationData numberplatedetection() {
    // Call the generated class method
    return NumberPlateDetection().detect();
  }

  // ObjectDetection

  /// Detect bounding boxes of objects in the image
  ///
  /// @return The generated TransformationData.
  static TransformationData objectdetection() {
    // Call the generated class method
    return ObjectDetection().detect();
  }

  // CheckObjectSize

  /// Calculates the percentage of the main object area relative to image dimensions.
  ///
  /// @param objectthresholdpercent Object threshold percent (Default: 50)
  ///
  /// @return The generated TransformationData.
  static TransformationData checkobjectsize(
      {int? objectthresholdpercent = 50}) {
    // Call the generated class method
    return CheckObjectSize().detect(objectthresholdpercent);
  }

  // TextDetectionandRecognition

  /// OCR Module
  ///
  /// @param detectonly Detect only (Default: false)
  ///
  /// @return The generated TransformationData.
  static TransformationData textdetectionandrecognition(
      {bool? detectonly = false}) {
    // Call the generated class method
    return TextDetectionandRecognition().extract(detectonly);
  }

  // PdfWatermarkRemoval

  /// PDF Watermark Removal Plugin
  ///
  /// @return The generated TransformationData.
  static TransformationData pdfwatermarkremoval() {
    // Call the generated class method
    return PdfWatermarkRemoval().remove();
  }

  // ProductTagging

  /// AI Product Tagging
  ///
  /// @return The generated TransformationData.
  static TransformationData producttagging() {
    // Call the generated class method
    return ProductTagging().tag();
  }

  // CheckProductVisibility

  /// Classifies whether the product in the image is completely visible or not
  ///
  /// @return The generated TransformationData.
  static TransformationData checkproductvisibility() {
    // Call the generated class method
    return CheckProductVisibility().detect();
  }

  // RemoveBG

  /// Remove background from any image
  ///
  /// @return The generated TransformationData.
  static TransformationData removebg() {
    // Call the generated class method
    return RemoveBG().bg();
  }

  // Basic

  /// Basic Transformations
  ///
  /// @param height Height (Default: 0)
  ///
  /// @param width Width (Default: 0)
  ///
  /// @param fit Fit (Default: cover)
  ///
  /// @param background Background (Default: 000000)
  ///
  /// @param position Position (Default: center)
  ///
  /// @param algorithm Algorithm (Default: lanczos3)
  ///
  /// @param dpr Dpr (Default: 1)
  ///
  /// @return The generated TransformationData.
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
  /// @param quality Quality (Default: 80)
  ///
  /// @return The generated TransformationData.
  static TransformationData compress({int? quality = 80}) {
    // Call the generated class method
    return Compress().compress(quality);
  }

  /// Basic Transformations
  ///
  /// @param top Top (Default: 10)
  ///
  /// @param left Left (Default: 10)
  ///
  /// @param bottom Bottom (Default: 10)
  ///
  /// @param right Right (Default: 10)
  ///
  /// @param background Background (Default: 000000)
  ///
  /// @param borderptype Border type (Default: constant)
  ///
  /// @param dpr Dpr (Default: 1)
  ///
  /// @return The generated TransformationData.
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
  /// @param top Top (Default: 10)
  ///
  /// @param left Left (Default: 10)
  ///
  /// @param height Height (Default: 50)
  ///
  /// @param width Width (Default: 20)
  ///
  /// @param boundinpgbox Bounding box
  ///
  /// @return The generated TransformationData.
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
  /// @param threshold Threshold (Default: 10)
  ///
  /// @return The generated TransformationData.
  static TransformationData trim({int? threshold = 10}) {
    // Call the generated class method
    return Trim().trim(threshold);
  }

  /// Basic Transformations
  ///
  /// @param angle Angle (Default: 0)
  ///
  /// @param background Background (Default: 000000)
  ///
  /// @return The generated TransformationData.
  static TransformationData rotate(
      {int? angle = 0, String? background = "000000"}) {
    // Call the generated class method
    return Rotate().rotate(angle, background);
  }

  /// Basic Transformations
  ///
  /// @return The generated TransformationData.
  static TransformationData flip() {
    // Call the generated class method
    return Flip().flip();
  }

  /// Basic Transformations
  ///
  /// @return The generated TransformationData.
  static TransformationData flop() {
    // Call the generated class method
    return Flop().flop();
  }

  /// Basic Transformations
  ///
  /// @param sigma Sigma (Default: 1.5)
  ///
  /// @return The generated TransformationData.
  static TransformationData sharpen({double? sigma = 1.5}) {
    // Call the generated class method
    return Sharpen().sharpen(sigma);
  }

  /// Basic Transformations
  ///
  /// @param size Size (Default: 3)
  ///
  /// @return The generated TransformationData.
  static TransformationData median({int? size = 3}) {
    // Call the generated class method
    return Median().median(size);
  }

  /// Basic Transformations
  ///
  /// @param sigma Sigma (Default: 0.3)
  ///
  /// @param dpr Dpr (Default: 1)
  ///
  /// @return The generated TransformationData.
  static TransformationData blur({double? sigma = 0.3, double? dpr = 1}) {
    // Call the generated class method
    return Blur().blur(sigma, dpr);
  }

  /// Basic Transformations
  ///
  /// @param background Background (Default: 000000)
  ///
  /// @return The generated TransformationData.
  static TransformationData flatten({String? background = "000000"}) {
    // Call the generated class method
    return Flatten().flatten(background);
  }

  /// Basic Transformations
  ///
  /// @return The generated TransformationData.
  static TransformationData negate() {
    // Call the generated class method
    return Negate().negate();
  }

  /// Basic Transformations
  ///
  /// @return The generated TransformationData.
  static TransformationData normalise() {
    // Call the generated class method
    return Normalise().normalise();
  }

  /// Basic Transformations
  ///
  /// @param a A (Default: 1)
  ///
  /// @param b B (Default: 0)
  ///
  /// @return The generated TransformationData.
  static TransformationData linear({int? a = 1, int? b = 0}) {
    // Call the generated class method
    return Linear().linear(a, b);
  }

  /// Basic Transformations
  ///
  /// @param brightness Brightness (Default: 1)
  ///
  /// @param saturation Saturation (Default: 1)
  ///
  /// @param hue Hue (Default: 90)
  ///
  /// @return The generated TransformationData.
  static TransformationData modulate(
      {double? brightness = 1, double? saturation = 1, int? hue = 90}) {
    // Call the generated class method
    return Modulate().modulate(brightness, saturation, hue);
  }

  /// Basic Transformations
  ///
  /// @return The generated TransformationData.
  static TransformationData grey() {
    // Call the generated class method
    return Grey().grey();
  }

  /// Basic Transformations
  ///
  /// @param color Color (Default: 000000)
  ///
  /// @return The generated TransformationData.
  static TransformationData tint({String? color = "000000"}) {
    // Call the generated class method
    return Tint().tint(color);
  }

  /// Basic Transformations
  ///
  /// @param format Format (Default: jpeg)
  ///
  /// @param quality Quality (Default: 75)
  ///
  /// @return The generated TransformationData.
  static TransformationData toformat(
      {Format? format = Format.jpeg, int? quality = 75}) {
    // Call the generated class method
    return Toformat().toFormat(format, quality);
  }

  /// Basic Transformations
  ///
  /// @param density Density (Default: 300)
  ///
  /// @return The generated TransformationData.
  static TransformationData density({int? density = 300}) {
    // Call the generated class method
    return Density().density(density);
  }

  /// Basic Transformations
  ///
  /// @param mode Mode (Default: overlay)
  ///
  /// @param image Image (Default: )
  ///
  /// @param transformation Transformation (Default: )
  ///
  /// @param background Background (Default: 00000000)
  ///
  /// @param height Height (Default: 0)
  ///
  /// @param width Width (Default: 0)
  ///
  /// @param top Top (Default: 0)
  ///
  /// @param left Left (Default: 0)
  ///
  /// @param gravity Gravity (Default: center)
  ///
  /// @param blend Blend (Default: over)
  ///
  /// @param tile Tile (Default: false)
  ///
  /// @param listofbboxes List of bboxes
  ///
  /// @param listofpolygons List of polygons
  ///
  /// @return The generated TransformationData.
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
  /// @param backgroundimage Background image
  ///
  /// @param backgroundcolor Background color (Default: ffffff)
  ///
  /// @param shadowangle Shadow angle (Default: 120)
  ///
  /// @param shadowintensity Shadow intensity (Default: 0.5)
  ///
  /// @return The generated TransformationData.
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
  /// @param ptype Type (Default: 2x)
  ///
  /// @param enhanceface Enhance face (Default: false)
  ///
  /// @param model Model (Default: Picasso)
  ///
  /// @param enhancequality Enhance quality (Default: false)
  ///
  /// @return The generated TransformationData.
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
  /// @return The generated TransformationData.
  static TransformationData videowatermarkremoval() {
    // Call the generated class method
    return VideoWatermarkRemoval().remove();
  }

  // ViewDetection

  /// Classifies wear type and view type of products in the image
  ///
  /// @return The generated TransformationData.
  static TransformationData viewdetection() {
    // Call the generated class method
    return ViewDetection().detect();
  }

  // WatermarkRemoval

  /// Watermark Removal Plugin
  ///
  /// @param removetext Remove text (Default: false)
  ///
  /// @param removelogo Remove logo (Default: false)
  ///
  /// @param box1 Box 1 (Default: 0_0_100_100)
  ///
  /// @param box2 Box 2 (Default: 0_0_0_0)
  ///
  /// @param box3 Box 3 (Default: 0_0_0_0)
  ///
  /// @param box4 Box 4 (Default: 0_0_0_0)
  ///
  /// @param box5 Box 5 (Default: 0_0_0_0)
  ///
  /// @return The generated TransformationData.
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
  /// @param detecttext Detect text (Default: false)
  ///
  /// @return The generated TransformationData.
  static TransformationData watermarkdetection({bool? detecttext = false}) {
    // Call the generated class method
    return WatermarkDetection().detect(detecttext);
  }
}
