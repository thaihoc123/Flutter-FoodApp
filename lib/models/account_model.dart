class AccountModel {
  int? id;
  String? name;
  String? image;
  String? username;
  String? password;

  AccountModel({
    this.id,
    this.name,
    this.image,
    this.password,
    this.username,
  });
}

List<AccountModel> accountList = [
  AccountModel(
      id: 1,
      name: 'Admin Thai Hoc',
      image: 'images/hoc2.png',
      username: 'thaihoc2le2',
      password: 'thaihoc123'),
  AccountModel(
      id: 2,
      name: 'Quang Trinh',
      image: 'images/trinh.png',
      username: 'trinh123',
      password: 'trinh123'),
  AccountModel(
      id: 3,
      name: 'Dinh Truyen',
      image: 'images/truyen.png',
      username: 'truyen123',
      password: 'truyen123'),
];
