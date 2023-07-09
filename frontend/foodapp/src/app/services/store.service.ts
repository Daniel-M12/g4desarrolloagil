import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product as Product2 } from '../models/product.model';
import { Product } from '../models/product';
import { Category } from '../models/category.model';

const STORE_BASE_URL = 'http://localhost:4200/assets';
//http://localhost:4200/assets/categories.json
@Injectable({
  providedIn: 'root',
})
export class StoreService {

  private URL = '../../assets/categories.json';
  private URLP = '../../assets/products.json';
  baseURL: string = "http://localhost:3000/";
  constructor(private httpClient: HttpClient) {}

  getAllProducts(
    limit = '12',
    sort = 'desc',
    category?: string
  ): Observable<Array<Product2>> {
    return this.httpClient.get<Array<Product2>>(
      `${this.URLP}${
        category ? '/category/' + category : ''
      }?sort=${sort}&limit=${limit}`
    );
  }

  getAllCategories(): Observable<Array<string>> {
    return this.httpClient.get<Array<string>>(
      `${this.URL}`
    );
  }

  getCategories(): Observable<Array<Category>> {
    return this.httpClient.get<Array<Category>>(
      `${this.baseURL}` + 'categories'
    );
  }

  getCategoriesId(id: number): Observable<Array<Category>> {
    return this.httpClient.get<Array<Category>>(
      `${this.baseURL}` + 'categories'+ '/?id=' + id
    );
  }

  getProduct(): Observable<Product[]> {
    console.log('getProduct '+this.baseURL + 'products')
    return this.httpClient.get<Product[]>(this.baseURL + 'products')
  }
 
  addProduct(product:Product): Observable<any> {
    const headers = { 'content-type': 'application/json'}  
    const body=JSON.stringify(product);
    return this.httpClient.post(this.baseURL + 'products', body,{'headers':headers})
  }

}
