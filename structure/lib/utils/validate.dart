class ValidateUtils {
  static bool password(
      {required String value,
      required String? length,
      required String? alphabet,
      required String? number,
      required String? specialchar,
      required String? capitalletter,
      required String? samechar,
      required String? arrangechar}) {
    List<String>? lengths = length?.split(",");
    List<String>? alphabets = alphabet?.split(",");
    List<String>? numbers = number?.split(",");
    List<String>? specialchars = specialchar?.split(",");
    List<String>? capitalletters = capitalletter?.split(",");
    List<String>? samechars = samechar?.split(",");
    List<String>? arrangechars = arrangechar?.split(",");
    String p = "^";

    if (numbers != null) {
      p += "(?=.*[0-9]{${numbers[0]},${numbers[1]}})";
    }

    if (capitalletters != null) {
      p += "(?=.*?[A-Z]{${capitalletters[0]},${capitalletters[1]}})";
    }

    if (alphabets != null) {
      p += "(?!.*[a-zA-Z]{${(int.parse(alphabets[1]) + 1).toString()}})";
    }

    if (samechars != null) {
      p += "(?!.*(\w)\1{${(int.parse(samechars[1]) + 1).toString()}})";
    }
    if (specialchars != null) {
      p += "(?=.*?[!@#\$&*~%()^+?-]{${specialchars[0]},${specialchars[1]}})";
    }

    if (lengths != null) {
      p += ".{${lengths[0]},${(int.parse(lengths[1]) + 1).toString()}}" r'$';
    }
    // Log.d(p);
    String pattern =
        r'^(?!.*[0-9]{10})(?=.*?[A-Z]{0,0})(?!.*[a-zA-Z]{11})(?!.*(\w)\1{11})(?=.*?[!@#\$&*~%()^+?-]{0,8}).{4,10}$';
    RegExp regExp = RegExp(
      p,
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(value);
  }

  static clean(String personalId) {
    return personalId.trim().replaceAll('-', '');
  }

  static int sum(List<int> val) {
    return val.fold(0, (result, val) => result + val);
  }

  static bool idCard({required String value}) {

    if (value.length != 13) {
      return false;
    } else {
      List<String> charList = clean(value).split('');

      // 1st step
      List<int> digitList = charList.map((e) => int.parse(e)).toList();

      var lastDigit = digitList[12];
      digitList.removeLast();

      // 2nd step
      var position = 13;

      for (var index = 0; index < 12; index++) {
        digitList[index] = digitList[index] * position;
        --position;
      }

      // 3rd step
      var sumDigit = sum(digitList);

      // 4th step
      var mod = sumDigit % 11;

      // 5th step
      var rawValue = 11 - mod;

      // 6th step
      var checkingValue;
      if (rawValue.toString().length == 1) {
        checkingValue = rawValue;
      } else {
        checkingValue = int.parse(rawValue.toString().split('')[1]);
      }

      // let's validate
      if (checkingValue == lastDigit) {
        return true;
      } else {
        return false;
      }

    }
  }

  static bool laserCode({required String code}) {
    if (code.length != 14) {
      return false;
    } else {
      RegExp reg = RegExp(r'(^[A-Z]{2}\d{1}-\d{7}-\d{2}$)');
      var matches = reg.hasMatch(code);
      return matches;
    }
  }

  static bool email({required String value}) {
    RegExp reg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    var matches = reg.hasMatch(value);
    return matches;
  }
}