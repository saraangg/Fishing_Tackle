import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen/models/model.dart';

class MediaDetailPage extends StatelessWidget {
  final Media media;

  const MediaDetailPage({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    media.filePath!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator(backgroundColor: Colors.grey.shade500,color: Colors.white,strokeWidth: 1,));
                    },
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.red, ),
                        SizedBox(width: 4),
                        Text('${media.likeCount ?? 0} likes'),
                        SizedBox(width: 16),
                        Icon(Icons.comment, color: Colors.blue),
                        SizedBox(width: 4),
                        Text('${media.commentCount ?? 0} comments'),
                      ],
                    ),
                    SizedBox(height: 4),
                    if (media.description != null && media.description!.isNotEmpty)
                      Text('Description: ${media.description}'),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.book), label: 'My Courses'),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.mode_comment_outlined), label: 'Mentor'),
        //     BottomNavigationBarItem(
        //         icon: Icon(CupertinoIcons.person), label: 'Profile')
        //   ],
        // )
    );
  }
}