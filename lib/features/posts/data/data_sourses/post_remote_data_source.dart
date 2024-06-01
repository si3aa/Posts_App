import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:posts/core/error/exception.dart';
import 'package:posts/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePosts(int postId);
  Future<Unit> updatePosts(PostModel postModel);
  Future<Unit> addPosts(PostModel postModel);
}

// ignore: constant_identifier_names
const BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/posts/"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerFailureException();
    }
  }

  @override
  Future<Unit> addPosts(PostModel postModel)async {
   final body ={
     "title": postModel.title,
     "body": postModel.body
   };
   final response = await client.post(
      Uri.parse("$BASE_URL/posts/"),
      body: body);
      if(response.statusCode==201){
        return Future.value(unit);
      }else{
        throw ServerFailureException();
      }
  }

  @override
  Future<Unit> deletePosts(int postId)async {
    final response = await client.delete(
      Uri.parse("$BASE_URL/posts/${postId.toString()}"),
      headers: {"Content-Type": "application/json"},
    );
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerFailureException();
    }
    
  }

  @override
  Future<Unit> updatePosts(PostModel postModel)async {
    final postId=postModel.id.toString();
    final body ={
      "title": postModel.title,
      "body": postModel.body
    };
    final response = await client.patch(
      Uri.parse("$BASE_URL/posts/$postId"),
      body: body,
    );
    if(response.statusCode==200){
      return Future.value(unit);
    }else{
      throw ServerFailureException();
    }

   
  }
}
