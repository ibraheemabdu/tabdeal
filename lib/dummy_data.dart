import 'models/category_model.dart';
import 'models/popular_model.dart';
import 'models/sub_category_model.dart';


List<CategoryModel> categoryList = [
  CategoryModel(icon: 'assets/svg/shirt.svg', name: 'Shirt'),
  CategoryModel(icon: 'assets/svg/dress.svg', name: 'Dress'),
  CategoryModel(icon: 'assets/svg/jeans.svg', name: 'Jeans'),
  CategoryModel(icon: 'assets/svg/shoes.svg', name: 'Shoes'),
  CategoryModel(icon: 'assets/svg/hat.svg', name: 'Hat'),
];


List<SubCategoryModel> subCategoryList = [
  SubCategoryModel(name: 'Shirt'),
  SubCategoryModel(name: 'Dress'),
  SubCategoryModel(name: 'Jeans'),
  SubCategoryModel(name: 'Shoes'),
  SubCategoryModel(name: 'Hat'),
  SubCategoryModel(name: 'Shirt'),
  SubCategoryModel(name: 'Dress'),
  SubCategoryModel(name: 'Jeans'),
  SubCategoryModel(name: 'Shoes'),
  SubCategoryModel(name: 'Hat'),
];


List<PopularModel> popularList = [
  PopularModel(
    picture: 'assets/pictures/phone.jpeg',
    price: 350,
    title: 'IPhone 13',
  ),
  PopularModel(
    picture: 'assets/pictures/phone.jpeg',
    price: 500,
    title: 'IPhone 13',
  ),
  PopularModel(
    picture: 'assets/pictures/phone.jpeg',
    price: 150,
    title: 'IPhone 13',
  ),
  PopularModel(
    picture: 'assets/pictures/phone.jpeg',
    price: 75,
    title: 'IPhone 13',
  ),
];
