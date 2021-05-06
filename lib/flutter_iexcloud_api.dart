library flutter_iexcloud_api;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'models/crypto_price.dart';

/// The IEX Cloud API is based on REST, has resource-oriented URLs, returns JSON-encoded responses,
/// and returns standard HTTP response codes.
///
/// @reference https://iexcloud.io/docs/api/
///
/// @author tiarebalbi
/// @version v1.0.0
class IEXDataService {
  /// IEX Cloud authenticates your API requests using your account’s API tokens.
  /// To use any IEX Cloud API, you must pass an API token with each request.
  /// If you do not include your API token when making an API request,
  /// or use one that is incorrect or disabled, IEX Cloud returns an error.
  final String token;
  final ApiVersion apiVersion;
  final String baseUrl;
  final int connectTimeout;
  final int receiveTimeout;

  late final Dio dio = Dio(BaseOptions(
    baseUrl: "${this.baseUrl}/${describeEnum(this.apiVersion)}",
    connectTimeout: this.connectTimeout,
    receiveTimeout: this.receiveTimeout,
  ));

  IEXDataService({
    required this.token,
    this.apiVersion = ApiVersion.stable,
    this.baseUrl = "https://cloud.iexapis.com",
    this.connectTimeout: 5000,
    this.receiveTimeout: 3000,
  });

  /// This returns the price for a specified cryptocurrency.
  Future<CryptoPrice?> cryptocurrencyPrice(String symbol) async {
    try {
      final path = "/crypto/${symbol.toLowerCase()}/price?token=${this.token}";
      final response = await this.dio.get<Map<String, dynamic>?>(path);
      return CryptoPrice.parse(response.data);
    } on DioError catch (e) {
      print(e);
      _callErrorHandler(e);
    }
  }

  void addInterceptor(Interceptor interceptor) {
    this.dio.interceptors.add(interceptor);
  }

  void clearInterceptors() {
    this.dio.interceptors.clear();
  }

  void _callErrorHandler(Object e) {
    // TODO Implement error handling
  }
}

/// IEX Cloud will release new versions when we make backwards-incompatible changes to the API.
/// To support up to three active versions and will give advanced notice
/// before releasing a new version or retiring an old version.
enum ApiVersion {
  stable,
  v1,
  beta,
}
