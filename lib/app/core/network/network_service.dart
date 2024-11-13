import 'dart:io';
import 'package:flip_coin/app/core/network/network_models/network_response_model.dart';

abstract class NetworkService {
  /// Performs a GET request
  Future<NetworkResponseModel> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      });

  /// Performs a POST request
  Future<NetworkResponseModel> post(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      });

  /// Performs a PUT request
  Future<NetworkResponseModel> put(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      });

  /// Performs a PATCH request
  Future<NetworkResponseModel> patch(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      });

  /// Performs a DELETE request
  Future<NetworkResponseModel> delete(
      String url, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      });

  /// Performs an image upload with a multipart request
  Future<NetworkResponseModel> uploadImage(
      String url, {
        required File imageFile,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      });
}
