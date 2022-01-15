import 'package:dokan/model/product.model.dart';

class ProductSort {
  final List<ProductModel> _list = [];

  void updateList(List<ProductModel> items) async {
    _list.clear();
    _list.addAll(items);
    _sort();
  }

  final _priceLowToHighInx = <int>[];
  final _priceHighToLowInx = <int>[];
  final _topRattedInx = <int>[];
  final _bestSealsInx = <int>[];

  void _sort() {
    _sortByPrice();
    _sortByRating();
    _sortBestSeals();
  }

  void _sortByPrice() async {
    final ls = [..._list];
    ls.sort((a, b) => double.parse(a.price ?? "0.0")
        .compareTo(double.parse(b.price ?? "0.0")));

    for (final value in ls) {
      _priceLowToHighInx.add(_list.indexOf(value));
    }
    for (final value in ls.reversed) {
      _priceHighToLowInx.add(_list.indexOf(value));
    }
  }

  void _sortByRating() async {
    final ls = [..._list];
    ls.sort((a, b) => double.parse(b.averageRating ?? "0.0")
        .compareTo(double.parse(a.averageRating ?? "0.0")));
    for (final value in ls) {
      _topRattedInx.add(_list.indexOf(value));
    }
  }

  void _sortBestSeals() async {
    final ls = [..._list];
    ls.sort((a, b) => (b.totalSales ?? 0).compareTo((a.totalSales ?? 0)));
    for (final value in ls) {
      _bestSealsInx.add(_list.indexOf(value));
    }
  }

  Future<List<ProductModel>> getFilteredData(SortBy filterBy) async {
    switch (filterBy) {
      case SortBy.HIGHTOLOWPRICE:
        return _getProductByIndex(_priceHighToLowInx);
      case SortBy.LOWTOHIGHPRICE:
        return _getProductByIndex(_priceLowToHighInx);
      case SortBy.TOPRATED:
        return _getProductByIndex(_topRattedInx);
      case SortBy.BESTSEALS:
        return _getProductByIndex(_bestSealsInx);
      case SortBy.NONE:
        return _list;

        /// return the list as same was
        break;
    }
  }

  List<ProductModel> _getProductByIndex(List<int> indexes) {
    final List<ProductModel> ls = [];
    for (final inx in indexes) {
      ls.add(_list.elementAt(inx));
    }
    return ls;
  }
}

/// defined enum to control filter by types
enum SortBy { NONE, HIGHTOLOWPRICE, LOWTOHIGHPRICE, TOPRATED, BESTSEALS }
