import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_loader_flutter/Screens/view_image.dart';
import 'package:photo_view/photo_view.dart';

class ImageLoaderFlutterWidgets extends StatelessWidget {
  String? image;
  bool circle = false;
  bool onTap;
  Widget placeHolderWidget;
  double? radius;
  double padding;

  ImageLoaderFlutterWidgets({
    super.key,
    this.image,
    required this.radius,
    required this.circle,
    this.onTap = true,
    this.padding = 0,
    this.placeHolderWidget = const Center(
      child: Icon(Icons.photo),
    ),
  });
  @override
  Widget build(BuildContext context) {
    var colorBg = Theme.of(context).cardColor;
    var error = Container(
      decoration: BoxDecoration(
        color: colorBg,
        border: Border.all(color: colorBg),
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : BorderRadius.circular(radius!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circle ? 100 : (radius ?? 0)),
        child: placeHolderWidget,
      ),
    );
    var placeHolder = Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: colorBg,
          border: Border.all(color: colorBg),
          shape: circle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: circle ? null : BorderRadius.circular(radius!),
        ),
        child:
            const Center(child: Center(child: CupertinoActivityIndicator())));
    var simple = Container(
      decoration: BoxDecoration(
        color: colorBg,
        border: Border.all(color: Colors.grey[300]!),
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : BorderRadius.circular(radius!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circle ? 100 : (radius ?? 0)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: image!.contains("http")
              ? CachedNetworkImage(
                  imageUrl: image!,
                  fit: BoxFit.fill,
                  placeholder: (_, __) {
                    return placeHolder;
                  },
                  errorWidget: (_, __, ___) {
                    return error;
                  },
                )
              : image!.contains("assets/")
                  ? Image.asset(
                      image!,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      File(image!),
                      fit: BoxFit.fill,
                    ),
        ),
      ),
    );
    ImageProvider circleImage = image!.contains("http")
        ? CachedNetworkImageProvider(
            image!,
          )
        : image!.contains("assets/")
            ? Image.asset(image!).image
            : Image.file(File(image!)).image;
    return circle
        ? image!.isEmpty
            ? error
            : GestureDetector(
                onTap: onTap
                    ? () {
                        imageView(circleImage, context, image);
                      }
                    : null,
                child: Hero(
                  tag: "$image",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: simple,
                  ),
                ))
        : GestureDetector(
            onTap: onTap
                ? () {
                    imageView(circleImage, context, image);
                  }
                : null,
            child: Hero(
              tag: "$image",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 0),
                child: simple,
              ),
            ),
          );
  }

  void imageView(ImageProvider simple, BuildContext context, String? image) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => ViewImageScreen(
                  iMageProvider: simple,
                )));
  }
}
