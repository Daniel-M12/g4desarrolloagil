import { Component } from '@angular/core';
import { Input } from '@angular/core';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.scss']
})
export class ProductoComponent {
  @Input()
  nombre: String = '';

  @Input()
  precio: number = 0;

  @Input()
  imagen: String = '';
}
