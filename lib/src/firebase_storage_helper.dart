import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageHelper {
  static bool isGsUrl(String url) {
    return url.startsWith('gs://');
  }

  // get firebase reference
  static Reference getRefFromGsUrl(String gsUrl) {
    Uri uri = Uri.parse(gsUrl);
    String bucketName = '${uri.scheme}://${uri.authority}';
    FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: bucketName);
    return storage.ref().child(uri.path);
  }

  // get download url
  static Future<String> getStandardUrlFromGsUrl(String gsUrl) async {
    Uri uri = Uri.parse(gsUrl);
    String bucketName = '${uri.scheme}://${uri.authority}';
    FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: bucketName);
    return await storage.ref().child(uri.path).getDownloadURL();
  }
}
