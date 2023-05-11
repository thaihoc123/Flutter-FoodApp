class FoodModel {
  int? id;
  String? image;
  String? name;
  String? decription;
  double? price;
  int? quantity;

  FoodModel({
    this.id,
    this.image,
    this.name,
    this.decription,
    this.price,
    this.quantity,
  });
}

List<FoodModel> foodList = [
  FoodModel(
    id: 1,
    image: 'images/Food_1.png',
    name: 'Chicken Fried',
    decription: 'Chiecken Fried decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 2,
    image: 'images/Food_2.png',
    name: 'Pork Burrito',
    decription: 'Pork Burrito decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 3,
    image: 'images/Food_3.png',
    name: 'Steak Burrito',
    decription: 'Steak Burrito decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 4,
    image: 'images/Food_2.png',
    name: 'Guacamole',
    decription: 'Guacamole decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 5,
    image: 'images/Food_3.png',
    name: 'Beef',
    decription: 'Beef decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 6,
    image: 'images/Food_1.png',
    name: 'Honey',
    decription: 'Honey decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 7,
    image: 'images/Food_2.png',
    name: 'Duck',
    decription: 'Duck decription',
    price: 18,
    quantity: 1,
  ),
  FoodModel(
    id: 8,
    image: 'images/Food_3.png',
    name: 'Pork whiterice Bowl',
    decription: 'Pork whiterice Bowl decription',
    price: 23.9,
    quantity: 1,
  ),
  FoodModel(
    id: 9,
    image: 'images/Food_1.png',
    name: 'Tacos',
    decription: 'Tacos decription',
    price: 18,
    quantity: 1,
  ),
];
