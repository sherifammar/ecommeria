import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';

class Dropdownsearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownname;
  final TextEditingController dropdownid;
  const Dropdownsearch(
      {super.key,
      required this.title,
      required this.listdata,
      required this.dropdownname,
      required this.dropdownid});

  @override
  State<Dropdownsearch> createState() => _DropdownsearchState();
}

class _DropdownsearchState extends State<Dropdownsearch> {
  void showDropdownlist(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectlistitem = selectedList[0];
          widget.dropdownname.text = selectlistitem.name;
          widget.dropdownid.text =
              selectlistitem.value!; // show choose in textfromfield
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.dropdownname,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropdownlist(context);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
          hintText: widget.dropdownname.text == ""
              ? widget.title
              : widget.dropdownname.text,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
