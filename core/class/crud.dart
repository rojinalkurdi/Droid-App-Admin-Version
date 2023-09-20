import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:delivery/core/class/statusRequest.dart';
import 'package:delivery/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
//headers to protect our API
Map<String, String> _myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print('sssssss: ${response.body}');
      print('sssssss: ${response.statusCode.runtimeType}');
      print('ggggggggggggggggggggggggggg');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print('rrr:$responseBody');
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (err) {
      print('ee: $err');
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    print('---------------------');
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
        print('sssssss: ${response.body}');
        print('sssssss: ${response.statusCode}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print('kkk: $responseBody');
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (err) {
      print('eeeeee: $err');
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> addRequestWithImageOne(
      url, data, File? image,
      [String? namerequest]) async {
    namerequest ??= "files";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
