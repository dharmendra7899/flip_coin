import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flip_coin/app/core/network/network_service.dart';
import 'package:flip_coin/app/core/utils/preferences.dart';

import 'network_exception.dart';
import 'network_models/network_response_model.dart';

class DioNetworkServiceImpl implements NetworkService {
  late Dio _dio;
  final SharedPreferencesSessionManager _sessionManager;

  // Private constructor
  DioNetworkServiceImpl._internal(
      {required SharedPreferencesSessionManager sessionManager,
        Map<String, dynamic>? defaultHeaders})
      : _sessionManager = sessionManager {
    defaultHeaders ??= {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    BaseOptions options = BaseOptions(
      headers: defaultHeaders,
    );

    _dio = Dio(options);

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
  }

  // Singleton instance
  static DioNetworkServiceImpl? _instance;

  // Factory constructor
  factory DioNetworkServiceImpl(
      {required String baseUrl,
        required SharedPreferencesSessionManager sessionManager,
        Map<String, dynamic>? defaultHeaders}) {
    _instance ??= DioNetworkServiceImpl._internal(
        sessionManager: sessionManager, defaultHeaders: defaultHeaders);

    _instance!._dio.options.baseUrl = baseUrl;
    _instance!._dio.options.headers.addAll(defaultHeaders ?? {});

    return _instance!;
  }

  NetworkResponseModel _buildNetworkResponseModel(Response response) {
    return NetworkResponseModel(
      requestOptions: response.requestOptions,
      data: response.data,
      extra: response.extra,
      headers: response.headers,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  @override
  Future<NetworkResponseModel> delete(String url,
      {data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers}) async {
    headers ??= {};
    final accessToken = _sessionManager.getSession();
    if (accessToken != null) {
      headers["Authorization"] = "Bearer $accessToken";
    }
    try {
      Response response = await _dio.delete(
        url,
        queryParameters: queryParameters,
        data: data,
        options: Options(headers: headers),
      );
      return _buildNetworkResponseModel(response);
    } on DioException catch (e) {
      throw NetworkServiceException(
        message: e.message.toString(),
        statusCode: e.response?.statusCode ?? 0,
        responseData: e.response?.data,
      );
    } catch (e) {
      throw NetworkServiceException(message: e.toString());
    }
  }

  @override
  Future<NetworkResponseModel> uploadImage(
      String url, {
        required File imageFile,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async
  {
    headers ??= {};
    final userSession = _sessionManager.getSession();
    if (userSession != null) {
      headers["Authorization"] = "token";
    }

    try {
      // Create FormData for multipart request
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
        if (data != null) ...data, // Include additional form data if any
      });

      // Perform the POST request with multipart data
      Response response = await _dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return _buildNetworkResponseModel(response);
    } on DioException catch (e) {
      throw NetworkServiceException(
        message: e.message.toString(),
        statusCode: e.response?.statusCode,
        responseData: e.response?.data,
      );
    } catch (e) {
      throw NetworkServiceException(message: e.toString());
    }
  }

  @override
  Future<NetworkResponseModel> get(String url, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponseModel> patch(String url, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponseModel> post(String url, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponseModel> put(String url, {data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
