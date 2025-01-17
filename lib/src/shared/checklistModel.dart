class ChecklistModel {
  List<Data>? data;

  ChecklistModel({this.data});

  ChecklistModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Questions>? questions;

  Data({
    this.questions,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class RepeatEnds {
  String? value;

  RepeatEnds({this.value});

  RepeatEnds.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}

class Questions {
  List<String>? fields;
  String? sId;
  String? title;
  String? description;
  bool remark = false;
  String? remarkData;
  String? type;
  int? maxline;
  bool? isMandatory;
  var answer;
  var correctAnswer; // for client-side validation

  Questions({
    this.fields,
    this.sId,
    this.title,
    this.description,
    required this.remark,
    this.type,
    this.maxline,
    this.isMandatory,
    this.correctAnswer,
  });

  Questions.fromJson(Map<String, dynamic> json) {
    fields = json['fields'].cast<String>();
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    remark = json['remark'];
    type = json['type'];
    maxline = json["maxline"] ?? 1;
    isMandatory = json['is_mandatory'];
    if (type == "checkbox") {
      answer = List.generate(fields!.length, (index) => false);
    }
    correctAnswer = json["correct_answer"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fields'] = type == "text" ? "300" : this.fields.toString();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['remark'] = this.remark;
    data["remark_data"] = this.remarkData;
    data['type'] = this.type;
    data['is_mandatory'] = this.isMandatory;
    data["maxline"] = this.maxline;
    data["answer"] = this.answer.toString();
    data["correct_answer"] = this.correctAnswer.toString();
    return data;
  }
}
