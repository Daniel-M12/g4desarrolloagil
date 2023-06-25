import { Component, OnInit } from '@angular/core';
import { ProductoComponent } from '../producto/producto.component';
import { Producto } from 'app/models/producto.model';

@Component({
  selector: 'app-listaproductos',
  templateUrl: './listaproductos.component.html',
  styleUrls: ['./listaproductos.component.scss']
})
export class ListaproductosComponent implements OnInit{
  productos: Producto[] = [{
    id: 1,
    nombre: 'Papas',
    categoria: 'Comida',
    precio: 15,
    imagen: '../../../assets/carrito_icon.png',
    cantidad: 10
  },
  {
    id: 2,
    nombre: 'Carne',
    categoria: 'Comida',
    precio: 20,
    imagen: '../../../assets/carrito_icon.png',
    cantidad: 10
  },
  {
    id: 3,
    nombre: 'Pan',
    categoria: 'Comida',
    precio: 5,
    imagen: '../../../assets/carrito_icon.png',
    cantidad: 10
  }];

  constructor() { }

  ngOnInit(): void {
  }
}
