import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Product } from '../models/product.model';

const STORE_BASE_URL = 'http://localhost:4200/assets';
//http://localhost:4200/assets/categories.json
@Injectable({
  providedIn: 'root',
})
export class StoreService {

  private URL = '../../assets/categories.json';
  private URLP = '../../assets/products.json';

  constructor(private httpClient: HttpClient) {}

  getAllProducts(
    limit = '12',
    sort = 'desc',
    category?: string
  ): Observable<Array<Product>> {
    return this.httpClient.get<Array<Product>>(
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
}
