import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myapp/core/services/network.services.dart';
import 'package:myapp/core/services/storage.services.dart';
import 'package:myapp/static/constants/app.constants.dart';

class ApiServices {
  final Dio dio = Dio();

  static const String baseUrl = AppConstants.baseUrl;

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    final isConnected = await checkConnection();
    final accessToken = await StorageService('access_token').get('access_token');
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: 'No Internet Connection',
      );
    }

    try {
      final headers = {'Authorization': 'Bearer $accessToken'};
      final response = await dio.get(
        baseUrl + endpoint,
        queryParameters: params,
        options: Options(headers: headers),
      );


      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioException.badResponse(
          statusCode: (response.statusCode)!.toInt(),
          requestOptions: RequestOptions(path: endpoint),
          response: response,
        );
      }
    } on DioException catch (e){
      Logger().e(e);
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<dynamic> post(String endpoint, dynamic data) async {
    final isConnected = await checkConnection();

    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: 'No Internet Connection',
      );
    }

    final accessToken = await StorageService('access_token').get('access_token');

    try {
      Response response;

      if (accessToken != null && accessToken.isNotEmpty) {
        final headers = <String, String>{
          'Authorization': 'Bearer $accessToken',
        };
        response = await dio.post(
          baseUrl + endpoint,
          data: data,
          options: Options(headers: headers),
        );
      } else {
        response = await dio.post(
          baseUrl + endpoint,
          data: data,
        );
      }

      if (response.statusCode == 200) {
        return response;
      } else {
        throw DioException.badResponse(
          statusCode: response.statusCode!,
          requestOptions: RequestOptions(path: endpoint),
          response: response,
        );
      }
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}