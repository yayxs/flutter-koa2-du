import 'package:dio/dio.dart';

void getHttp() async {
  try {
    Response response = await Dio().get(
        "http://rap2api.taobao.org/app/mock/236998/isolated/island/api/v1/test");
    print('后台返回的结果是 ${response}');
  } catch (e) {
    print(e);
  }
}
