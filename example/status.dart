import 'package:flutter_iexcloud_api/flutter_iexcloud_api.dart';

void main(List<String> args) async {
  final service = IEXClientApi(
    token: '', // YOUR TOKEN
    apiVersion: ApiVersion.stable,
  );

  final result = await service.status();

  print('Service is ${result?.status}');
}
