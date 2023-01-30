
class AutoKeyCipherDe {
  int mod(int val, int mod) {
    return (val % mod + mod) % mod;
  }
  String decrypt(String input,String key) {
    input = input.replaceAll(' ', '');
    key = key.replaceAll(' ', '');
    input = input.toUpperCase();
    key = key.toUpperCase();
    String output = "";
    for (int i = 0; i < input.length; i++) {
      if(key.length == input.length) {
        output += String.fromCharCode(
            mod(input.codeUnitAt(i) - key.codeUnitAt(i)  ,26) + 65 );
      }
    }
    return output;
  }
}


