import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';

class AddressAutocompleteField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;
  final Function(double, double) onSelectCoordinates;
  final Function(String?) onSave;
  final Color? iconColor;
  final FocusNode? focus;

  const AddressAutocompleteField({
    Key? key,
    this.focus,
    required this.controller,
    this.hint,
    required this.onSave,
    required this.onSelectCoordinates,
    this.iconColor,
  }) : super(key: key);

  @override
  State<AddressAutocompleteField> createState() =>
      _AddressAutocompleteFieldState();
}

class _AddressAutocompleteFieldState extends State<AddressAutocompleteField> {
  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: widget.controller,
      googleAPIKey: "AIzaSyArJYP0xNZIJK-2A5xYtoDjlbAJs3AxUqw",
      focusNode: widget.focus,
      inputDecoration: const InputDecoration(
        border: InputBorder.none,
      ),
      getPlaceDetailWithLatLng: (Prediction prediction) {
        double lat = double.parse(prediction.lat ?? "0.0");
        double long = double.parse(prediction.lng ?? "0.0");
        widget.onSelectCoordinates(lat, long);
      },
      itemClick: (Prediction prediction) {
        String? text = prediction.description;
        widget.controller.text = text ?? "";
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(
            offset: prediction.description?.length ?? 0,
          ),
        );
        widget.onSave(text);
      },
      countries: ["NG"],
      textStyle: const TextStyle(
        fontSize: 20.0,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
      isLatLngRequired: true,
      isCrossBtnShown: true,
      placeType: PlaceType.geocode,
    );
  }
}
