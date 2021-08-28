import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopanizer/models/category.dart';
import 'package:shopanizer/services/ItemsDBService.dart';
import 'package:shopanizer/shared/widgets/dropdown_with_label.dart';

class CategoriesDropDownList extends StatefulWidget {
  final ValueNotifier selectedValue;

  CategoriesDropDownList(this.selectedValue);

  @override
  _CategoriesDropDownListState createState() => _CategoriesDropDownListState();
}

class _CategoriesDropDownListState extends State<CategoriesDropDownList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShoppingCategory>>(
                  future: ItemsDBService().categories,
                  builder: (ctxt, items) => DropDownWithLabel(
                    labelText: "Category",
                    placeHolder: "Furniture",
                    value: widget.selectedValue.value,
                    items: (items.data == null) ? [] : items.data!.map(mapCategoryCollectionToDropDownItems).toList(),
                    onChangedCallback: (index) {
                      setState(() {
                        widget.selectedValue.value = index;
                      });
                    },
                  ),
                );
  }

  DropdownMenuItem<int> mapCategoryCollectionToDropDownItems(ShoppingCategory c) {
    return DropdownMenuItem(
      child: Text(c.name),
      value: c.value,
    );
  }
}