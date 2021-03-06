import 'package:flutter/material.dart';
import 'package:musix_app/utils/Theme.dart';

class CustomInput extends StatefulWidget {
  final bool? secure;
  final String? hint;
  final TextEditingController? controller;

  const CustomInput({Key? key, this.secure, this.hint, this.controller})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.controller,
        obscureText: widget.secure ?? false,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: const BorderSide(width: 1.5),
          ),
          focusColor: Pallete.primary,
          contentPadding: const EdgeInsets.all(13),
          isDense: true,
        ),
      ),
    );
  }
}

class CustomInputSearch extends StatefulWidget {
  final bool? secure;
  final String? hint;
  final TextEditingController? controller;

  const CustomInputSearch({Key? key, this.secure, this.hint, this.controller})
      : super(key: key);

  @override
  State<CustomInputSearch> createState() => _CustomInputSearchState();
}

class _CustomInputSearchState extends State<CustomInputSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget.controller,
        obscureText: widget.secure ?? false,
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(width: 1.5),
          ),
          focusColor: Pallete.primary,
          contentPadding: const EdgeInsets.all(13),
          isDense: true,
        ),
      ),
    );
  }
}
