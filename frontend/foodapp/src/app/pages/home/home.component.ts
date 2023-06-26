import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Product } from 'src/app/models/product.model';
import { CartService } from 'src/app/services/cart.service';
import { StoreService } from 'src/app/services/store.service';

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
  category: string | undefined;
  productsSubscription: Subscription | undefined;

  constructor(
    private cartService: CartService,
    private storeService: StoreService
  ) {}

  ngOnInit(): void {
    this.getProducts();
  }

  onColumnsCountChange(colsNum: number): void {
    this.cols = colsNum;
    this.rowHeight = ROWS_HEIGHT[colsNum];
  }

  onItemsCountChange(count: number): void {
    this.count = count.toString();
    if (this.sort == 'desc') {
      this.products = this.productsFiltrado?.sort((a, b) => b.title.localeCompare(a.title)).slice(0,count); 
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

  onShowCategory(newCategory: string): void {
    this.category = newCategory;
    this.products = this.productsFiltrado?.filter((obj) => {
      return obj.category ===  this.category;
    });
  }

  getProducts(): void {
    this.productsSubscription = this.storeService
      .getAllProducts(this.count, this.sort, this.category)
      .subscribe((_products) => {
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
}
