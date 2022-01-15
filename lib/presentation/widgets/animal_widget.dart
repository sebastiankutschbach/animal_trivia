import 'package:animal_trivia/domain/animal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimalImage extends StatelessWidget {
  final Animal animal;

  const AnimalImage({required this.animal, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: animal.imageLink.toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            downloadProgress.progress == null
                ? Container()
                : LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
}
