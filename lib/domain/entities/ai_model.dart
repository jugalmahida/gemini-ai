T? safeCast<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class AIModel {
  final List<Candidate>? candidates;
  final UsageMetadata? usageMetadata;
  final String? modelVersion;

  AIModel({
    this.candidates,
    this.usageMetadata,
    this.modelVersion,
  });

  factory AIModel.fromJson(Map<String, dynamic> json) {
    return AIModel(
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      usageMetadata: json['usageMetadata'] != null
          ? UsageMetadata.fromJson(
              json['usageMetadata'] as Map<String, dynamic>)
          : null,
      modelVersion: safeCast<String>(json['modelVersion']),
    );
  }
}

// Represents a single candidate response
class Candidate {
  final Content? content;
  final String? finishReason;
  final CitationMetadata? citationMetadata;
  final double? avgLogprobs;

  Candidate({
    this.content,
    this.finishReason,
    this.citationMetadata,
    this.avgLogprobs,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) {
    return Candidate(
      content: json['content'] != null
          ? Content.fromJson(json['content'] as Map<String, dynamic>)
          : null,
      finishReason: safeCast<String>(json['finishReason']),
      citationMetadata: json['citationMetadata'] != null
          ? CitationMetadata.fromJson(
              json['citationMetadata'] as Map<String, dynamic>)
          : null,
      avgLogprobs: safeCast<double>(json['avgLogprobs']),
    );
  }
}

// Represents the content of a candidate response
class Content {
  final List<Part>? parts;
  final String? role;

  Content({
    this.parts,
    this.role,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
      role: safeCast<String>(json['role']),
    );
  }
}

// Represents a single part within the content
class Part {
  final String? text;

  Part({
    this.text,
  });

  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      text: safeCast<String>(json['text']),
    );
  }
}

// Represents citation metadata
class CitationMetadata {
  final List<CitationSource>? citationSources;

  CitationMetadata({
    this.citationSources,
  });

  factory CitationMetadata.fromJson(Map<String, dynamic> json) {
    return CitationMetadata(
      citationSources: (json['citationSources'] as List<dynamic>?)
          ?.map((e) => CitationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// Represents a single citation source
class CitationSource {
  final int? startIndex;
  final int? endIndex;
  final String? uri;
  final String?
      license; // Added based on common API patterns, although not in your sample

  CitationSource({
    this.startIndex,
    this.endIndex,
    this.uri,
    this.license,
  });

  factory CitationSource.fromJson(Map<String, dynamic> json) {
    return CitationSource(
      startIndex: safeCast<int>(json['startIndex']),
      endIndex: safeCast<int>(json['endIndex']),
      uri: safeCast<String>(json['uri']),
      license:
          safeCast<String>(json['license']), // Handle potentially missing key
    );
  }
}

// Represents usage metadata for the API call
class UsageMetadata {
  final int? promptTokenCount;
  final int? candidatesTokenCount;
  final int? totalTokenCount;
  final List<PromptTokensDetail>? promptTokensDetails;
  final List<CandidatesTokensDetail>? candidatesTokensDetails;

  UsageMetadata({
    this.promptTokenCount,
    this.candidatesTokenCount,
    this.totalTokenCount,
    this.promptTokensDetails,
    this.candidatesTokensDetails,
  });

  factory UsageMetadata.fromJson(Map<String, dynamic> json) {
    return UsageMetadata(
      promptTokenCount: safeCast<int>(json['promptTokenCount']),
      candidatesTokenCount: safeCast<int>(json['candidatesTokenCount']),
      totalTokenCount: safeCast<int>(json['totalTokenCount']),
      promptTokensDetails: (json['promptTokensDetails'] as List<dynamic>?)
          ?.map((e) => PromptTokensDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      candidatesTokensDetails: (json['candidatesTokensDetails']
              as List<dynamic>?)
          ?.map(
              (e) => CandidatesTokensDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

// Represents details about prompt tokens
class PromptTokensDetail {
  final String? modality;
  final int? tokenCount;

  PromptTokensDetail({
    this.modality,
    this.tokenCount,
  });

  factory PromptTokensDetail.fromJson(Map<String, dynamic> json) {
    return PromptTokensDetail(
      modality: safeCast<String>(json['modality']),
      tokenCount: safeCast<int>(json['tokenCount']),
    );
  }
}

// Represents details about candidate tokens
class CandidatesTokensDetail {
  final String? modality;
  final int? tokenCount;

  CandidatesTokensDetail({
    this.modality,
    this.tokenCount,
  });

  factory CandidatesTokensDetail.fromJson(Map<String, dynamic> json) {
    return CandidatesTokensDetail(
      modality: safeCast<String>(json['modality']),
      tokenCount: safeCast<int>(json['tokenCount']),
    );
  }
}
