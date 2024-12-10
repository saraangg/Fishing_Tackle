import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_screen/models/model.dart';
import 'mediadetail.dart';

class MediaItem extends StatelessWidget {
  final Media media;

  const MediaItem({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MediaDetailPage(media: media),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10)
          ),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.0, // Adjust aspect ratio as per your design
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
              Positioned(
                bottom: 8.0,
                left: 28.0,
                child: Column(
                  children: [
                    Icon(Icons.favorite_border_outlined,color: Colors.white,size: 20,),
                    SizedBox(width: 4),
                    Text('${media.likeCount ?? 0}', style: TextStyle(color: Colors.white,fontSize: 12)),
                  ],
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: 28.0,
                child: Column(
                  children: [
                    Icon(Icons.comment_outlined, color: Colors.white,size: 20,),
                    SizedBox(width: 4),
                    Text('${media.commentCount ?? 0}', style: TextStyle(color: Colors.white,fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}