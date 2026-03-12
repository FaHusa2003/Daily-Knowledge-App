class FactModel {
  final String fact;
  final String source;
  final String topic;

  FactModel({required this.fact, required this.source, required this.topic});

  // لتحويل البيانات من Map إلى Object بسهولة
  factory FactModel.fromJson(Map<String, dynamic> json) {
    return FactModel(
      fact: json['fact'],
      source: json['source'],
      topic: json['topic'],
    );
  }
}
