import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/action_icon.dart';
import 'package:furniture_app/widgets/banner_widget.dart';
import 'package:furniture_app/widgets/categories_widget.dart';
import 'package:furniture_app/widgets/explore_more_widget.dart';
import 'package:furniture_app/widgets/products/product_widget.dart';
import 'package:furniture_app/widgets/search_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Find best one\nFurniture",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 1.2,
          ),
        ),
        centerTitle: false,
        actions: [
          ActionIcon(icon: Icons.shopping_bag_outlined, onTap: () {}),
          const SizedBox(width: 12),
          ActionIcon(icon: Icons.notifications_none_rounded, onTap: () {}),
          const SizedBox(width: 20),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            searchNavigator(context),
            SizedBox(height: 20),
            BannerWidget(),
            CategoriesWidget(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trending Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AllTrendingProduct(),
                      ),
                    );
                    //
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ),
              ],
            ),
            _buildProductList(),
            ExploreMoreWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 0,
        childAspectRatio: 1.02,
      ),
      itemBuilder: (context, index) {
        return ProductWidget();
      },
    );
  }
}
