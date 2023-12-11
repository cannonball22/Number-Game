class NumberWithBackground {
  int number;
  String sound;
  String image;

  NumberWithBackground({
    required this.number,
    required this.sound,
    required this.image,
  });

  @override
  String toString() {
    return 'Number(number: $number, sound: $sound,image: $image)';
  }
}
