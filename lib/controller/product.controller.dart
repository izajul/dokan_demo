import 'package:dokan/model/product.model.dart';
import 'package:dokan/services/filter.service.dart';
import 'package:dokan/services/remote.service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductSort _productSort =
      ProductSort(); // creating object with sorted products
  var isLoading = false.obs;
  var _products = <ProductModel>[];
  final filteredList = <ProductModel>[].obs;

  final _filteredWith = <Category>[];
  SortBy? _sortBy;

  @override
  void onInit() {
    _fetchProduct();
    super.onInit();
  }

  void _fetchProduct() async {
    isLoading(true);
    _products = await RemoteService.fetchProduct() ?? [];
    _performFilter();
  }

  void _performFilter() async {
    if (!isLoading.value) {
      isLoading(true);
    }

    // filtering by category
    var ls = <ProductModel>[];
    if (_filteredWith.isNotEmpty) {
      for (final category in _filteredWith) {
        ls.addAll(_products
            .where((element) => element.categories?.contains(category) == true)
            .toList());
      }
    } else {
      ls = _products;
    }
    ls = ls.toSet().toList();
    filteredList.value = ls;
    _productSort.updateList(ls); // shorting data after filter the category
    isLoading(false);
  }

  void addFilter(Category value) async {
    if (!_filteredWith.contains(value)) {
      _filteredWith.add(value);
      _performFilter();
    }
  }

  void removeFilter(Category value) async {
    if (_filteredWith.contains(value)) {
      _filteredWith.remove(value);
      _performFilter();
    }
  }

  void setShortBy(SortBy value) async {
    _sortBy = value;
    _sortProduct();
  }

  void _sortProduct() async {
    if (_sortBy == null) return;
    filteredList.value = await _productSort.getFilteredData(_sortBy!);
  }
}
