import 'dart:io';
import 'package:http/http.dart';
import 'package:http/testing.dart' as HttpTesting show MockClient;

class TestMockClient extends HttpTesting.MockClient {

  final int delayInMilliSeconds;

  TestMockClient({this.delayInMilliSeconds = 3000}) : super((Request request) async {

    return Future.delayed(new Duration(milliseconds: delayInMilliSeconds), () async {
      var mockFilesUri = Platform.script.resolve("../assets/mocks${request.url.path}/${request.method.toLowerCase()}.json");
      var mockFile = new File.fromUri(mockFilesUri);
      var json = await mockFile.readAsString();
      return new Response(json, 200);
    });

  });

}