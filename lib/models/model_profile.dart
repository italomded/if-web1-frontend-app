import 'model_generic.dart';
import 'model_transaction.dart';
import 'model_user.dart';

class Profile implements Generic {
  @override
  int? id;
  @override
  String? name;
  @override
  bool? status;
  List<User>? users;
  List<Transaction>? transactions;

  Profile({this.id, this.name, this.status, this.users, this.transactions});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
