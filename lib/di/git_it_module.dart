import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GitItModule{
Connectivity get createconnectivity => Connectivity();
Dio get createDio => Dio();
}