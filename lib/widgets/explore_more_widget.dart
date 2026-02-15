import 'package:flutter/material.dart';
import 'package:furniture_app/core/data/app_data.dart';
import 'package:furniture_app/widgets/smartImage.dart';

class ExploreMoreWidget extends StatelessWidget {
  const ExploreMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to full categories screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AllExploreScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          /// Horizontal categories list
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 4,
              separatorBuilder: (_, _) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = AppData.explore[index];
                return _ExploreItem(
                  name: item['name'] ?? 'Unknown',
                  imageUrl: item['image'] ?? 'Unknown',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Selected ${item['name'] ?? 'Unknown'}'),
                      ),
                    );
                  },
                  price: '\$${item['price'] ?? 'Unknown'}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;

  const _ExploreItem({
    required this.name,
    required this.imageUrl,
    required this.onTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 82,
              width: 82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: smartImage(imageUrl, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins',
                    color: Colors.blue.shade700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AllExploreScreen extends StatelessWidget {
  const AllExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AppData.explore;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Explore More'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView.separated(
          itemCount: items.length, // use actual list length
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, _) =>
              const SizedBox(height: 16), // vertical spacing
          itemBuilder: (context, index) {
            final item = items[index];
            return _ExploreItem(
              name: item['name'] ?? 'Unknown',
              imageUrl: item['image'] ?? '',
              price: '\$${item['price'] ?? '0'}',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Selected ${item['name'] ?? 'Unknown'}'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
