import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Product } from 'src/app/models/product';
import { CartService } from 'src/app/services/cart.service';
import { StoreService } from 'src/app/services/store.service';
import { MatDialog } from '@angular/material/dialog';
import { AddProductComponent } from './components/add-product/add-product.component';
import { Category } from 'src/app/models/category.model';

const ROWS_HEIGHT: { [id: number]: number } = { 1: 400, 3: 335, 4: 350 };

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
})
export class HomeComponent implements OnInit, OnDestroy {
  cols = 3;
  rowHeight: number = ROWS_HEIGHT[this.cols];
  products: Array<Product> | undefined;
  productsFiltrado: Array<Product> | undefined;
  count = '12';
  sort = 'asc';
  idCategory !: number;
  productsSubscription: Subscription | undefined;
  categoria !: Array<Category>

  constructor(
    private cartService: CartService,
    private storeService: StoreService,
    public dialog: MatDialog
  ) {}

  ngOnInit(): void {
    this.getCategoryId();
    this.getProducts();
  }

  onColumnsCountChange(colsNum: number): void {
    this.cols = colsNum;
    this.rowHeight = ROWS_HEIGHT[colsNum];
  }

  onItemsCountChange(count: number): void {
    this.count = count.toString();
    if (this.sort == 'desc') {
      this.products = this.productsFiltrado?.sort((a, b) => b.title.localeCompare(b.title)).slice(0,count);  
    } else {
      this.products = this.productsFiltrado?.sort((a, b) => a.title.localeCompare(b.title)).slice(0,count); 
    }
  }

  onSortChange(newSort: string): void {
    this.sort = newSort;
    if (this.sort == 'desc') {
      this.products = this.productsFiltrado?.sort((a, b) => b.title.localeCompare(a.title)); 
    } else {
      this.products = this.productsFiltrado?.sort((a, b) => a.title.localeCompare(b.title)); 
    }
  }

  onShowCategory(newCategory: any): void {
    this.idCategory = newCategory.id;
    this.products = this.productsFiltrado?.filter((obj) => {
      return obj.idCategory ===  this.idCategory;
    });
  }

getCategoryId(){
  this.storeService.getCategories()
  .subscribe((_categories) => {
    this.categoria = _categories;
  });
}
  getProducts(): void {
    this.productsSubscription = this.storeService
      .getProduct()
      .subscribe((_products) => {
        _products.forEach(obj =>  {
          this.categoria.forEach((element: Category) => {
            if(element.id=obj.idCategory)
            obj.category=element
          });
          //obj.category =  this.categoria
        })
        this.productsFiltrado = _products;
        this.products = this.productsFiltrado;
      });
  }

  onAddToCart(product: Product): void {
    this.cartService.addToCart({
      product: product.image,
      name: product.title,
      price: product.price,
      quantity: 1,
      id: product.id,
    });
  }

  ngOnDestroy(): void {
    if (this.productsSubscription) {
      this.productsSubscription.unsubscribe();
    }
  }

  addProduct(){
    this.dialog.open(AddProductComponent, {disableClose: true, width: '40%'})
    .afterClosed().subscribe({
      next: (result) => {
        if(result.data){
          this.getProducts();
        }
      },
      error: (error) => {
        console.error(error);
      }
    });
  }
}
