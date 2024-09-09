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
import 'transformations/vertex_a_i.dart';
import 'transformations/q_r_code.dart';

class Transformation {
  // DetectBackgroundType

  /// Classifies the background of a product as plain, clean or busy
  ///
  /// Returns [TransformationData].
  static TransformationData dbtDetect() {
    // Call the generated class method
    return DbtDetect().detect();
  }

  // Artifact

  /// Artifact Removal Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData afRemove() {
    // Call the generated class method
    return AfRemove().remove();
  }

  // AWSRekognitionPlugin

  /// Detect objects and text in images
  ///
  ///
  /// - [maximumLabels] : Maximum Labels (Default: 5)
  ///
  ///
  ///
  /// - [minimumConfidence] : Minimum Confidence (Default: 55)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData awsrekDetectlabels(
      {int? maximumLabels = 5, int? minimumConfidence = 55}) {
    // Call the generated class method
    return AwsrekDetectlabels().detectLabels(maximumLabels, minimumConfidence);
  }

  /// Detect objects and text in images
  ///
  ///
  /// - [minimumConfidence] : Minimum Confidence (Default: 55)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData awsrekModeration({int? minimumConfidence = 55}) {
    // Call the generated class method
    return AwsrekModeration().moderation(minimumConfidence);
  }

  // BackgroundGenerator

  /// AI Background Generator
  ///
  ///
  /// - [backgroundPrompt] : Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  ///
  ///
  ///
  /// - [focus] : GenerateFocus (Default: Product)
  ///
  ///
  ///
  /// - [negativePrompt] : Negative prompt (Default: )
  ///
  ///
  ///
  /// - [seed] : seed (Default: 123)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData generateBg(
      {String? backgroundPrompt =
          "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
      GenerateFocus? focus = GenerateFocus.product,
      String? negativePrompt = "",
      int? seed = 123}) {
    // Call the generated class method
    return GenerateBg().bg(backgroundPrompt, focus, negativePrompt, seed);
  }

  // VariationGenerator

  /// AI Variation Generator
  ///
  ///
  /// - [generateVariationPrompt] : Generate variation prompt (Default: )
  ///
  ///
  ///
  /// - [noOfVariations] : No. of Variations (Default: 1)
  ///
  ///
  ///
  /// - [seed] : Seed (Default: 0)
  ///
  ///
  ///
  /// - [autoscale] : Autoscale (Default: true)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData vgGenerate(
      {String? generateVariationPrompt = "",
      int? noOfVariations = 1,
      int? seed = 0,
      bool? autoscale = true}) {
    // Call the generated class method
    return VgGenerate()
        .generate(generateVariationPrompt, noOfVariations, seed, autoscale);
  }

  // EraseBG

  /// EraseBG Background Removal Module
  ///
  ///
  /// - [industryType] : EraseIndustryType (Default: general)
  ///
  ///
  ///
  /// - [addShadow] : Add Shadow (Default: false)
  ///
  ///
  ///
  /// - [refine] : Refine (Default: true)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData eraseBg(
      {EraseIndustryType? industryType = EraseIndustryType.general,
      bool? addShadow = false,
      bool? refine = true}) {
    // Call the generated class method
    return EraseBg().bg(industryType, addShadow, refine);
  }

  // GoogleVisionPlugin

  /// Detect content and text in images
  ///
  ///
  /// - [maximumLabels] : Maximum Labels (Default: 5)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData googlevisDetectlabels({int? maximumLabels = 5}) {
    // Call the generated class method
    return GooglevisDetectlabels().detectLabels(maximumLabels);
  }

  // ImageCentering

  /// Image Centering Module
  ///
  ///
  /// - [distancePercentage] : Distance percentage (Default: 10)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData imcDetect({int? distancePercentage = 10}) {
    // Call the generated class method
    return ImcDetect().detect(distancePercentage);
  }

  // IntelligentCrop

  /// Intelligent Crop Plugin
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
  static TransformationData icCrop(
      {int? requiredWidth = 0,
      int? requiredHeight = 0,
      int? paddingPercentage = 0,
      bool? maintainOriginalAspect = false,
      String? aspectRatio = "",
      IcGravitytowards? gravityTowards = IcGravitytowards.none,
      IcPreferreddirection? preferredDirection = IcPreferreddirection.center,
      IcObjectType? objectType = IcObjectType.person}) {
    // Call the generated class method
    return IcCrop().crop(
        requiredWidth,
        requiredHeight,
        paddingPercentage,
        maintainOriginalAspect,
        aspectRatio,
        gravityTowards,
        preferredDirection,
        objectType);
  }

  // ObjectCounter

  /// Classifies whether objects in the image are single or multiple
  ///
  /// Returns [TransformationData].
  static TransformationData ocDetect() {
    // Call the generated class method
    return OcDetect().detect();
  }

  // NSFWDetection

  /// Detect NSFW content in images
  ///
  ///
  /// - [minimumConfidence] : Minimum Confidence (Default: 0.5)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData nsfwDetect({double? minimumConfidence = 0.5}) {
    // Call the generated class method
    return NsfwDetect().detect(minimumConfidence);
  }

  // NumberPlateDetection

  /// Number Plate Detection Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData numplateDetect() {
    // Call the generated class method
    return NumplateDetect().detect();
  }

  // ObjectDetection

  /// Detect bounding boxes of objects in the image
  ///
  /// Returns [TransformationData].
  static TransformationData odDetect() {
    // Call the generated class method
    return OdDetect().detect();
  }

  // CheckObjectSize

  /// Calculates the percentage of the main object area relative to image dimensions.
  ///
  ///
  /// - [objectThresholdPercent] : Object Threshold Percent (Default: 50)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData cosDetect({int? objectThresholdPercent = 50}) {
    // Call the generated class method
    return CosDetect().detect(objectThresholdPercent);
  }

  // TextDetectionandRecognition

  /// OCR Module
  ///
  ///
  /// - [detectOnly] : Detect Only (Default: false)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData ocrExtract({bool? detectOnly = false}) {
    // Call the generated class method
    return OcrExtract().extract(detectOnly);
  }

  // PdfWatermarkRemoval

  /// PDF Watermark Removal Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData pwrRemove() {
    // Call the generated class method
    return PwrRemove().remove();
  }

  // ProductTagging

  /// AI Product Tagging
  ///
  /// Returns [TransformationData].
  static TransformationData prTag() {
    // Call the generated class method
    return PrTag().tag();
  }

  // CheckProductVisibility

  /// Classifies whether the product in the image is completely visible or not
  ///
  /// Returns [TransformationData].
  static TransformationData cpvDetect() {
    // Call the generated class method
    return CpvDetect().detect();
  }

  // QRCode

  /// QRCode Plugin
  ///
  ///
  /// - [width] : width (Default: 300)
  ///
  ///
  ///
  /// - [height] : height (Default: 300)
  ///
  ///
  ///
  /// - [image] : image (Default: )
  ///
  ///
  ///
  /// - [margin] : margin (Default: 0)
  ///
  ///
  ///
  /// - [qRTypeNumber] : qRTypeNumber (Default: 0)
  ///
  ///
  ///
  /// - [qrErrorCorrectionLevel] : QrQrerrorcorrectionlevel (Default: Q)
  ///
  ///
  ///
  /// - [imageSize] : imageSize (Default: 0.4)
  ///
  ///
  ///
  /// - [imageMargin] : imageMargin (Default: 0)
  ///
  ///
  ///
  /// - [dotsColor] : dotsColor (Default: "000000")
  ///
  ///
  ///
  /// - [dotsType] : QrDotsType (Default: square)
  ///
  ///
  ///
  /// - [dotsBgColor] : dotsBgColor (Default: "ffffff")
  ///
  ///
  ///
  /// - [cornerSquareColor] : cornerSquareColor (Default: "000000")
  ///
  ///
  ///
  /// - [cornerSquareType] : QrCornersquareType (Default: square)
  ///
  ///
  ///
  /// - [cornerDotsColor] : cornerDotsColor (Default: "000000")
  ///
  ///
  ///
  /// - [cornerDotsType] : QrCornerdotsType (Default: dot)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData qrGenerate(
      {int? width = 300,
      int? height = 300,
      String? image = "",
      int? margin = 0,
      int? qRTypeNumber = 0,
      QrQrerrorcorrectionlevel? qrErrorCorrectionLevel =
          QrQrerrorcorrectionlevel.q,
      double? imageSize = 0.4,
      int? imageMargin = 0,
      String? dotsColor = "000000",
      QrDotsType? dotsType = QrDotsType.square,
      String? dotsBgColor = "ffffff",
      String? cornerSquareColor = "000000",
      QrCornersquareType? cornerSquareType = QrCornersquareType.square,
      String? cornerDotsColor = "000000",
      QrCornerdotsType? cornerDotsType = QrCornerdotsType.dot}) {
    // Call the generated class method
    return QrGenerate().generate(
        width,
        height,
        image,
        margin,
        qRTypeNumber,
        qrErrorCorrectionLevel,
        imageSize,
        imageMargin,
        dotsColor,
        dotsType,
        dotsBgColor,
        cornerSquareColor,
        cornerSquareType,
        cornerDotsColor,
        cornerDotsType);
  }

  /// QRCode Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData qrScan() {
    // Call the generated class method
    return QrScan().scan();
  }

  // RemoveBG

  /// Remove background from any image
  ///
  /// Returns [TransformationData].
  static TransformationData removeBg() {
    // Call the generated class method
    return RemoveBg().bg();
  }

  // Basic

  /// Basic Transformations
  ///
  ///
  /// - [height] : height (Default: 0)
  ///
  ///
  ///
  /// - [width] : width (Default: 0)
  ///
  ///
  ///
  /// - [fit] : TFit (Default: cover)
  ///
  ///
  ///
  /// - [background] : background (Default: "000000")
  ///
  ///
  ///
  /// - [position] : TPosition (Default: center)
  ///
  ///
  ///
  /// - [algorithm] : TAlgorithm (Default: lanczos3)
  ///
  ///
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tResize(
      {int? height = 0,
      int? width = 0,
      TFit? fit = TFit.cover,
      String? background = "000000",
      TPosition? position = TPosition.center,
      TAlgorithm? algorithm = TAlgorithm.lanczos3,
      double? dpr = 1}) {
    // Call the generated class method
    return TResize()
        .resize(height, width, fit, background, position, algorithm, dpr);
  }

  /// Basic Transformations
  ///
  ///
  /// - [quality] : quality (Default: 80)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tCompress({int? quality = 80}) {
    // Call the generated class method
    return TCompress().compress(quality);
  }

  /// Basic Transformations
  ///
  ///
  /// - [top] : top (Default: 10)
  ///
  ///
  ///
  /// - [left] : left (Default: 10)
  ///
  ///
  ///
  /// - [bottom] : bottom (Default: 10)
  ///
  ///
  ///
  /// - [right] : right (Default: 10)
  ///
  ///
  ///
  /// - [background] : background (Default: "000000")
  ///
  ///
  ///
  /// - [borderType] : TBorderType (Default: constant)
  ///
  ///
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tExtend(
      {int? top = 10,
      int? left = 10,
      int? bottom = 10,
      int? right = 10,
      String? background = "000000",
      TBorderType? borderType = TBorderType.constant,
      double? dpr = 1}) {
    // Call the generated class method
    return TExtend()
        .extend(top, left, bottom, right, background, borderType, dpr);
  }

  /// Basic Transformations
  ///
  ///
  /// - [top] : top (Default: 10)
  ///
  ///
  ///
  /// - [left] : left (Default: 10)
  ///
  ///
  ///
  /// - [height] : height (Default: 50)
  ///
  ///
  ///
  /// - [width] : width (Default: 20)
  ///
  ///
  ///
  /// - [boundingBox] : Bounding Box (Default: )
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tExtract(
      {int? top = 10,
      int? left = 10,
      int? height = 50,
      int? width = 20,
      String? boundingBox}) {
    // Call the generated class method
    return TExtract().extract(top, left, height, width, boundingBox);
  }

  /// Basic Transformations
  ///
  ///
  /// - [threshold] : threshold (Default: 10)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tTrim({int? threshold = 10}) {
    // Call the generated class method
    return TTrim().trim(threshold);
  }

  /// Basic Transformations
  ///
  ///
  /// - [angle] : angle (Default: 0)
  ///
  ///
  ///
  /// - [background] : background (Default: "000000")
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tRotate(
      {int? angle = 0, String? background = "000000"}) {
    // Call the generated class method
    return TRotate().rotate(angle, background);
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData tFlip() {
    // Call the generated class method
    return TFlip().flip();
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData tFlop() {
    // Call the generated class method
    return TFlop().flop();
  }

  /// Basic Transformations
  ///
  ///
  /// - [sigma] : sigma (Default: 1.5)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tSharpen({double? sigma = 1.5}) {
    // Call the generated class method
    return TSharpen().sharpen(sigma);
  }

  /// Basic Transformations
  ///
  ///
  /// - [size] : size (Default: 3)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tMedian({int? size = 3}) {
    // Call the generated class method
    return TMedian().median(size);
  }

  /// Basic Transformations
  ///
  ///
  /// - [sigma] : sigma (Default: 0.3)
  ///
  ///
  ///
  /// - [dpr] : DPR (Default: 1)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tBlur({double? sigma = 0.3, double? dpr = 1}) {
    // Call the generated class method
    return TBlur().blur(sigma, dpr);
  }

  /// Basic Transformations
  ///
  ///
  /// - [background] : background (Default: "000000")
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tFlatten({String? background = "000000"}) {
    // Call the generated class method
    return TFlatten().flatten(background);
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData tNegate() {
    // Call the generated class method
    return TNegate().negate();
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData tNormalise() {
    // Call the generated class method
    return TNormalise().normalise();
  }

  /// Basic Transformations
  ///
  ///
  /// - [a] : a (Default: 1)
  ///
  ///
  ///
  /// - [b] : b (Default: 0)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tLinear({int? a = 1, int? b = 0}) {
    // Call the generated class method
    return TLinear().linear(a, b);
  }

  /// Basic Transformations
  ///
  ///
  /// - [brightness] : brightness (Default: 1)
  ///
  ///
  ///
  /// - [saturation] : saturation (Default: 1)
  ///
  ///
  ///
  /// - [hue] : hue (Default: 90)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tModulate(
      {double? brightness = 1, double? saturation = 1, int? hue = 90}) {
    // Call the generated class method
    return TModulate().modulate(brightness, saturation, hue);
  }

  /// Basic Transformations
  ///
  /// Returns [TransformationData].
  static TransformationData tGrey() {
    // Call the generated class method
    return TGrey().grey();
  }

  /// Basic Transformations
  ///
  ///
  /// - [color] : color (Default: "000000")
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tTint({String? color = "000000"}) {
    // Call the generated class method
    return TTint().tint(color);
  }

  /// Basic Transformations
  ///
  ///
  /// - [format] : TFormat (Default: jpeg)
  ///
  ///
  ///
  /// - [quality] : quality (Default: 75)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tToformat(
      {TFormat? format = TFormat.jpeg, int? quality = 75}) {
    // Call the generated class method
    return TToformat().toFormat(format, quality);
  }

  /// Basic Transformations
  ///
  ///
  /// - [density] : density (Default: 300)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tDensity({int? density = 300}) {
    // Call the generated class method
    return TDensity().density(density);
  }

  /// Basic Transformations
  ///
  ///
  /// - [mode] : TMode (Default: overlay)
  ///
  ///
  ///
  /// - [image] : image (Default: )
  ///
  ///
  ///
  /// - [transformation] : transformation (Default: )
  ///
  ///
  ///
  /// - [background] : background (Default: "00000000")
  ///
  ///
  ///
  /// - [height] : height (Default: 0)
  ///
  ///
  ///
  /// - [width] : width (Default: 0)
  ///
  ///
  ///
  /// - [top] : top (Default: 0)
  ///
  ///
  ///
  /// - [left] : left (Default: 0)
  ///
  ///
  ///
  /// - [gravity] : TGravity (Default: center)
  ///
  ///
  ///
  /// - [blend] : TBlend (Default: over)
  ///
  ///
  ///
  /// - [tile] : tile (Default: false)
  ///
  ///
  ///
  /// - [listOfBboxes] : List of bboxes (Default: )
  ///
  ///
  ///
  /// - [listOfPolygons] : List of Polygons (Default: )
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData tMerge(
      {TMode? mode = TMode.overlay,
      String? image = "",
      String? transformation = "",
      String? background = "00000000",
      int? height = 0,
      int? width = 0,
      int? top = 0,
      int? left = 0,
      TGravity? gravity = TGravity.center,
      TBlend? blend = TBlend.over,
      bool? tile = false,
      String? listOfBboxes = "",
      String? listOfPolygons = ""}) {
    // Call the generated class method
    return TMerge().merge(mode, image, transformation, background, height,
        width, top, left, gravity, blend, tile, listOfBboxes, listOfPolygons);
  }

  // SoftShadowGenerator

  /// AI Soft Shadow Generator
  ///
  ///
  /// - [backgroundImage] : Background Image (Default: )
  ///
  ///
  ///
  /// - [backgroundColor] : Background Color (Default: "ffffff")
  ///
  ///
  ///
  /// - [shadowAngle] : Shadow Angle (Default: 120)
  ///
  ///
  ///
  /// - [shadowIntensity] : Shadow Intensity (Default: 0.5)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData shadowGen(
      {String? backgroundImage = "",
      String? backgroundColor = "ffffff",
      double? shadowAngle = 120,
      double? shadowIntensity = 0.5}) {
    // Call the generated class method
    return ShadowGen()
        .gen(backgroundImage, backgroundColor, shadowAngle, shadowIntensity);
  }

  // SuperResolution

  /// Super Resolution Module
  ///
  ///
  /// - [type] : SrType (Default: 2x)
  ///
  ///
  ///
  /// - [enhanceFace] : Enhance Face (Default: false)
  ///
  ///
  ///
  /// - [model] : SrModel (Default: Picasso)
  ///
  ///
  ///
  /// - [enhanceQuality] : Enhance Quality (Default: false)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData srUpscale(
      {SrType? type = SrType.p2X,
      bool? enhanceFace = false,
      SrModel? model = SrModel.picasso,
      bool? enhanceQuality = false}) {
    // Call the generated class method
    return SrUpscale().upscale(type, enhanceFace, model, enhanceQuality);
  }

  // VertexAI

  /// Vertex AI based transformations
  ///
  ///
  /// - [backgroundPrompt] : Background prompt (Default: YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr)
  ///
  ///
  ///
  /// - [negativePrompt] : Negative prompt (Default: )
  ///
  ///
  ///
  /// - [seed] : seed (Default: 22)
  ///
  ///
  ///
  /// - [guidanceScale] : Guidance Scale (Default: 60)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData vertexaiGeneratebg(
      {String? backgroundPrompt =
          "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
      String? negativePrompt = "",
      int? seed = 22,
      int? guidanceScale = 60}) {
    // Call the generated class method
    return VertexaiGeneratebg()
        .generateBG(backgroundPrompt, negativePrompt, seed, guidanceScale);
  }

  /// Vertex AI based transformations
  ///
  /// Returns [TransformationData].
  static TransformationData vertexaiRemovebg() {
    // Call the generated class method
    return VertexaiRemovebg().removeBG();
  }

  /// Vertex AI based transformations
  ///
  ///
  /// - [type] : VertexaiType (Default: x2)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData vertexaiUpscale(
      {VertexaiType? type = VertexaiType.x2}) {
    // Call the generated class method
    return VertexaiUpscale().upscale(type);
  }

  // VideoWatermarkRemoval

  /// Video Watermark Removal Plugin
  ///
  /// Returns [TransformationData].
  static TransformationData wmvRemove() {
    // Call the generated class method
    return WmvRemove().remove();
  }

  // ViewDetection

  /// Classifies wear type and view type of products in the image
  ///
  /// Returns [TransformationData].
  static TransformationData vdDetect() {
    // Call the generated class method
    return VdDetect().detect();
  }

  // WatermarkRemoval

  /// Watermark Removal Plugin
  ///
  ///
  /// - [removeText] : Remove Text (Default: false)
  ///
  ///
  ///
  /// - [removeLogo] : Remove Logo (Default: false)
  ///
  ///
  ///
  /// - [box1] : Box 1 (Default: "0_0_100_100")
  ///
  ///
  ///
  /// - [box2] : Box 2 (Default: "0_0_0_0")
  ///
  ///
  ///
  /// - [box3] : Box 3 (Default: "0_0_0_0")
  ///
  ///
  ///
  /// - [box4] : Box 4 (Default: "0_0_0_0")
  ///
  ///
  ///
  /// - [box5] : Box 5 (Default: "0_0_0_0")
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData wmRemove(
      {bool? removeText = false,
      bool? removeLogo = false,
      String? box1 = "0_0_100_100",
      String? box2 = "0_0_0_0",
      String? box3 = "0_0_0_0",
      String? box4 = "0_0_0_0",
      String? box5 = "0_0_0_0"}) {
    // Call the generated class method
    return WmRemove()
        .remove(removeText, removeLogo, box1, box2, box3, box4, box5);
  }

  // WatermarkDetection

  /// Watermark Detection Plugin
  ///
  ///
  /// - [detectText] : Detect Text (Default: false)
  ///
  ///
  /// Returns [TransformationData].
  static TransformationData wmcDetect({bool? detectText = false}) {
    // Call the generated class method
    return WmcDetect().detect(detectText);
  }
}
