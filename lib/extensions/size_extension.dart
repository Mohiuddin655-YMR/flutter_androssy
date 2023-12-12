extension SizeExtension on double? {
  /// UPPER
  double? get x01 => x(01);

  double? get x02 => x(02);

  double? get x05 => x(05);

  double? get x10 => x(10);

  double? get x15 => x(15);

  double? get x20 => x(20);

  double? get x25 => x(25);

  double? get x30 => x(30);

  double? get x40 => x(40);

  double? get x50 => x(50);

  double? get x60 => x(60);

  double? get x70 => x(70);

  double? get x75 => x(75);

  double? get x80 => x(80);

  double? get x85 => x(85);

  double? get x90 => x(90);

  double? get x95 => x(95);

  double? get x98 => x(98);

  double? get x99 => x(99);

  /// DOWN
  double? get x01i => xi(01);

  double? get x02i => xi(02);

  double? get x05i => xi(05);

  double? get x10i => xi(10);

  double? get x15i => xi(15);

  double? get x20i => xi(20);

  double? get x25i => xi(25);

  double? get x30i => xi(30);

  double? get x40i => xi(40);

  double? get x50i => xi(50);

  double? get x60i => xi(60);

  double? get x70i => xi(70);

  double? get x75i => xi(75);

  double? get x80i => xi(80);

  double? get x85i => xi(85);

  double? get x90i => xi(90);

  double? get x95i => xi(95);

  double? get x98i => xi(98);

  double? get x99i => xi(99);

  double? x(int percentage) => this != null ? this! * (percentage / 100) : null;

  double? xi(int percentage) => this != null ? this! + x(percentage)! : null;
}
