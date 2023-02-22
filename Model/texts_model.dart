import '/ViewModel/Providers/provider_theme.dart';
import 'package:flutter/material.dart';

class Texts {
  Text mainTitle = Text("SYNAG", style: ProviderTheme().styles.appBar);
  Text firstTitle = Text("Synaglar:", style: ProviderTheme().styles.appBar);
  Text addTitle = Text("Synag goş:", style: ProviderTheme().styles.appBar);
  Text cancel = Text("ÝATYR", style: ProviderTheme().styles.btns);
  Text add = Text("GOŞ", style: ProviderTheme().styles.btns);
}
