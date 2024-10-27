import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possible/core/extension/number.extention.dart';
import 'package:possible/features/dashboard/app/widgets/gallery_slider_item.dart';

class GalleryItem extends StatefulWidget {
  const GalleryItem({super.key , required this.url, this.smaller = true, required this.location , this.isExtended = false});

  final String url;
  final bool smaller;
  final String location;
  final bool isExtended;

  @override
  State<GalleryItem> createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {

  @override
  Widget build(BuildContext context) {
  double ht = widget.isExtended? 370.h: 180.h;
    return Container(
      height: ht,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.all(4),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
              borderRadius: 15.radius,
              child: Image.asset(
                widget.url,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width,
                height: ht ,
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:  10 , vertical: 10),
            child: ExpandingContainer(
              text: widget.location,
              smaller: widget.smaller,
            ),
          ),
        ],
      ),
    );
  }
}
