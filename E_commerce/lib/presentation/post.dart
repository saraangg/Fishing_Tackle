import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class Post extends StatelessWidget {
  final PostController _controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP POST Example'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller.textEditingController,
                decoration: InputDecoration(
                  labelText: 'title',
                ),
              ),
              TextField(
                controller: _controller.textEditingController,
                decoration: InputDecoration(
                  labelText: 'User id',
                ),
              ),
              TextField(
                controller: _controller.textEditingController,
                decoration: InputDecoration(
                  labelText: 'body',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String data = _controller.textEditingController.text.trim();
                  if (data.isNotEmpty) {
                    _controller.postData(data);
                  } else {
                    _controller.setResponseText('Please enter some data');
                  }
                },
                child: Text('Post Data'),
              ),
              SizedBox(height: 20),
              Obx(() => Text(
                _controller.responseText.value,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class PostController extends GetxController {
  var textEditingController = TextEditingController();
  var responseText = ''.obs;

  void postData(String data) async {
    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        body: jsonEncode({'data': data}),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        setResponseText('Data posted successfully!');
      } else {
        setResponseText('Failed to post data');
      }
    } catch (e) {
      setResponseText('Error: $e');
    }
  }

  void setResponseText(String text) {
    responseText.value = text;
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
