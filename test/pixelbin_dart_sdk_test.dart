import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pixelbin/pixelbin_dart_sdk.dart';

void main() {
  test('PixelBinImage Tests', () {


    const url =
        "https://cdn.pixelbin.io/v2/dummy-cloudname/wmc.detect(detect_text:true)~pr.tag()~shadow.gen()~vg.generate()~cpv.detect()~t.density()~t.compress()~t.extend()~t.merge(m:underlay,h:5745)/__playground/playground-default.jpeg";
    final image0 = PixelBin.shared.imageFromUrl(url);

    assert(image0 != null);
    expect(image0!.cloudName, "dummy-cloudname");
    expect(image0.imagePath, "__playground/playground-default.jpeg");
    expect(image0.zone, null);
    expect(image0.encoded, url);

    final image1 = PixelBin.shared.image(
        cloud: image0.cloudName,
        imagePath: image0.imagePath,
        zone: image0.zone,
        host: image0.host,
        transformations: List.from(image0.transformations),
        version: image0.version,
        worker: image0.worker);

    expect(image1.encoded, image0.encoded);

    image0.addTransformation(TransformationData(
        plugin: "plugin", name: "apply", values: {"a": 1, "b": 2}));
    image1.addTransformation(TransformationData(
        plugin: "plugin", name: "apply", values: {"a": 1, "b": 2}));

    expect(image1.encoded, image0.encoded);

    // Printing PixelBin Image URL
    print("1. ${image0.encoded}");
    print("2. ${image1.encoded}");
  });

  test('PixelBinImage Upload', () async {
    const url =
        "https://api.pixelbin.io/service/public/assets/v1.0/signed-multipart?pbs=ce93661de79e95874d091cd12b0979f123f1370c50e1bb7488d66cf11d78e387&pbe=1718713736060&pbt=702bc431-13b8-44a2-9e14-e4ea601fcfd1&pbo=5332574&pbu=bc7ea111-8c55-4eb3-a4c6-7516f8131a68";
    const fields = {
      "x-pixb-meta-assetdata": "{\"orgId\":5332574,\"type\":\"file\",\"name\":\"landscape.jpeg\",\"path\":\"backup\",\"fileId\":\"backup/landscape.jpeg\",\"format\":\"jpeg\",\"s3Bucket\":\"erase-erase-erasebg-assets\",\"s3Key\":\"uploads/dipendra-cloud1/original/6a91ba67-5b4b-4107-8ecd-4928c0ed7c5a.jpeg\",\"access\":\"public-read\",\"tags\":[\"landscape\",\"river\",\"mountains\"],\"metadata\":{\"source\":\"signedUrl\",\"publicUploadId\":\"bc7ea111-8c55-4eb3-a4c6-7516f8131a68\"},\"overwrite\":false,\"filenameOverride\":true}"
    };
    final file = File("assets/landscape.jpeg");

    final signedDetails = SignedDetails(url: url, fields: fields);

    final response =
        await PixelBin.shared.upload(file: file, signedDetails: signedDetails, concurrency: 2, chunkSize: 100);
    print("Image: ${response?.encoded}");
  });
}
