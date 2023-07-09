import { v4 as uuidv4 } from 'uuid';
import { Category } from './category.model';

export class Product {
    id !: number;
    title!:string;
    price!: number;
    idCategory!: number;
    description!:string;
    image!: string;
    //category!: string;
    category!: Category

    static buildFromForm(valuesForm: any): Product{
      const builded = new Product();
      builded.id = valuesForm == null ? uuidv4() : valuesForm.id;
      builded.title = valuesForm.title;
      builded.price = valuesForm.price;
      builded.idCategory = valuesForm.idCategory;
      builded.image = valuesForm.image;
      return builded;
    }
}