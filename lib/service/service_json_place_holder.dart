import 'dart:io';
import 'package:chats_list_with_service_example/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/comment_model.dart';

abstract class INetworkService {
  Future<bool> addItemToService(CommentsModel commentsModel);
  Future<bool> putItemToService(CommentsModel commentsModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<CommentsModel>?> fetchCommentItems();
  Future<List<UserModel>?> fetchUserItems();
}

class NetworkService implements INetworkService {
  final Dio _dio;

  NetworkService()
      : _dio =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addItemToService(CommentsModel commentsModel) async {
    try {
      final response =
          await _dio.post(_ServicePath.comments.name, data: commentsModel);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.put("${_ServicePath.comments.name}/$id");
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<List<CommentsModel>?> fetchCommentItems() async {
    try {
      final response = await _dio.get(_ServicePath.comments.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => CommentsModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<List<UserModel>?> fetchUserItems() async {
    try {
      final response = await _dio.get(_ServicePath.users.name);

      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;

        if (datas is List) {
          return datas.map((e) => UserModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<bool> putItemToService(CommentsModel commentsModel, int id) async {
    try {
      final response = await _dio.put("${_ServicePath.comments.name}/$id",
          data: commentsModel);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print("-----------");
    }
  }
}

enum _ServicePath {
  comments,users,
}
