import 'package:dio/dio.dart';

class DioService {
    static final DioService _dioService = DioService._internal();
    factory DioService() {
        return _dioService;
    }

    static final Dio dio = Dio();

    /// Initialize the Dio Service globally add interceptors, baseOptions, etc.
    static Future<void> init() async {
        dio.options = BaseOptions(
            baseUrl: "https://jsonplaceholder.typicode.com",
            /// If the connection is not established to the server within 10 seconds, it will throw a TimeoutException.
            connectTimeout: const Duration(seconds: 10),
            /// If the response for the connection is not received within 10 seconds, it will throw a TimeoutException.
            receiveTimeout: const Duration(seconds: 10),
            /// If the request is not sent to the server within 10 seconds, it will throw a TimeoutException.
            sendTimeout: const Duration(seconds: 10),
            /// The default content type is "application/json; charset=utf-8". Use this for static headers
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
            },
        );

        /// Add interceptors to the Dio instance for handling common request, response, and error
        dio.interceptors.add(InterceptorsWrapper(
            /// Handle the common request, encrypt the data, add headers, etc.
            onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
                /// Do something before request is sent like adding dynamic header like (auth token)
                return handler.next(options); //continue
            },
            /// Handle the common success response, decode the response data, decrypt the data, etc.
            onResponse: (Response response, ResponseInterceptorHandler handler) {
                /// Do something with response data
                return handler.next(response); // continue
            },
            /// Handle the common erros like 401, 404, etc.
            onError: (DioException e, ErrorInterceptorHandler handler) {
                if(e.response?.statusCode == 401) {
                    /// If the response status code is 401, then log out the user
                    /// and redirect to the login page
                }
                /// Do something with response error
                return handler.next(e); //continue
            },
        ));

        /// Add the LogInterceptor to the Dio instance for logging the request and response
        // dio.interceptors.add(LogInterceptor(
        //     request: true,
        //     requestBody: true,
        //     responseBody: true,
        // ));
    } 

    DioService._internal();
}