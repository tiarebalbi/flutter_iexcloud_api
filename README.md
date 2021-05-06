# flutter_iexcloud_api
[![Pub](https://img.shields.io/pub/v/flutter_iexcloud_api.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_iexcloud_api)
[![support](https://img.shields.io/badge/platform-flutter%7Cflutter%20web%7Cdart%20vm-ff69b4.svg?style=flat-square)](https://github.com/tiarebalbi/flutter_iexcloud_api)

_Work in progress, Only REST Requests are supported_

The IEX Cloud API client based on REST, has resource-oriented URLs, returns JSON-encoded responses, and returns standard HTTP response codes.

**Note:**
IEX Cloud authenticates your API requests using your account’s API tokens. To use any IEX Cloud API, you must pass an API token with each request. If you do not include your API token when making an API request, or use one that is incorrect or disabled, IEX Cloud returns an error.

For more details [click here](https://iexcloud.io/)

## Get started

### Add dependency

```yaml
dependencies:
  flutter_iexcloud_api: ^1.0.0
```

### Super simple to use

```dart
import 'package:flutter_iexcloud_api/flutter_iexcloud_api.dart';

late final IEXDataService service = IEXDataService(
  token: "<Your Token>",
);

final response = await service.cryptocurrencyPrice("btcbusd");
```

### Configuration

property             | description                               | default
---------------------|-------------------------------------------|----------------------------
token                | (required) API Token provided by [iexcloud](https://iexcloud.io/docs/api/#api-versioning) | -
apiVersion           | (required) [iexcloud](https://iexcloud.io/docs/api/#api-versioning) API Version | stable (see: ApiVersion)
connectTimeout       | It occurs when url is opened timeout.    | 5000
sendTimeout          | It occurs when url is sent timeout.      | 30000
receiveTimeout       | It occurs when receiving timeout.        | 30000

### Interceptors

For each client instance, We can add one or more interceptors, by which we can intercept requests, responses and errors before they are handled by then or 
catchError.

#### Simple interceptor example:

```dart
import 'package:dio/dio.dart';
class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }
  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
    return super.onResponse(response, handler);
  }
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.request.path}');
    return super.onError(err, handler);
  }
}
```
#### Registering the Interceptor

```dart
late final IEXClientApi service = IEXDataService(
  token: "<Your Token>",
);
service.addInterceptor(CustomInterceptors());
```
#### Cleaning all interceptors

```dart
late final IEXClientApi service = IEXDataService(
  token: "<Your Token>",
);
service.clearInterceptors();
```

For more details on how to use Interceptor, please check [dio plugin page](https://github.com/flutterchina/dio/blob/master/README.md#interceptors)


## Copyright & License

This open source project implemented by [Tiarê Balbi Bonamini](https://tiarebalbi.com) , and the license is MIT. [Data provided by IEX Cloud](https://iexcloud.io)


## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/tiarebalbi/flutter_iexcloud_api/issues


