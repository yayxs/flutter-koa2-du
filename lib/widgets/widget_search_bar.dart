import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:search_widget/search_widget.dart';

class WidgetSearchBar extends StatefulWidget {
  @override
  _WidgetSearchBarState createState() => _WidgetSearchBarState();
}

class _WidgetSearchBarState extends State<WidgetSearchBar> {
  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Flutter", 54),
    LeaderBoard("React", 22.5),
    LeaderBoard("Vue", 24.7),
    LeaderBoard("小程序", 22.1),
  ];

  LeaderBoard _selectedItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: <Widget>[
          SearchWidget<LeaderBoard>(
            dataList: list, // 数据源
            hideSearchBoxWhenItemSelected: false,
            listContainerHeight: MediaQuery.of(context).size.height / 4,
            // 基于搜索查询过滤数据列表的选项
            queryBuilder: (query, list) {
              return list
                  .where((item) =>
                      item.username.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            },
            // 弹出列表项构建器的选项。这基本上返回一个小部件以在弹出窗口中显示为列表项
            popupListItemBuilder: (item) {
              return PopupListItemWidget(item);
            },
            // 为选定的列表项构建器提供的选项，当用户从弹出列表中选择一个项时启用
            selectedItemBuilder: (selectedItem, deleteSelectedItem) {
              return SelectedItemWidget(selectedItem, deleteSelectedItem);
            },

            // 定制小部件
            noItemsFoundWidget: NoItemsFound(),
            // 提供自定义TextField的选项。接受TextEditingController和FocusNode作为参数
            textFieldBuilder: (controller, focusNode) {
              return MyTextField(controller, focusNode);
            },
            // 用于获取所选择的选项。返回所选项目；如果删除了该项，则返回null
            onItemSelected: (item) {
              setState(() {
                _selectedItem = item;
              });
            },
          ),
          // Text(
          //   "${_selectedItem != null ? _selectedItem.username : ""
          //       "No item selected"}",
          // ),
        ],
      ),
    );
  }
}

class LeaderBoard {
  LeaderBoard(this.username, this.score);

  final String username;
  final double score;
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container();

    // Container(
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 2,
    //     horizontal: 4,
    //   ),
    //   child: Row(
    //     children: <Widget>[
    //       Expanded(
    //         child: Padding(
    //           padding: const EdgeInsets.only(
    //             left: 16,
    //             right: 16,
    //             top: 8,
    //             bottom: 8,
    //           ),
    //           child: Text(
    //             selectedItem.username,
    //             style: const TextStyle(fontSize: 14),
    //           ),
    //         ),
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.delete_outline, size: 22),
    //         color: Colors.grey[700],
    //         onPressed: deleteSelectedItem,
    //       ),
    //     ],
    //   ),
    // );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "搜索书籍", // 搜索框里显示的内容
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final LeaderBoard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.username,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
