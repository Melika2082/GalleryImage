import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

// صفحه ی لیست دسته بندی ها
class _CategoryListState extends State<CategoryList> {
  // تعریف لیست رشه های دسته بندی
  List<String> categories = [
    'نمونه کار سئو',
    'نمونه سئو1',
    'نمونه کار گرافیک',
    'موشن گرافیک',
    'نمونه کار قالب آماده',
    'نمونه کار اپلیکیشن موبایل',
    'نمونه کار پریمر',
    'نمونه کار تدوین فیلم',
    'سایت',
    'نمونه کار بازی سازی',
  ];
  // تعریف متغیر برای تشخصی کلیک شدن لیست دسته بندی ها
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // پیاده سازی لیست دسته بندی ها
    return ListView.builder(
      // تعیین جهت اسکرول کردن به صورت عمودی
      scrollDirection: Axis.vertical,
      itemCount: categories.length,
      itemBuilder: (context, index) => Column(
        children: [
          // تعریف ویجت GestureDetector برای پاسخ به حرکات کاربر
          GestureDetector(
            onTap: () {
              setState(() {
                // لیستی که انتخاب شده با اندیس برابر میشود و در لیست ذخیره میشود
                selectedIndex = index;
              });
            },
            child: Container(
              // ایحاد شزط برای اینکه کاربر روی یک لیستی کلیک کرد تغییر رنگ میدهد و سفیذ میشود
              color: selectedIndex == index ? Colors.white : Colors.grey[300],
              // اندازه ارتفاع برای هر لیست دسته بندی ها
              height: MediaQuery.of(context).size.height / 10,
              // وسط چین کردن متن در لیست دسته بندی ها
              child: Center(
                // تعیین فاصله از همه طرف در متن لیست دسته بندی ها
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // تعریف اسامی لیست دسته بندی ها
                  child: Text(
                    categories[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    // تعیین محل قرارگیری متن در وسط
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          // اضافه کردن خط جداکننده در آخر برای هز آیتم لیست دسته بندی ها
          const Divider(
            color: Colors.black,
            height: 0,
          ),
        ],
      ),
    );
  }
}
