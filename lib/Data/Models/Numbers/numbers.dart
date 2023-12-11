class Number {
  int number;
  String image;

  Number({
    required this.number,
    required this.image,
  });

  @override
  String toString() {
    return 'Number(number: $number,image: $image)';
  }
}
