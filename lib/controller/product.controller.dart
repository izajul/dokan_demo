import 'package:dokan/model/product.model.dart';
import 'package:dokan/services/remote.service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var _products = <ProductModel>[];
  var _filteredBy = <String>[];
  String _shortBy = "";
  final filteredList = <ProductModel>[].obs;

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

    /// todo:: filter & short
    filteredList.value = _products;

    isLoading(false);
  }

  void addFilter(String value) async {
    if (!_filteredBy.contains(value)) {
      _filteredBy.add(value);
      _performFilter();
    }
  }

  void removeFilter(String value) async {
    if (_filteredBy.contains(value)) {
      _filteredBy.remove(value);
      _performFilter();
    }
  }

  void setShortBy(String value) async {
    _shortBy = value;
    _performFilter();
  }
}
