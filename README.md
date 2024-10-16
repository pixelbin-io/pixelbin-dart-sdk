# Pixelbin

Pixelbin Dart library helps you integrate Pixelbin with your Dart/Flutter Application.

## Usage

### Install using [Pub Package Manager](https://pub.dev/packages/pixelbin)

**Run this command:**

- With Dart:

```bash
     dart pub add pixelbin
```

- With Flutter:

```bash
     flutter pub add pixelbin
```

**OR**

- This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```yaml
dependencies:
  pixelbin: ^latest_release_version
```

### Creating Image from URL or Cloud details

```dart
import 'package:pixelbin/pixelbin_dart_sdk.dart';
final PixelBinImage? imageFromUrl = PixelBin.shared.imageFromUrl(
        "https://cdn.pixelbin.io/v2/dummy-cloudname/original/__playground/playground-default.jpeg");
debugPrint(imageFromUrl?.encoded);
// Create Image url from cloud, zone and other details
final PixelBinImage imageFromDetails = pixelBin.image(
          imagePath: imageFromUrl.imagePath, cloud: imageFromUrl.cloudName, transformations: imageFromUrl.transformations, version: imageFromUrl.version);
debugPrint(imageFromDetails.encoded);
```

______________________________________________________________________

### Applying Transformations and Getting Transformations

```dart
import 'package:pixelbin/pixelbin_dart_sdk.dart';
// Create Image url from cloud, zone and imagePath on cloud (Not local path)
final image = PixelBin.shared.image(imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia");
      debugPrint(imageFromDetails.encoded); // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg
final resizeTransformation = Transformation.tResize(height: 200, width: 200); // Creating Resize Transformation
image.addTransformations([eraseTransformation, resizeTransformation]); // Applying multiple transformations with list(keep passing all transformations in list)
// OR
image.addTransformation(resizeTransformation); // Applying transformations one by one
final outputUrl = image.encoded; // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/erase.bg()~t.resize(h:100,w:100)/example/logo/apple.jpg
debugPrint(outputUrl);
```

### Uploading Image and getting url object

```dart
// Signed Url and Field can be generated via using Backed SDK for pixelbin or API to generate signed url for upload
// Assume imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia" & generate details
final signUrl = "SIGNED_URL";
final fields = {// Key: Value}; // META_DATA in value
final signedDetails = SignedDetails(url: signUrl, fields: fields)
// file is local picked file, other fields chunkSize: Int = 1024, concurrency: Int = 1
try {
     final signedDetails = SignedDetails(url: signUrl,fields:fields);
     final PixelBinImage? uploadResponse = await PixelBin.shared
          .upload(file: file, signedDetails: signedDetails);
     debugPrint("Response:=> ${uploadResponse?.encoded}");
    } catch (e) {
     debugPrint("Error:=> ${e.toString()}");
    }
```

| Parameter                                                                | Type    | Description                                                 |
| ------------------------------------------------------------------------ | ------- | ----------------------------------------------------------- |
| file ([File](https://developer.apple.com/documentation/foundation/file)) | File    | File to upload to Pixelbin                                  |
| signedDetails (SignedDetails)                                            | Object  | Signed details generated with the Pixelbin Backend SDK      |
| chunkSize (Int)                                                          | Integer | Size of chunks to be uploaded in KB (default value is 1024) |
| concurrency (Int)                                                        | Integer | Number of chunks to be uploaded in parallel API calls       |

- Resolves with Image object on success.
- Rejects with error on failure.

## List of Supported Transformations

### DetectBackgroundType

#### 1. dbtDetect()

Classifies the background of a product as plain, clean or busy

```dart
final t = Transformation.dbtDetect(
        );
```

### Basic

#### 1. tResize(height, width, fit, background, position, algorithm, dpr)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| height | integer | 0 |
| width | integer | 0 |
| fit | enum`cover`, `contain`, `fill`, `inside`, `outside` | TFit.cover |
| background | color | "000000" |
| position | enum`top`, `bottom`, `left`, `right`, `right_top`, `right_bottom`, `left_top`, `left_bottom`, `center` | TPosition.center |
| algorithm | enum`nearest`, `cubic`, `mitchell`, `lanczos2`, `lanczos3` | TAlgorithm.lanczos3 |
| dpr | float | 1 |

```dart
final t = Transformation.tResize(
        height: 0,
        width: 0,
        fit: TFit.cover,
        background: "000000",
        position: TPosition.center,
        algorithm: TAlgorithm.lanczos3,
        dpr: 1
        );
```

#### 2. tCompress(quality)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| quality | integer | 80 |

```dart
final t = Transformation.tCompress(
        quality: 80
        );
```

#### 3. tExtend(top, left, bottom, right, background, borderType, dpr)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| top | integer | 10 |
| left | integer | 10 |
| bottom | integer | 10 |
| right | integer | 10 |
| background | color | "000000" |
| borderType | enum`constant`, `replicate`, `reflect`, `wrap` | TBorderType.constant |
| dpr | float | 1 |

```dart
final t = Transformation.tExtend(
        top: 10,
        left: 10,
        bottom: 10,
        right: 10,
        background: "000000",
        borderType: TBorderType.constant,
        dpr: 1
        );
```

#### 4. tExtract(top, left, height, width, boundingBox)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| top | integer | 10 |
| left | integer | 10 |
| height | integer | 50 |
| width | integer | 20 |
| boundingBox | bbox | null |

```dart
final t = Transformation.tExtract(
        top: 10,
        left: 10,
        height: 50,
        width: 20,
        boundingBox: null
        );
```

#### 5. tTrim(threshold)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| threshold | integer | 10 |

```dart
final t = Transformation.tTrim(
        threshold: 10
        );
```

#### 6. tRotate(angle, background)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| angle | integer | 0 |
| background | color | "000000" |

```dart
final t = Transformation.tRotate(
        angle: 0,
        background: "000000"
        );
```

#### 7. tFlip()

Basic Transformations

```dart
final t = Transformation.tFlip(
        );
```

#### 8. tFlop()

Basic Transformations

```dart
final t = Transformation.tFlop(
        );
```

#### 9. tSharpen(sigma)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| sigma | float | 1.5 |

```dart
final t = Transformation.tSharpen(
        sigma: 1.5
        );
```

#### 10. tMedian(size)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| size | integer | 3 |

```dart
final t = Transformation.tMedian(
        size: 3
        );
```

#### 11. tBlur(sigma, dpr)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| sigma | float | 0.3 |
| dpr | float | 1 |

```dart
final t = Transformation.tBlur(
        sigma: 0.3,
        dpr: 1
        );
```

#### 12. tFlatten(background)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| background | color | "000000" |

```dart
final t = Transformation.tFlatten(
        background: "000000"
        );
```

#### 13. tNegate()

Basic Transformations

```dart
final t = Transformation.tNegate(
        );
```

#### 14. tNormalise()

Basic Transformations

```dart
final t = Transformation.tNormalise(
        );
```

#### 15. tLinear(a, b)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| a | integer | 1 |
| b | integer | 0 |

```dart
final t = Transformation.tLinear(
        a: 1,
        b: 0
        );
```

#### 16. tModulate(brightness, saturation, hue)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| brightness | float | 1 |
| saturation | float | 1 |
| hue | integer | 90 |

```dart
final t = Transformation.tModulate(
        brightness: 1,
        saturation: 1,
        hue: 90
        );
```

#### 17. tGrey()

Basic Transformations

```dart
final t = Transformation.tGrey(
        );
```

#### 18. tTint(color)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| color | color | "000000" |

```dart
final t = Transformation.tTint(
        color: "000000"
        );
```

#### 19. tToformat(format, quality)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| format | enum`jpeg`, `png`, `webp`, `tiff`, `avif`, `bmp`, `heif` | TFormat.jpeg |
| quality | enum`100`, `95`, `90`, `85`, `80`, `75`, `70`, `60`, `50`, `40`, `30`, `20`, `10`, `best`, `good`, `eco`, `low` | TQuality.p75 |

```dart
final t = Transformation.tToformat(
        format: TFormat.jpeg,
        quality: TQuality.p75
        );
```

#### 20. tDensity(density)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| density | integer | 300 |

```dart
final t = Transformation.tDensity(
        density: 300
        );
```

#### 21. tMerge(mode, image, transformation, background, height, width, top, left, gravity, blend, tile, listOfBboxes, listOfPolygons)

Basic Transformations
| Parameter | Type | Default |
|-----------|------|---------|
| mode | enum`overlay`, `underlay`, `wrap` | TMode.overlay |
| image | file | "" |
| transformation | custom | "" |
| background | color | "00000000" |
| height | integer | 0 |
| width | integer | 0 |
| top | integer | 0 |
| left | integer | 0 |
| gravity | enum`northwest`, `north`, `northeast`, `east`, `center`, `west`, `southwest`, `south`, `southeast`, `custom` | TGravity.center |
| blend | enum`over`, `in`, `out`, `atop`, `dest`, `dest-over`, `dest-in`, `dest-out`, `dest-atop`, `xor`, `add`, `saturate`, `multiply`, `screen`, `overlay`, `darken`, `lighten`, `colour-dodge`, `color-dodge`, `colour-burn`, `color-burn`, `hard-light`, `soft-light`, `difference`, `exclusion` | TBlend.over |
| tile | boolean | false |
| listOfBboxes | bboxList | null |
| listOfPolygons | polygonList | null |

```dart
final t = Transformation.tMerge(
        mode: TMode.overlay,
        image: "",
        transformation: "",
        background: "00000000",
        height: 0,
        width: 0,
        top: 0,
        left: 0,
        gravity: TGravity.center,
        blend: TBlend.over,
        tile: false,
        listOfBboxes: null,
        listOfPolygons: null
        );
```

### Artifact

#### 1. afRemove()

Artifact Removal Plugin

```dart
final t = Transformation.afRemove(
        );
```

### AWSRekognitionPlugin

#### 1. awsrekDetectlabels(maximumLabels, minimumConfidence)

Detect objects and text in images
| Parameter | Type | Default |
|-----------|------|---------|
| maximumLabels | integer | 5 |
| minimumConfidence | integer | 55 |

```dart
final t = Transformation.awsrekDetectlabels(
        maximumLabels: 5,
        minimumConfidence: 55
        );
```

#### 2. awsrekModeration(minimumConfidence)

Detect objects and text in images
| Parameter | Type | Default |
|-----------|------|---------|
| minimumConfidence | integer | 55 |

```dart
final t = Transformation.awsrekModeration(
        minimumConfidence: 55
        );
```

### BackgroundGenerator

#### 1. generateBg(backgroundPrompt, focus, negativePrompt, seed)

AI Background Generator
| Parameter | Type | Default |
|-----------|------|---------|
| backgroundPrompt | custom | "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr" |
| focus | enum`Product`, `Background` | GenerateFocus.product |
| negativePrompt | custom | "" |
| seed | integer | 123 |

```dart
final t = Transformation.generateBg(
        backgroundPrompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
        focus: GenerateFocus.product,
        negativePrompt: "",
        seed: 123
        );
```

### ImageExtender

#### 1. bgExtend(boundingBox, prompt, negativePrompt, strength, guidanceScale, numberOfInferenceSteps, colorAdjust, seed)

AI Image Extender
| Parameter | Type | Default |
|-----------|------|---------|
| boundingBox | bbox | null |
| prompt | custom | "" |
| negativePrompt | custom | "" |
| strength | float | 0.999 |
| guidanceScale | integer | 8 |
| numberOfInferenceSteps | integer | 10 |
| colorAdjust | boolean | false |
| seed | integer | 123 |

```dart
final t = Transformation.bgExtend(
        boundingBox: null,
        prompt: "",
        negativePrompt: "",
        strength: 0.999,
        guidanceScale: 8,
        numberOfInferenceSteps: 10,
        colorAdjust: false,
        seed: 123
        );
```

### VariationGenerator

#### 1. vgGenerate(generateVariationPrompt, noOfVariations, seed, autoscale)

AI Variation Generator
| Parameter | Type | Default |
|-----------|------|---------|
| generateVariationPrompt | custom | "" |
| noOfVariations | integer | 1 |
| seed | integer | 0 |
| autoscale | boolean | true |

```dart
final t = Transformation.vgGenerate(
        generateVariationPrompt: "",
        noOfVariations: 1,
        seed: 0,
        autoscale: true
        );
```

### EraseBG

#### 1. eraseBg(industryType, addShadow, refine)

EraseBG Background Removal Module
| Parameter | Type | Default |
|-----------|------|---------|
| industryType | enum`general`, `ecommerce`, `car`, `human`, `object` | EraseIndustryType.general |
| addShadow | boolean | false |
| refine | boolean | true |

```dart
final t = Transformation.eraseBg(
        industryType: EraseIndustryType.general,
        addShadow: false,
        refine: true
        );
```

### GoogleVisionPlugin

#### 1. googlevisDetectlabels(maximumLabels)

Detect content and text in images
| Parameter | Type | Default |
|-----------|------|---------|
| maximumLabels | integer | 5 |

```dart
final t = Transformation.googlevisDetectlabels(
        maximumLabels: 5
        );
```

### ImageCentering

#### 1. imcDetect(distancePercentage)

Image Centering Module
| Parameter | Type | Default |
|-----------|------|---------|
| distancePercentage | integer | 10 |

```dart
final t = Transformation.imcDetect(
        distancePercentage: 10
        );
```

### IntelligentCrop

#### 1. icCrop(requiredWidth, requiredHeight, paddingPercentage, maintainOriginalAspect, aspectRatio, gravityTowards, preferredDirection, objectType)

Intelligent Crop Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| requiredWidth | integer | 0 |
| requiredHeight | integer | 0 |
| paddingPercentage | integer | 0 |
| maintainOriginalAspect | boolean | false |
| aspectRatio | string | "" |
| gravityTowards | enum`object`, `foreground`, `face`, `none` | IcGravitytowards.none |
| preferredDirection | enum`north_west`, `north`, `north_east`, `west`, `center`, `east`, `south_west`, `south`, `south_east` | IcPreferreddirection.center |
| objectType | enum`airplane`, `apple`, `backpack`, `banana`, `baseball_bat`, `baseball_glove`, `bear`, `bed`, `bench`, `bicycle`, `bird`, `boat`, `book`, `bottle`, `bowl`, `broccoli`, `bus`, `cake`, `car`, `carrot`, `cat`, `cell_phone`, `chair`, `clock`, `couch`, `cow`, `cup`, `dining_table`, `dog`, `donut`, `elephant`, `fire_hydrant`, `fork`, `frisbee`, `giraffe`, `hair_drier`, `handbag`, `horse`, `hot_dog`, `keyboard`, `kite`, `knife`, `laptop`, `microwave`, `motorcycle`, `mouse`, `orange`, `oven`, `parking_meter`, `person`, `pizza`, `potted_plant`, `refrigerator`, `remote`, `sandwich`, `scissors`, `sheep`, `sink`, `skateboard`, `skis`, `snowboard`, `spoon`, `sports_ball`, `stop_sign`, `suitcase`, `surfboard`, `teddy_bear`, `tennis_racket`, `tie`, `toaster`, `toilet`, `toothbrush`, `traffic_light`, `train`, `truck`, `tv`, `umbrella`, `vase`, `wine_glass`, `zebra` | IcObjectType.person |

```dart
final t = Transformation.icCrop(
        requiredWidth: 0,
        requiredHeight: 0,
        paddingPercentage: 0,
        maintainOriginalAspect: false,
        aspectRatio: "",
        gravityTowards: IcGravitytowards.none,
        preferredDirection: IcPreferreddirection.center,
        objectType: IcObjectType.person
        );
```

### IntelligentMasking

#### 1. imMask(replacementImage, detector, maskType)

Intelligent Masking
| Parameter | Type | Default |
|-----------|------|---------|
| replacementImage | file | "" |
| detector | enum`face`, `text`, `number_plate` | ImDetector.numberPlate |
| maskType | enum`fill_black`, `pixelate`, `blur` | ImMaskType.fillBlack |

```dart
final t = Transformation.imMask(
        replacementImage: "",
        detector: ImDetector.numberPlate,
        maskType: ImMaskType.fillBlack
        );
```

### ObjectCounter

#### 1. ocDetect()

Classifies whether objects in the image are single or multiple

```dart
final t = Transformation.ocDetect(
        );
```

### NSFWDetection

#### 1. nsfwDetect(minimumConfidence)

Detect NSFW content in images
| Parameter | Type | Default |
|-----------|------|---------|
| minimumConfidence | float | 0.5 |

```dart
final t = Transformation.nsfwDetect(
        minimumConfidence: 0.5
        );
```

### NumberPlateDetection

#### 1. numplateDetect()

Number Plate Detection Plugin

```dart
final t = Transformation.numplateDetect(
        );
```

### ObjectDetection

#### 1. odDetect()

Detect bounding boxes of objects in the image

```dart
final t = Transformation.odDetect(
        );
```

### CheckObjectSize

#### 1. cosDetect(objectThresholdPercent)

Calculates the percentage of the main object area relative to image dimensions.
| Parameter | Type | Default |
|-----------|------|---------|
| objectThresholdPercent | integer | 50 |

```dart
final t = Transformation.cosDetect(
        objectThresholdPercent: 50
        );
```

### TextDetectionandRecognition

#### 1. ocrExtract(detectOnly)

OCR Module
| Parameter | Type | Default |
|-----------|------|---------|
| detectOnly | boolean | false |

```dart
final t = Transformation.ocrExtract(
        detectOnly: false
        );
```

### PdfWatermarkRemoval

#### 1. pwrRemove()

PDF Watermark Removal Plugin

```dart
final t = Transformation.pwrRemove(
        );
```

### ProductTagging

#### 1. prTag()

AI Product Tagging

```dart
final t = Transformation.prTag(
        );
```

### CheckProductVisibility

#### 1. cpvDetect()

Classifies whether the product in the image is completely visible or not

```dart
final t = Transformation.cpvDetect(
        );
```

### QRCode

#### 1. qrGenerate(width, height, image, margin, qRTypeNumber, qrErrorCorrectionLevel, imageSize, imageMargin, dotsColor, dotsType, dotsBgColor, cornerSquareColor, cornerSquareType, cornerDotsColor, cornerDotsType)

QRCode Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| width | integer | 300 |
| height | integer | 300 |
| image | custom | "" |
| margin | integer | 0 |
| qRTypeNumber | integer | 0 |
| qrErrorCorrectionLevel | enum`L`, `M`, `Q`, `H` | QrQrerrorcorrectionlevel.q |
| imageSize | float | 0.4 |
| imageMargin | integer | 0 |
| dotsColor | color | "000000" |
| dotsType | enum`rounded`, `dots`, `classy`, `classy-rounded`, `square`, `extra-rounded` | QrDotsType.square |
| dotsBgColor | color | "ffffff" |
| cornerSquareColor | color | "000000" |
| cornerSquareType | enum`dot`, `square`, `extra-rounded` | QrCornersquareType.square |
| cornerDotsColor | color | "000000" |
| cornerDotsType | enum`dot`, `square` | QrCornerdotsType.dot |

```dart
final t = Transformation.qrGenerate(
        width: 300,
        height: 300,
        image: "",
        margin: 0,
        qRTypeNumber: 0,
        qrErrorCorrectionLevel: QrQrerrorcorrectionlevel.q,
        imageSize: 0.4,
        imageMargin: 0,
        dotsColor: "000000",
        dotsType: QrDotsType.square,
        dotsBgColor: "ffffff",
        cornerSquareColor: "000000",
        cornerSquareType: QrCornersquareType.square,
        cornerDotsColor: "000000",
        cornerDotsType: QrCornerdotsType.dot
        );
```

#### 2. qrScan()

QRCode Plugin

```dart
final t = Transformation.qrScan(
        );
```

### RemoveBG

#### 1. removeBg()

Remove background from any image

```dart
final t = Transformation.removeBg(
        );
```

### SoftShadowGenerator

#### 1. shadowGen(backgroundImage, backgroundColor, shadowAngle, shadowIntensity)

AI Soft Shadow Generator
| Parameter | Type | Default |
|-----------|------|---------|
| backgroundImage | file | null |
| backgroundColor | color | "ffffff" |
| shadowAngle | float | 120 |
| shadowIntensity | float | 0.5 |

```dart
final t = Transformation.shadowGen(
        backgroundImage: null,
        backgroundColor: "ffffff",
        shadowAngle: 120,
        shadowIntensity: 0.5
        );
```

### SuperResolution

#### 1. srUpscale(type, enhanceFace, model, enhanceQuality)

Super Resolution Module
| Parameter | Type | Default |
|-----------|------|---------|
| type | enum`2x`, `4x`, `8x` | SrType.p2x |
| enhanceFace | boolean | false |
| model | enum`Picasso`, `Flash` | SrModel.picasso |
| enhanceQuality | boolean | false |

```dart
final t = Transformation.srUpscale(
        type: SrType.p2x,
        enhanceFace: false,
        model: SrModel.picasso,
        enhanceQuality: false
        );
```

### VertexAI

#### 1. vertexaiGeneratebg(backgroundPrompt, negativePrompt, seed, guidanceScale)

Vertex AI based transformations
| Parameter | Type | Default |
|-----------|------|---------|
| backgroundPrompt | custom | "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr" |
| negativePrompt | custom | "" |
| seed | integer | 22 |
| guidanceScale | integer | 60 |

```dart
final t = Transformation.vertexaiGeneratebg(
        backgroundPrompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
        negativePrompt: "",
        seed: 22,
        guidanceScale: 60
        );
```

#### 2. vertexaiRemovebg()

Vertex AI based transformations

```dart
final t = Transformation.vertexaiRemovebg(
        );
```

#### 3. vertexaiUpscale(type)

Vertex AI based transformations
| Parameter | Type | Default |
|-----------|------|---------|
| type | enum`x2`, `x4` | VertexaiType.x2 |

```dart
final t = Transformation.vertexaiUpscale(
        type: VertexaiType.x2
        );
```

### VideoWatermarkRemoval

#### 1. wmvRemove()

Video Watermark Removal Plugin

```dart
final t = Transformation.wmvRemove(
        );
```

### VideoUpscalerPlugin

#### 1. vsrUpscale()

Video Upscaler Plugin

```dart
final t = Transformation.vsrUpscale(
        );
```

### ViewDetection

#### 1. vdDetect()

Classifies wear type and view type of products in the image

```dart
final t = Transformation.vdDetect(
        );
```

### WatermarkRemoval

#### 1. wmRemove(removeText, removeLogo, box1, box2, box3, box4, box5)

Watermark Removal Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| removeText | boolean | false |
| removeLogo | boolean | false |
| box1 | string | "0_0_100_100" |
| box2 | string | "0_0_0_0" |
| box3 | string | "0_0_0_0" |
| box4 | string | "0_0_0_0" |
| box5 | string | "0_0_0_0" |

```dart
final t = Transformation.wmRemove(
        removeText: false,
        removeLogo: false,
        box1: "0_0_100_100",
        box2: "0_0_0_0",
        box3: "0_0_0_0",
        box4: "0_0_0_0",
        box5: "0_0_0_0"
        );
```

### WatermarkDetection

#### 1. wmcDetect(detectText)

Watermark Detection Plugin
| Parameter | Type | Default |
|-----------|------|---------|
| detectText | boolean | false |

```dart
final t = Transformation.wmcDetect(
        detectText: false
        );
```
