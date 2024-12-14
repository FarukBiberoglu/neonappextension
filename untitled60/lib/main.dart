extension Palindrome on String {
  bool get isPalindrome {
    String cleaned = this.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }
}

extension PrimeCheck on int {
  bool get isPrime {
    if (this <= 1) {
      return false;
    }
    for (int i = 2; i <= this ~/ 2; i++) {
      if (this % i == 0) {
        return false;
      }
    }
    return true;
  }
}

extension DateTimeDifference on DateTime {
  int daysBetween(DateTime other) {
    return this.difference(other).inDays.abs();
  }
}

extension BoolLogic on bool {
  bool and(bool other) => this && other;
  bool or(bool other) => this || other;
  bool xor(bool other) => this != other;
  bool get not => !this;
}

extension SetComplaintFilter<T> on Set<T> {
  void addUnique(T item) {
    if (!this.contains(item)) {
      this.add(item);
    }
  }

  Set<T> get uniqueComplaints => Set<T>.from(this);
}

extension MapFamilyListing on Map<String, List<String>> {
  void addFamily(String surname, List<String> familyMembers) {
    this[surname] = familyMembers;
  }

  List<String>? getFamily(String surname) {
    return this[surname];
  }
}

void main() {
  String phrase = "A man, a plan, a canal, Panama";
  print(phrase.isPalindrome);

  int number1 = 7;
  int number2 = 10;
  print(number1.isPrime);
  print(number2.isPrime);

  DateTime firstDate = DateTime(2024, 12, 1);
  DateTime secondDate = DateTime(2024, 12, 14);
  int difference = firstDate.daysBetween(secondDate);
  print('Gün farkı: $difference');

  bool a = true;
  bool b = false;
  print(a.and(b));
  print(a.or(b));
  print(a.xor(b));
  print(a.not);
  print(b.not);

  Set<String> complaints = Set<String>();
  complaints.add('Loud Noise');
  complaints.add('Broken Streetlight');
  complaints.add('Loud Noise');
  complaints.add('Lost Pet');

  print('Şikayetler: $complaints');

  Set<String> uniqueComplaints = complaints.uniqueComplaints;
  print('Benzersiz Şikayetler: $uniqueComplaints');

  Map<String, List<String>> families = {};
  families.addFamily('Smith', ['John', 'Jane', 'Jake']);
  families.addFamily('Johnson', ['Mary', 'Peter']);

  print(families.getFamily('Smith'));  // Output: [John, Jane, Jake]
  print(families.getFamily('Johnson'));  // Output: [Mary, Peter]
}
