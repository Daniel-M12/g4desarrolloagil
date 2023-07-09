import { Category } from "./category.model";

export interface Product {
  id: number;
  title: string;
  price: number;
  //category: string;
  category: Category;
  description: string;
  image: string;
}
