import 'dart:async';

import 'package:ecommerce/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputSearch extends StatefulWidget {
  final Function(String) onSearch;

  const InputSearch({super.key, required this.onSearch});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  Timer? _debounce;
  TextEditingController? _textEditingController;
  String? _search;

  @override
  void initState() {
    _textEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _textEditingController?.dispose();
    _search = null;

    super.dispose();
  }

  _onSearchChanged(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      widget.onSearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (txt) {
        _onSearchChanged(txt);
        setState(() {
          _search = txt;
        });
      },
      controller: _textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.offGrey,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintText: 'Search Product Name',
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xffC4C5C4)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: _search?.isNotEmpty ?? false
            ? IconButton(
                onPressed: () {
                  widget.onSearch('');
                  setState(() {
                    _search = null;
                  });
                  _textEditingController?.clear();
                },
                icon: const Icon(Icons.close))
            : SvgPicture.asset(
                'assets/icons/search.svg',
                width: 20,
                height: 20,
                fit: BoxFit.scaleDown,
              ),
      ),
    );
  }
}
