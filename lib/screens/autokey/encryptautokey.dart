class AutoKeyCipher {
  String encrypt( String key ,String input) {
    input = input.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    input = input.toUpperCase();
    key = key.toUpperCase();
    String output = "";
    for (int i = 0; i < input.length; i++) {
      if(key.length == input.length)
        {
          output += String.fromCharCode(
              (input.codeUnitAt(i) + key.codeUnitAt(i)) % 26 +65);
        }
      else{
        key+=input;
        output += String.fromCharCode(
            (input.codeUnitAt(i) + key.codeUnitAt(i)) % 26 +65);
      }
    }
    return output;
  }
}


