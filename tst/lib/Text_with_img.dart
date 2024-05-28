import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_gemini/google_gemini.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class TextWithImage extends StatefulWidget {
  const TextWithImage({super.key});

  @override
  State<TextWithImage> createState() => _TextWithImageState();
}

const apiKey = "AIzaSyCjAIgvndWRJb9ehP70NVPASgCIjPVVMZ8";


class _TextWithImageState extends State<TextWithImage> {
  bool loading = false;
  List<Map<String, dynamic>> textAndImageChat = [];
  File? imageFile;

  final ImagePicker picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(apiKey: apiKey);

  // Send Message
  void sendMessage({required String query, File? image}) {
    setState(() {
      loading = true;
      textAndImageChat.add({
        "role": "User",
        "text": query,
        "image": image,
      });
      _textController.clear();
      imageFile = null;
    });
    scrollToTheEnd();

    if (image != null) {
      gemini.generateFromTextAndImages(query: query, image: image).then((value) {
        setState(() {
          loading = false;
          textAndImageChat.add({
            "role": "Gemini",
            "text": value.text,
            "image": "",
          });
        });
        scrollToTheEnd();
      }).onError((error, stackTrace) {
        setState(() {
          loading = false;
          textAndImageChat.add({
            "role": "Gemini",
            "text": error.toString(),
            "image": "",
          });
        });
        scrollToTheEnd();
      });
    } else {
      gemini.generateFromText(query).then((value) {
        setState(() {
          loading = false;
          textAndImageChat.add({
            "role": "Gemini",
            "text": value.text,
            "image": "",
          });
        });
        scrollToTheEnd();
      }).onError((error, stackTrace) {
        setState(() {
          loading = false;
          textAndImageChat.add({
            "role": "Gemini",
            "text": error.toString(),
            "image": "",
          });
        });
        scrollToTheEnd();
      });
    }
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _controller,
                itemCount: textAndImageChat.length,
                padding: const EdgeInsets.only(bottom: 20),
                itemBuilder: (context, index) {
                  final chatItem = textAndImageChat[index];
                  return ListTile(
                    isThreeLine: true,
                    leading: CircleAvatar(
                      child: Text(chatItem["role"].substring(0, 1)),
                    ),
                    title: Text(chatItem["role"]),
                    subtitle: Text(chatItem["text"]),
                    trailing: chatItem["image"] is File
                        ? Image.file(
                      chatItem["image"],
                      width: 90,
                    )
                        : null,
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: "Write a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.transparent,
                      ),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: () async {
                      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        imageFile = image != null ? File(image.path) : null;
                      });
                    },
                  ),
                  IconButton(
                    icon: loading
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.send),
                    onPressed: () {
                      if (_textController.text.isEmpty && imageFile == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please enter a message or select an image")),
                        );
                        return;
                      }
                      sendMessage(query: _textController.text, image: imageFile);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: imageFile != null
          ? Container(
        margin: const EdgeInsets.only(bottom: 80),
        height: 150,
        child: Image.file(imageFile ?? File("")),
      )
          : null,
    );
  }
}
