import '/ViewModel/Providers/provider_theme.dart';
import 'package:flutter/material.dart';

class Texts {
  Text mainTitle = Text("SYNAG", style: ProviderTheme().styles.appBar);
  Text firstTitle = Text("Synaglar:", style: ProviderTheme().styles.appBar);
  Text addTitle = Text("Synag goş:", style: ProviderTheme().styles.appBar);
  Text cancel = Text("ÝATYR", style: ProviderTheme().styles.btns);
  Text add = Text("GOŞ", style: ProviderTheme().styles.btns);
  Text testPicker = Text("TXT den al!", style: ProviderTheme().styles.picker);
    Text testSucsess = Text("Synag alyndy!", style: ProviderTheme().styles.picker);
  Text pickerDesc = Text(
      "Öň taýýar edilen synag ýok bolsa, goş dügmesine basyp dowam edip bilersiňiz!",
      textAlign: TextAlign.center,
      style: ProviderTheme().styles.pickerDesc);
  Text testCount = Text("Sorag sany", style: ProviderTheme().styles.btns,);
}
