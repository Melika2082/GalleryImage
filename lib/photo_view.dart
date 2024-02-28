import 'package:images/image_data_class.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

// بخش صفحه ای که تصاویر در آن باز میشوند
class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ایحاد لیست تصاویر ها
      body: PhotoViewGallery.builder(
        itemCount: ImageData.images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            // پیاده کردن لیست تصاویر
            imageProvider: AssetImage(
              ImageData.images[index],
            ),
            // تععین حداقل اندازه ی تصاویر برای کوچک کردن
            minScale: PhotoViewComputedScale.contained * 0.8,
            // تعیین حداکثر اندازه ی تصاویر برای زوم کردن
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        // تعیین جهت اسکرول کردن به صورت افقی برای مشاهده ی تصاویر بعدی
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
