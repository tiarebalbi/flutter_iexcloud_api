library flutter_iexcloud_api;

import 'package:dio/dio.dart';
import 'package:flutter_iexcloud_api/src/iex_error_handler.dart';

import 'models/models.dart';

/// The IEX Cloud API is based on REST, has resource-oriented URLs, returns JSON-encoded responses,
/// and returns standard HTTP response codes.
///
/// @reference https://iexcloud.io/docs/api/
///
/// @author tiarebalbi
///
/// @version v1.0.0
class IEXClientApi {
  /// IEX Cloud authenticates your API requests using your account’s API tokens.
  /// To use any IEX Cloud API, you must pass an API token with each request.
  /// If you do not include your API token when making an API request,
  /// or use one that is incorrect or disabled, IEX Cloud returns an error.
  final String token;

  /// IEX API Version
  final ApiVersion apiVersion;

  /// IEX Base URL
  final String baseUrl;

  /// Connection Timeout to be used by the API requests
  final int connectTimeout;

  /// Send Timeout to be used by the API requests
  final int sendTimeout;

  /// Receive Timeout to be used by the API requests
  final int receiveTimeout;

  /// DIO Client instance used to send all requests
  late final Dio dio = Dio(BaseOptions(
    baseUrl: '$baseUrl/${apiVersion.name}',
    connectTimeout: Duration(milliseconds: connectTimeout),
    sendTimeout: Duration(milliseconds: sendTimeout),
    receiveTimeout: Duration(milliseconds: receiveTimeout),
  ));

  /// Constructor
  IEXClientApi({
    required this.token,
    this.apiVersion = ApiVersion.stable,
    this.baseUrl = 'https://cloud.iexapis.com',
    this.connectTimeout = 5000,
    this.sendTimeout = 3000,
    this.receiveTimeout = 3000,
  });

  /// API System Metadata
  /// Status
  Future<Status?> status() async {
    return await _get('/status', callback: (data) => Status.parse(data));
  }

  /// Symbols
  /// This refdata endpoint returns the list of symbols that IEX Cloud supports for intraday price updates.
  Future<List<MarketSymbol>> symbols(String? format) async {
    final optionalFormat = format != null ? '&format=$format' : '';
    final path = '/ref-data/symbols?token=$token$optionalFormat$optionalFormat';
    return await _get<List<MarketSymbol>>(
          path,
          callback: (data) => MarketSymbol.parse(data),
        ) ??
        [];
  }

  /// Cryptocurrency
  /// Cryptocurrency Book
  Future<CryptoBook?> cryptocurrencyBook(String symbol) async {
    final path = '/crypto/${symbol.toLowerCase()}/book?token=$token';
    return await _get<CryptoBook?>(
      path,
      callback: (data) => CryptoBook.parse(data),
    );
  }

  /// Cryptocurrency Price
  Future<CryptoPrice?> cryptocurrencyPrice(String symbol) async {
    final path = '/crypto/${symbol.toLowerCase()}/price?token=$token';
    return await _get<CryptoPrice?>(
      path,
      callback: (data) => CryptoPrice.parse(data),
    );
  }

  /// Cryptocurrency Events
  /// NOT SUPPORT IN MVP VERSION (1.0.0), REST SUPPORT ONLY

  // Cryptocurrency Quote
  Future<CryptoQuote?> cryptocurrencyQuote(String symbol) async {
    final path = '/crypto/${symbol.toLowerCase()}/quote?token=$token';
    return await _get<CryptoQuote?>(
      path,
      callback: (data) => CryptoQuote.parse(data),
    );
  }

  /// Add a new interceptor to be executed against all requests
  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  /// Remove all interceptors
  void clearInterceptors() {
    dio.interceptors.clear();
  }

  /// Send GET Request
  Future<T?> _get<T>(String path, {required Function callback}) async {
    try {
      final response = await dio.get<Map<String, dynamic>?>(path);
      return callback(response.data);
    } on DioException catch (e) {
      final errorMessage = IEXErrorHandler.from(e);
      throw Exception(errorMessage);
    }
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
