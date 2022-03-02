import 'package:get/get.dart';

import 'storage.dart';

class InitialBinding implements Bindings {

  InitialBinding();
  @override
  void dependencies() {
    // Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
    Get.put<Storage>(StorageImpl(),permanent: true);


  }
}
