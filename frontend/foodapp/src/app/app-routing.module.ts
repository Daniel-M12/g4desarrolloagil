import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { ListaproductosComponent } from './components/listaproductos/listaproductos.component';
import { ProductoComponent } from './components/producto/producto.component';


const routes: Routes = [
  {path:'', component: HomeComponent},
  {path:'home', component: HomeComponent},
  {path:'login', component: LoginComponent},
  {path:'productos', component: ListaproductosComponent},
  {path:'producto', component: ProductoComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
