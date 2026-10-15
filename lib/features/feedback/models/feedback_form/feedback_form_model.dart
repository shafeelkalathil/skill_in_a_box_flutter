import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_form_model.g.dart';

@JsonSerializable()
class FeedbackFormModel {
 FeedbackFormModel({
   this.form,
 });

 factory FeedbackFormModel.fromJson(Map<String, dynamic> json) =>
     _$FeedbackFormModelFromJson(json);

 final Form? form;

 Map<String, dynamic> toJson() => _$FeedbackFormModelToJson(this);
}

@JsonSerializable()
class Form {
 Form({
   this.id,
   this.name,
   this.usage,
   this.recipient,
   this.courseId,
   this.content,
 });

 factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? name;
 final String? usage;
 final String? recipient;
 final String? courseId;
 final List<Content>? content;

 Map<String, dynamic> toJson() => _$FormToJson(this);
}

@JsonSerializable()
class Content {
 Content({
   this.id,
   this.question,
   this.type,
   this.isMandatory,
   this.allowMultipleAnswer,
   this.options,
   this.scaleCount,
 });

 factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

 @JsonKey(name: '_id')
 final String? id;
 final String? question;
 final String? type;
 final bool? isMandatory;
 final bool? allowMultipleAnswer;
 final List<String>? options;
 final int? scaleCount;

 Map<String, dynamic> toJson() => _$ContentToJson(this);
}