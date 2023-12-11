import 'dart:math';

List<int> generateRandomNumbers(int maxNumber) {
  final random = Random();
  // we used a set to only have unique values
  final generatedNumbers = <int>{};

  // Generate random numbers until we have 3 unique ones
  while (generatedNumbers.length < 3) {
    final randomNumber = random.nextInt(maxNumber) + 1;
    generatedNumbers.add(randomNumber);
  }

  // Convert the set to a list and return it
  return generatedNumbers.toList();
}
