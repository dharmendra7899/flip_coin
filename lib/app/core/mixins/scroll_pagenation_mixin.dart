import 'package:flutter/material.dart';

mixin ScrollPaginationMixin<T extends StatefulWidget, D> on State<T> {
  ScrollController scrollController = ScrollController();
  List<D> items = [];
  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreItems = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    _loadData(); // Initial data load
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent &&
        !isLoading &&
        hasMoreItems) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    List<D> fetchedItems =
        await fetchData(currentPage); // Use the abstract method

    setState(() {
      items.addAll(fetchedItems);
      currentPage++;
      isLoading = false;
      if (fetchedItems.isEmpty) {
        hasMoreItems = false;
      }
    });
  }

  Future<List<D>> fetchData(int page);

  /// Method to scroll to a specific item in the list
  void scrollToItem(int index,
      {Duration duration = const Duration(milliseconds: 300)}) {
    if (index >= 0 && index < items.length) {
      double targetPosition = index *
          56.0; // Assuming each item has a fixed height (e.g., 56.0 pixels for a ListTile)
      scrollController.animateTo(
        targetPosition,
        duration: duration,
        curve: Curves.easeInOut,
      );
    }
  }
}
