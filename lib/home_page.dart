import 'package:images/category_list.dart';
import 'package:images/photo_view.dart';
import 'package:images/image_data_class.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// تعریف صفحه اصلی
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ساخت اپ بار برنامه
      appBar: AppBar(
        // وسط چین کردن متن اپ بار
        centerTitle: true,
        title: const Text(
          'نمونه کارها',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // تعریف بدنه ی صفحه اصلی
      body: SafeArea(
        // تقسیم بندی برنامه به دو قسمت عمودی
        child: Row(
          children: [
            Expanded(
              // پر کردن سه چهارم برنامه
              flex: 3,
              // ساخت لیستی از تصاویر و عنوان تصاویر
              child: ListView.builder(
                itemCount: ImageData.images.length,
                itemBuilder: (context, index) {
                  // ایجاد فاصله از همه طرف برای لیستی از تصاویر و عنوان
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // تنطیم ارتفاع تصاویر نسبت به ویجت کانتینر
                      height: 200,
                      decoration: BoxDecoration(
                        // تعریف رنگ پس زمینه
                        color: Colors.grey[300],
                        // گرد کردن حاشیه های تصاویر
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // باز کردن تصاویر در صفحه بعد
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // صدا زدن صفحه ی قابلیت زوم و کوچک کردن تصاویر
                                  builder: (context) => PhotoViewPage(),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                // تنظیم اندازه عرض و ارتفاع تصاویر نسبت به اندازه ی ویجت کانتینر
                                height:
                                    MediaQuery.of(context).size.height / 5.4,
                                width: MediaQuery.of(context).size.width,
                                // پیاده کردن لیست تصاویر از کلاس ImageData
                                image: AssetImage(
                                  ImageData.images[index],
                                ),
                                // پر کردن تصاویر در کانتینر
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // ایجاد فاصله برای عنوان تصاویر
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 5),
                            child: Text(
                              // پیاده کردن عنوان تصاویر از کلاس
                              ImageData.imagesTitle[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // اضافه کردن لیست دسته بندی ها
            const Expanded(
              // پر کردن یک چهارم صفحه
              flex: 1,
              // صدا زدن لیست دسته بندی ها
              child: CategoryList(),
            ),
          ],
        ),
      ),
    );
  }
}
