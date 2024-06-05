import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mebel/app/core/constants/sized_box_extensions.dart';
import 'package:mebel/app/core/theme/app_theme.dart';
import 'package:mebel/app/modules/home/controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://frankfurt.apollo.olxcdn.com/v1/files/ok32udp2hlhl-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ca51rjbqvwgc1-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/vfekxxij9cn7-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ok32udp2hlhl-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ca51rjbqvwgc1-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/vfekxxij9cn7-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ok32udp2hlhl-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ca51rjbqvwgc1-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/vfekxxij9cn7-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ok32udp2hlhl-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/ca51rjbqvwgc1-UZ/image;s=1000x700",
      "https://frankfurt.apollo.olxcdn.com/v1/files/vfekxxij9cn7-UZ/image;s=1000x700",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mebel uz'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification_copy),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            adsCarousel(imageList, context),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    8.kH,
                    searchProduct(context),
                    16.kH,
                    sectionText('Популярные категории'),
                    16.kH,
                    popularCategories(),
                    16.kH,
                    sectionText('Хиты продаж'),
                    16.kH,
                    popularProducts(),
                    16.kH,
                    sectionText('Лучшие предложения'),
                    16.kH,
                    bestOffers(),
                    16.kH,
                    offer(context),
                    12.kH,
                    contactUs(context),
                    12.kH,
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Column adsCarousel(List<String> imageList, BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: CarouselController(),
          items: imageList
              .map((item) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: item,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      placeholder: (context, url) => const Center(
                        child: CupertinoActivityIndicator(
                          radius: 10,
                          animating: true,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.9,
              scrollPhysics: const ScrollPhysics(),
              onPageChanged: controller.onPageChanged),
        ),
        8.kH,
        Obx(() => Center(
              child: AnimatedSmoothIndicator(
                activeIndex:
                    controller.carouselIndex, // Get index from controller
                count: imageList.length,
                effect: WormEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    spacing: 6,
                    dotColor: AppTheme.lightHintColor,
                    activeDotColor: AppTheme.lightSecondaryColor),
              ),
            )),
      ],
    );
  }

  SizedBox searchProduct(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    context.isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    context.isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          fillColor: context.isDarkMode
              ? AppTheme.darkBackgroundColor
              : AppTheme.lightBackgroundColor,
          prefixIcon: const Icon(Iconsax.search_normal_copy, size: 25),
          hintText: 'Поиск товаров',
          hintStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  sectionText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          // 'Популярные категории',
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  popularCategories() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              childAspectRatio: 3 / 1,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 48.0,
                height: 48.0,
                color: Colors.red,
              );
            },
          ),
        ); // Shimmer effektini ko'rsatish
      } else {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            childAspectRatio: 3 / 1,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = controller.categories[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(4.0),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color:
                      context.isDarkMode // Tema rejimiga qarab rangni tanlash
                          ? AppTheme.darkCardBackgroundColor
                          : AppTheme.lightCardBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: context.isDarkMode
                          ? Colors.grey[800]!
                              .withOpacity(0.5) // Dark tema uchun soya rangi
                          : Colors.grey
                              .withOpacity(0.1), // Light tema uchun soya rangi
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    CachedNetworkImage(
                      height: 40,
                      width: 40,
                      imageUrl: category.image,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CupertinoActivityIndicator(
                          radius: 10,
                          animating: true,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        category.name,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14.0,
                          letterSpacing: -1,
                          height: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  popularProducts() {
    return SizedBox(
      height: 320, // Balandlikni o'zingizga mos ravishda sozlang
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Gorizontal aylantirish
        itemCount: 50, // Mahsulotlar soni
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 180.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 6.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppTheme.darkCardBackgroundColor
                    : AppTheme.lightCardBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: context.isDarkMode
                        ? Colors.grey[800]!
                            .withOpacity(0.2) // Dark tema uchun soya rangi
                        : Colors.grey
                            .withOpacity(0.1), // Light tema uchun soya rangi
                    spreadRadius: 3, // Soyaning tarqalish radiusi
                    blurRadius: 6, // Soyaning xiralashish radiusi
                    offset: const Offset(0, 3), // Soyaning ofseti (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rasm
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                          child: CachedNetworkImage(
                            height: 150,
                            width: 150,
                            imageUrl:
                                'https://frankfurt.apollo.olxcdn.com/v1/files/vfekxxij9cn7-UZ/image;s=1000x700',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CupertinoActivityIndicator(
                                radius: 30,
                                animating: true, // Control animation
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      if (true) // Only show discount if applicable
                        Positioned(
                          bottom: 0, // Adjust positioning as needed
                          left: 0, // Adjust positioning as needed
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: const BoxDecoration(
                              color: AppTheme.errorColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              '-15%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0, // Adjust font size as needed
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Iconsax.heart_copy,
                              color: Colors.yellow,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.kH,
                  SizedBox(
                    height: 20.0,
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 142, 224, 149),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 175, 194, 209),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.kH,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mahsulot nomi
                      Text(
                        'popularProducts.productName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          height: 1.2,
                          letterSpacing: 0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Narx
                      // Text('${product.price.toStringAsFixed(2)} so\'m'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: AppTheme.starColor),
                          initialRating: 5,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemSize: 18.0,
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 4.0),
                        const Text(
                          '5.0',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.kH,
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (true)
                            Text(
                              '17 000 000 so\'m'.replaceAll(',', ' '),
                              style: const TextStyle(
                                color: AppTheme.errorColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                height: 1,
                                letterSpacing: -1,
                              ),
                            ),
                          Text(
                            '15 000 000 so\'m'.replaceAll(',', ' '),
                            style: TextStyle(
                              height: 1,
                              color: context.isDarkMode
                                  ? AppTheme.darkSecondaryTextColor
                                  : AppTheme.lightSecondaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: -1.0,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppTheme.errorColor,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                          if (true)
                            Text(
                              ' ~ 12 000 \$'.replaceAll(',', ' '),
                              style: const TextStyle(
                                height: 1,
                                fontSize: 14.0,
                                letterSpacing: -1.0,
                                decorationColor: Colors.black,
                              ),
                            ),
                          if (false)
                            Text(
                              ' ~ 12 000 \$'.replaceAll(',', ' '),
                              style: const TextStyle(
                                height: 1,
                                color: Colors.black,
                                fontSize: 14.0,
                                letterSpacing: -1.0,
                                decorationColor: Colors.black,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Iconsax.shopping_cart_copy,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bestOffers() {
    return SizedBox(
      height: 320, // Balandlikni o'zingizga mos ravishda sozlang
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Gorizontal aylantirish
        itemCount: 50, // Mahsulotlar soni
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 180.0,
              margin: const EdgeInsets.only(right: 8.0, bottom: 6.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppTheme.darkCardBackgroundColor
                    : AppTheme.lightCardBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: context.isDarkMode
                        ? Colors.grey[800]!
                            .withOpacity(0.2) // Dark tema uchun soya rangi
                        : Colors.grey
                            .withOpacity(0.1), // Light tema uchun soya rangi
                    spreadRadius: 3, // Soyaning tarqalish radiusi
                    blurRadius: 6, // Soyaning xiralashish radiusi
                    offset: const Offset(0, 3), // Soyaning ofseti (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rasm
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                          child: CachedNetworkImage(
                            height: 150,
                            width: 150,
                            imageUrl:
                                'https://frankfurt.apollo.olxcdn.com/v1/files/vfekxxij9cn7-UZ/image;s=1000x700',
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CupertinoActivityIndicator(
                                radius: 30,
                                animating: true, // Control animation
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      if (true) // Only show discount if applicable
                        Positioned(
                          bottom: 0, // Adjust positioning as needed
                          left: 0, // Adjust positioning as needed
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: const BoxDecoration(
                              color: AppTheme.errorColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              '-15%',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0, // Adjust font size as needed
                              ),
                            ),
                          ),
                        ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Iconsax.heart_copy,
                              color: Colors.yellow,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  8.kH,
                  SizedBox(
                    height: 20.0,
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 142, 224, 149),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 175, 194, 209),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.kH,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mahsulot nomi
                      Text(
                        'popularProducts.productName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          height: 1.2,
                          letterSpacing: 0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Narx
                      // Text('${product.price.toStringAsFixed(2)} so\'m'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: AppTheme.starColor),
                          initialRating: 5,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          ignoreGestures: true,
                          itemCount: 5,
                          itemSize: 18.0,
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 4.0),
                        const Text(
                          '5.0',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.kH,
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (true)
                            Text(
                              '17 000 000 so\'m'.replaceAll(',', ' '),
                              style: const TextStyle(
                                color: AppTheme.errorColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                height: 1,
                                letterSpacing: -1,
                              ),
                            ),
                          Text(
                            '15 000 000 so\'m'.replaceAll(',', ' '),
                            style: TextStyle(
                              height: 1,
                              color: context.isDarkMode
                                  ? AppTheme.darkSecondaryTextColor
                                  : AppTheme.lightSecondaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: -1.0,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppTheme.errorColor,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                          if (true)
                            Text(
                              ' ~ 12 000 \$'.replaceAll(',', ' '),
                              style: const TextStyle(
                                height: 1,
                                fontSize: 14.0,
                                letterSpacing: -1.0,
                                decorationColor: Colors.black,
                              ),
                            ),
                          if (false)
                            Text(
                              ' ~ 12 000 \$'.replaceAll(',', ' '),
                              style: const TextStyle(
                                height: 1,
                                color: Colors.black,
                                fontSize: 14.0,
                                letterSpacing: -1.0,
                                decorationColor: Colors.black,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(
                          Iconsax.shopping_cart_copy,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  offer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? AppTheme.darkCardBackgroundColor
            : AppTheme.lightCardBackgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Почему Mebel.uz?',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: AppTheme.lightSecondaryColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(
                  Iconsax.play_cricle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Марка №1 в Узбекстане в сегменте "корпусная мебельная"',
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: AppTheme.lightSecondaryColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(
                  Iconsax.play_cricle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Натуральное и экологическое материалы',
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: AppTheme.lightSecondaryColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(
                  Iconsax.play_cricle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Бистрая доставка и профессионльная сборка',
                  style: TextStyle(
                      fontSize: 16.0,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: AppTheme.lightSecondaryColor,
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(
                  Iconsax.play_cricle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  '3 года гарантии на мебель, пожизненная на фурнитуру',
                  style: TextStyle(
                    fontSize: 16.0,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  contactUs(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.isDarkMode
            ? AppTheme.darkCardBackgroundColor
            : AppTheme.lightCardBackgroundColor,
        border: Border.all(
          color: context.isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isDismissible: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            context: context,
            builder: (context) => Container(
              color: context.isDarkMode
                  ? AppTheme.darkCardBackgroundColor
                  : AppTheme.lightCardBackgroundColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Связаться с нами',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  12.kH,
                  ListTile(
                    leading: Icon(
                      Iconsax.call_copy,
                      color: context.isDarkMode
                          ? AppTheme.darkIconColor
                          : AppTheme.lightPrimaryColor,
                    ),
                    title: const Text(
                      'Позвонить нам',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () async {
                      // Telefon raqamini bu yerga kiriting
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: '+998946433733',
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch $launchUri';
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Divider(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(
                      Iconsax.message_copy,
                      color: context.isDarkMode
                          ? AppTheme.darkIconColor
                          : AppTheme.lightPrimaryColor,
                    ),
                    title: const Text(
                      'Telegram',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onTap: () async {
                      final Uri launchUri = Uri(
                        scheme: 'https',
                        path: 't.me/e_turgunoff',
                      );
                      if (await canLaunchUrl(launchUri)) {
                        await launchUrl(launchUri);
                      } else {
                        throw 'Could not launch $launchUri';
                      }
                      Navigator.pop(context);
                    },
                  ),
                  12.kH,
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: AppTheme.lightPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Закрить',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Iconsax.call_copy,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Связаться с нами',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'По любым вопросам',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Iconsax.arrow_right_3_copy),
          ],
        ),
      ),
    );
  }
}
