# Pixelbin
Pixelbin Dart library helps you integrate Pixelbin with your Dart/Flutter Application.
## Usage
### Install using [Pub Package Manager](https://pub.dev/)
**Run this command:**
- With Dart:
```dart
dart pub add pixelbin
```
- With Flutter:
```dart
flutter pub add pixelbin
```
**OR**
- This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):
```dart
dependencies:
  pixelbin: ^latest_release_version
```
### Creating Image from URL or Cloud details
```dart
import 'package:pixelbin/pixelbin_dart_sdk.dart';
final PixelBinImage? imageFromUrl = PixelBin.shared.imageFromUrl(
        "https://cdn.pixelbin.io/v2/dummy-cloudname/erase.bg(shadow:false,r:true,i:general)~af.remove()~t.blur(s:0.3,dpr:1.0)/__playground/playground-default.jpeg");
debugPrint(imageFromUrl?.encoded);
// Create Image url from cloud, zone and other details
final PixelBinImage imageFromDetails = pixelBin.image(
          imagePath: imageFromUrl.imagePath, cloud: imageFromUrl.cloudName, transformations: imageFromUrl.transformations, version: imageFromUrl.version);
debugPrint(imageFromDetails.encoded);
```
---
### Applying Transformations and Getting Transformations
```dart
import 'package:pixelbin/pixelbin_dart_sdk.dart';
// Create Image url from cloud, zone and imagePath on cloud (Not local path)
final image = PixelBin.shared.image(imagePath: "example/logo/apple.jpg", cloud: "apple_cloud", zone: "south_asia");
      debugPrint(imageFromDetails.encoded); // https://cdn.pixelbin.io/v2/apple_cloud/south_asia/original/example/logo/apple.jpg
final eraseTransformation = Transformation.erasebg(); // Creating Erasebg Transformation
final resizeTransformation = Transformation.tResize(height: 200, width: 200); // Creating Resize Transformation
image.addTransformations([eraseTransformation, resizeTransformation]); // Applying multiple transformations with list(keep passing all transformations in list)
// OR
image.addTransformation(eraseTransformation);
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

```swift
let t = Transformation.dbtDetect(

)
```


### Artifact

#### 1. afRemove()
Artifact Removal Plugin

```swift
let t = Transformation.afRemove(

)
```


### AWSRekognitionPlugin

#### 1. awsrekDetectlabels(maximumLabels, minimumConfidence)
Detect objects and text in images

| Parameter | Type | Default |
|-----------|------|---------|
| maximumLabels | integer | `5` |
| minimumConfidence | integer | `55` |


```swift
let t = Transformation.awsrekDetectlabels(
    maximumLabels: "5",
    minimumConfidence: "55"
)
```

#### 2. awsrekModeration(minimumConfidence)
Detect objects and text in images

| Parameter | Type | Default |
|-----------|------|---------|
| minimumConfidence | integer | `55` |


```swift
let t = Transformation.awsrekModeration(
    minimumConfidence: "55"
)
```


### BackgroundGenerator

#### 1. generateBg(backgroundPrompt, focus, negativePrompt, seed)
AI Background Generator

| Parameter | Type | Default |
|-----------|------|---------|
| backgroundPrompt | custom | `YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr` |
| focus | enum: `Product`, `Background` | `Product` |
| negativePrompt | custom | N/A |
| seed | integer | `123` |


```swift
let t = Transformation.generateBg(
    backgroundPrompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
    focus: "Product",
    negativePrompt: "",
    seed: "123"
)
```


### VariationGenerator

#### 1. vgGenerate(generateVariationPrompt, noOfVariations, seed, autoscale)
AI Variation Generator

| Parameter | Type | Default |
|-----------|------|---------|
| generateVariationPrompt | custom | N/A |
| noOfVariations | integer | `1` |
| seed | integer | N/A |
| autoscale | boolean | `true` |


```swift
let t = Transformation.vgGenerate(
    generateVariationPrompt: "",
    noOfVariations: "1",
    seed: "",
    autoscale: "true"
)
```


### EraseBG

#### 1. eraseBg(industryType, addShadow, refine)
EraseBG Background Removal Module

| Parameter | Type | Default |
|-----------|------|---------|
| industryType | enum: `general`, `ecommerce`, `car`, `human`, `object` | `general` |
| addShadow | boolean | N/A |
| refine | boolean | `true` |


```swift
let t = Transformation.eraseBg(
    industryType: "general",
    addShadow: "",
    refine: "true"
)
```


### GoogleVisionPlugin

#### 1. googlevisDetectlabels(maximumLabels)
Detect content and text in images

| Parameter | Type | Default |
|-----------|------|---------|
| maximumLabels | integer | `5` |


```swift
let t = Transformation.googlevisDetectlabels(
    maximumLabels: "5"
)
```


### ImageCentering

#### 1. imcDetect(distancePercentage)
Image Centering Module

| Parameter | Type | Default |
|-----------|------|---------|
| distancePercentage | integer | `10` |


```swift
let t = Transformation.imcDetect(
    distancePercentage: "10"
)
```


### IntelligentCrop

#### 1. icCrop(requiredWidth, requiredHeight, paddingPercentage, maintainOriginalAspect, aspectRatio, gravityTowards, preferredDirection, objectType)
Intelligent Crop Plugin

| Parameter | Type | Default |
|-----------|------|---------|
| requiredWidth | integer | N/A |
| requiredHeight | integer | N/A |
| paddingPercentage | integer | N/A |
| maintainOriginalAspect | boolean | N/A |
| aspectRatio | string | N/A |
| gravityTowards | enum: `object`, `foreground`, `face`, `none` | `none` |
| preferredDirection | enum: `north_west`, `north`, `north_east`, `west`, `center`, `east`, `south_west`, `south`, `south_east` | `center` |
| objectType | enum: `airplane`, `apple`, `backpack`, `banana`, `baseball_bat`, `baseball_glove`, `bear`, `bed`, `bench`, `bicycle`, `bird`, `boat`, `book`, `bottle`, `bowl`, `broccoli`, `bus`, `cake`, `car`, `carrot`, `cat`, `cell_phone`, `chair`, `clock`, `couch`, `cow`, `cup`, `dining_table`, `dog`, `donut`, `elephant`, `fire_hydrant`, `fork`, `frisbee`, `giraffe`, `hair_drier`, `handbag`, `horse`, `hot_dog`, `keyboard`, `kite`, `knife`, `laptop`, `microwave`, `motorcycle`, `mouse`, `orange`, `oven`, `parking_meter`, `person`, `pizza`, `potted_plant`, `refrigerator`, `remote`, `sandwich`, `scissors`, `sheep`, `sink`, `skateboard`, `skis`, `snowboard`, `spoon`, `sports_ball`, `stop_sign`, `suitcase`, `surfboard`, `teddy_bear`, `tennis_racket`, `tie`, `toaster`, `toilet`, `toothbrush`, `traffic_light`, `train`, `truck`, `tv`, `umbrella`, `vase`, `wine_glass`, `zebra` | `person` |


```swift
let t = Transformation.icCrop(
    requiredWidth: "",
    requiredHeight: "",
    paddingPercentage: "",
    maintainOriginalAspect: "",
    aspectRatio: "",
    gravityTowards: "none",
    preferredDirection: "center",
    objectType: "person"
)
```


### ObjectCounter

#### 1. ocDetect()
Classifies whether objects in the image are single or multiple

```swift
let t = Transformation.ocDetect(

)
```


### NSFWDetection

#### 1. nsfwDetect(minimumConfidence)
Detect NSFW content in images

| Parameter | Type | Default |
|-----------|------|---------|
| minimumConfidence | float | `0.5` |


```swift
let t = Transformation.nsfwDetect(
    minimumConfidence: "0.5"
)
```


### NumberPlateDetection

#### 1. numplateDetect()
Number Plate Detection Plugin

```swift
let t = Transformation.numplateDetect(

)
```


### ObjectDetection

#### 1. odDetect()
Detect bounding boxes of objects in the image

```swift
let t = Transformation.odDetect(

)
```


### CheckObjectSize

#### 1. cosDetect(objectThresholdPercent)
Calculates the percentage of the main object area relative to image dimensions.

| Parameter | Type | Default |
|-----------|------|---------|
| objectThresholdPercent | integer | `50` |


```swift
let t = Transformation.cosDetect(
    objectThresholdPercent: "50"
)
```


### TextDetectionandRecognition

#### 1. ocrExtract(detectOnly)
OCR Module

| Parameter | Type | Default |
|-----------|------|---------|
| detectOnly | boolean | N/A |


```swift
let t = Transformation.ocrExtract(
    detectOnly: ""
)
```


### PdfWatermarkRemoval

#### 1. pwrRemove()
PDF Watermark Removal Plugin

```swift
let t = Transformation.pwrRemove(

)
```


### ProductTagging

#### 1. prTag()
AI Product Tagging

```swift
let t = Transformation.prTag(

)
```


### CheckProductVisibility

#### 1. cpvDetect()
Classifies whether the product in the image is completely visible or not

```swift
let t = Transformation.cpvDetect(

)
```


### QRCode

#### 1. qrGenerate(width, height, image, margin, qRTypeNumber, qrErrorCorrectionLevel, imageSize, imageMargin, dotsColor, dotsType, dotsBgColor, cornerSquareColor, cornerSquareType, cornerDotsColor, cornerDotsType)
QRCode Plugin

| Parameter | Type | Default |
|-----------|------|---------|
| width | integer | `300` |
| height | integer | `300` |
| image | custom | N/A |
| margin | integer | N/A |
| qRTypeNumber | integer | N/A |
| qrErrorCorrectionLevel | enum: `L`, `M`, `Q`, `H` | `Q` |
| imageSize | float | `0.4` |
| imageMargin | integer | N/A |
| dotsColor | color | `000000` |
| dotsType | enum: `rounded`, `dots`, `classy`, `classy-rounded`, `square`, `extra-rounded` | `square` |
| dotsBgColor | color | `ffffff` |
| cornerSquareColor | color | `000000` |
| cornerSquareType | enum: `dot`, `square`, `extra-rounded` | `square` |
| cornerDotsColor | color | `000000` |
| cornerDotsType | enum: `dot`, `square` | `dot` |


```swift
let t = Transformation.qrGenerate(
    width: "300",
    height: "300",
    image: "",
    margin: "",
    qRTypeNumber: "",
    qrErrorCorrectionLevel: "Q",
    imageSize: "0.4",
    imageMargin: "",
    dotsColor: "000000",
    dotsType: "square",
    dotsBgColor: "ffffff",
    cornerSquareColor: "000000",
    cornerSquareType: "square",
    cornerDotsColor: "000000",
    cornerDotsType: "dot"
)
```

#### 2. qrScan()
QRCode Plugin

```swift
let t = Transformation.qrScan(

)
```


### RemoveBG

#### 1. removeBg()
Remove background from any image

```swift
let t = Transformation.removeBg(

)
```


### Basic

#### 1. tResize(height, width, fit, background, position, algorithm, dpr)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| height | integer | N/A |
| width | integer | N/A |
| fit | enum: `cover`, `contain`, `fill`, `inside`, `outside` | `cover` |
| background | color | `000000` |
| position | enum: `top`, `bottom`, `left`, `right`, `right_top`, `right_bottom`, `left_top`, `left_bottom`, `center` | `center` |
| algorithm | enum: `nearest`, `cubic`, `mitchell`, `lanczos2`, `lanczos3` | `lanczos3` |
| dpr | float | `1` |


```swift
let t = Transformation.tResize(
    height: "",
    width: "",
    fit: "cover",
    background: "000000",
    position: "center",
    algorithm: "lanczos3",
    dpr: "1"
)
```

#### 2. tCompress(quality)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| quality | integer | `80` |


```swift
let t = Transformation.tCompress(
    quality: "80"
)
```

#### 3. tExtend(top, left, bottom, right, background, borderType, dpr)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| top | integer | `10` |
| left | integer | `10` |
| bottom | integer | `10` |
| right | integer | `10` |
| background | color | `000000` |
| borderType | enum: `constant`, `replicate`, `reflect`, `wrap` | `constant` |
| dpr | float | `1` |


```swift
let t = Transformation.tExtend(
    top: "10",
    left: "10",
    bottom: "10",
    right: "10",
    background: "000000",
    borderType: "constant",
    dpr: "1"
)
```

#### 4. tExtract(top, left, height, width, boundingBox)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| top | integer | `10` |
| left | integer | `10` |
| height | integer | `50` |
| width | integer | `20` |
| boundingBox | bbox | N/A |


```swift
let t = Transformation.tExtract(
    top: "10",
    left: "10",
    height: "50",
    width: "20",
    boundingBox: ""
)
```

#### 5. tTrim(threshold)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| threshold | integer | `10` |


```swift
let t = Transformation.tTrim(
    threshold: "10"
)
```

#### 6. tRotate(angle, background)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| angle | integer | N/A |
| background | color | `000000` |


```swift
let t = Transformation.tRotate(
    angle: "",
    background: "000000"
)
```

#### 7. tFlip()
Basic Transformations

```swift
let t = Transformation.tFlip(

)
```

#### 8. tFlop()
Basic Transformations

```swift
let t = Transformation.tFlop(

)
```

#### 9. tSharpen(sigma)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| sigma | float | `1.5` |


```swift
let t = Transformation.tSharpen(
    sigma: "1.5"
)
```

#### 10. tMedian(size)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| size | integer | `3` |


```swift
let t = Transformation.tMedian(
    size: "3"
)
```

#### 11. tBlur(sigma, dpr)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| sigma | float | `0.3` |
| dpr | float | `1` |


```swift
let t = Transformation.tBlur(
    sigma: "0.3",
    dpr: "1"
)
```

#### 12. tFlatten(background)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| background | color | `000000` |


```swift
let t = Transformation.tFlatten(
    background: "000000"
)
```

#### 13. tNegate()
Basic Transformations

```swift
let t = Transformation.tNegate(

)
```

#### 14. tNormalise()
Basic Transformations

```swift
let t = Transformation.tNormalise(

)
```

#### 15. tLinear(a, b)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| a | integer | `1` |
| b | integer | N/A |


```swift
let t = Transformation.tLinear(
    a: "1",
    b: ""
)
```

#### 16. tModulate(brightness, saturation, hue)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| brightness | float | `1` |
| saturation | float | `1` |
| hue | integer | `90` |


```swift
let t = Transformation.tModulate(
    brightness: "1",
    saturation: "1",
    hue: "90"
)
```

#### 17. tGrey()
Basic Transformations

```swift
let t = Transformation.tGrey(

)
```

#### 18. tTint(color)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| color | color | `000000` |


```swift
let t = Transformation.tTint(
    color: "000000"
)
```

#### 19. tToformat(format, quality)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| format | enum: `jpeg`, `png`, `webp`, `tiff`, `avif`, `bmp`, `heif` | `jpeg` |
| quality | integer | `75` |


```swift
let t = Transformation.tToformat(
    format: "jpeg",
    quality: "75"
)
```

#### 20. tDensity(density)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| density | integer | `300` |


```swift
let t = Transformation.tDensity(
    density: "300"
)
```

#### 21. tMerge(mode, image, transformation, background, height, width, top, left, gravity, blend, tile, listOfBboxes, listOfPolygons)
Basic Transformations

| Parameter | Type | Default |
|-----------|------|---------|
| mode | enum: `overlay`, `underlay`, `wrap` | `overlay` |
| image | file | N/A |
| transformation | custom | N/A |
| background | color | `00000000` |
| height | integer | N/A |
| width | integer | N/A |
| top | integer | N/A |
| left | integer | N/A |
| gravity | enum: `northwest`, `north`, `northeast`, `east`, `center`, `west`, `southwest`, `south`, `southeast`, `custom` | `center` |
| blend | enum: `over`, `in`, `out`, `atop`, `dest`, `dest-over`, `dest-in`, `dest-out`, `dest-atop`, `xor`, `add`, `saturate`, `multiply`, `screen`, `overlay`, `darken`, `lighten`, `colour-dodge`, `color-dodge`, `colour-burn`, `color-burn`, `hard-light`, `soft-light`, `difference`, `exclusion` | `over` |
| tile | boolean | N/A |
| listOfBboxes | bboxList | N/A |
| listOfPolygons | polygonList | N/A |


```swift
let t = Transformation.tMerge(
    mode: "overlay",
    image: "",
    transformation: "",
    background: "00000000",
    height: "",
    width: "",
    top: "",
    left: "",
    gravity: "center",
    blend: "over",
    tile: "",
    listOfBboxes: "",
    listOfPolygons: ""
)
```


### SoftShadowGenerator

#### 1. shadowGen(backgroundImage, backgroundColor, shadowAngle, shadowIntensity)
AI Soft Shadow Generator

| Parameter | Type | Default |
|-----------|------|---------|
| backgroundImage | file | N/A |
| backgroundColor | color | `ffffff` |
| shadowAngle | float | `120` |
| shadowIntensity | float | `0.5` |


```swift
let t = Transformation.shadowGen(
    backgroundImage: "",
    backgroundColor: "ffffff",
    shadowAngle: "120",
    shadowIntensity: "0.5"
)
```


### SuperResolution

#### 1. srUpscale(type, enhanceFace, model, enhanceQuality)
Super Resolution Module

| Parameter | Type | Default |
|-----------|------|---------|
| type | enum: `2x`, `4x`, `8x` | `2x` |
| enhanceFace | boolean | N/A |
| model | enum: `Picasso`, `Flash` | `Picasso` |
| enhanceQuality | boolean | N/A |


```swift
let t = Transformation.srUpscale(
    type: "2x",
    enhanceFace: "",
    model: "Picasso",
    enhanceQuality: ""
)
```


### VertexAI

#### 1. vertexaiGeneratebg(backgroundPrompt, negativePrompt, seed, guidanceScale)
Vertex AI based transformations

| Parameter | Type | Default |
|-----------|------|---------|
| backgroundPrompt | custom | `YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr` |
| negativePrompt | custom | N/A |
| seed | integer | `22` |
| guidanceScale | integer | `60` |


```swift
let t = Transformation.vertexaiGeneratebg(
    backgroundPrompt: "YSBmb3Jlc3QgZnVsbCBvZiBvYWsgdHJlZXMsd2l0aCBicmlnaHQgbGlnaHRzLCBzdW4gYW5kIGEgbG90IG9mIG1hZ2ljLCB1bHRyYSByZWFsaXN0aWMsIDhr",
    negativePrompt: "",
    seed: "22",
    guidanceScale: "60"
)
```

#### 2. vertexaiRemovebg()
Vertex AI based transformations

```swift
let t = Transformation.vertexaiRemovebg(

)
```

#### 3. vertexaiUpscale(type)
Vertex AI based transformations

| Parameter | Type | Default |
|-----------|------|---------|
| type | enum: `x2`, `x4` | `x2` |


```swift
let t = Transformation.vertexaiUpscale(
    type: "x2"
)
```


### VideoWatermarkRemoval

#### 1. wmvRemove()
Video Watermark Removal Plugin

```swift
let t = Transformation.wmvRemove(

)
```


### ViewDetection

#### 1. vdDetect()
Classifies wear type and view type of products in the image

```swift
let t = Transformation.vdDetect(

)
```


### WatermarkRemoval

#### 1. wmRemove(removeText, removeLogo, box1, box2, box3, box4, box5)
Watermark Removal Plugin

| Parameter | Type | Default |
|-----------|------|---------|
| removeText | boolean | N/A |
| removeLogo | boolean | N/A |
| box1 | string | `0_0_100_100` |
| box2 | string | `0_0_0_0` |
| box3 | string | `0_0_0_0` |
| box4 | string | `0_0_0_0` |
| box5 | string | `0_0_0_0` |


```swift
let t = Transformation.wmRemove(
    removeText: "",
    removeLogo: "",
    box1: "0_0_100_100",
    box2: "0_0_0_0",
    box3: "0_0_0_0",
    box4: "0_0_0_0",
    box5: "0_0_0_0"
)
```


### WatermarkDetection

#### 1. wmcDetect(detectText)
Watermark Detection Plugin

| Parameter | Type | Default |
|-----------|------|---------|
| detectText | boolean | N/A |


```swift
let t = Transformation.wmcDetect(
    detectText: ""
)
```


