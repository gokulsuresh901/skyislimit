class SearchRequest {
  String? q;
  SearchRequest({required this.q});

  Map<String?, String?> toJson() {
    return {
      "q": this.q,
    };
  }
}