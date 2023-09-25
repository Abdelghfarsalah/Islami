import 'package:flutter/material.dart';

class customtextfiled extends StatelessWidget {
  const customtextfiled({super.key,required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: TextField(
        onChanged:onChanged,
        decoration: InputDecoration(
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            
            ),
          hintText: 'ادخل رقم او اسم السورة',
          
        ),
      ),
    );
  }
}