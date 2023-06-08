import 'package:flutter/material.dart';

class BrandPageContainer extends StatefulWidget {
  int index;
  final String brandName;

  BrandPageContainer({required this.index, required this.brandName});



  @override
  State<BrandPageContainer> createState() => _BrandPageContainerState();
}

class _BrandPageContainerState extends State<BrandPageContainer> {





  int  _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(_selectedIndex == widget.index){
          setState(() {
            _selectedIndex = -1;
          });
        }else{
          setState(() {
            _selectedIndex = widget.index;
          });
        }

      },
      child: ListTile(
        trailing: _selectedIndex == widget.index ?
            Icon(Icons.check_box, color: Colors.red.shade800,)
            : Icon(Icons.check_box_outline_blank_outlined),
        leading: Text(widget.brandName, style: TextStyle(color: _selectedIndex == widget.index ? Colors.red.shade800 : Colors.black),),
      ),
    );
  }
}
