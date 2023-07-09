import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Category } from 'src/app/models/category.model';
import { Product } from 'src/app/models/product';
import { StoreService } from 'src/app/services/store.service';
import { saveAs } from 'file-saver';
import { Observable, ReplaySubject } from 'rxjs';

@Component({
  selector: 'app-add-product',
  templateUrl: './add-product.component.html',
  styleUrls: ['./add-product.component.scss']
})
export class AddProductComponent implements OnInit {
  addProductForm!: FormGroup
  categories!: Category[];
  selectedFile: File | undefined
  image : any
  rootPath: string = "D://UPC2023//g4desarrolloagil//frontend//foodapp//src//assets//img//";

  constructor(
    private formBuilder: FormBuilder,
    private storeService: StoreService,
    public dialog: MatDialogRef<AddProductComponent>
  ) { }

  ngOnInit(): void {
    this.init();
  }

  saveProduct(): void{
    if(this.addProductForm.valid){
      this.saveImage(this.addProductForm.value.image).subscribe(base64 => {
        const product = Product.buildFromForm(this.addProductForm.value);
        product.image = base64;
        this.storeService.addProduct(product)
        .subscribe({
          next: (result) => {
            this.dialog.close({data: true});
          },
          error: (error) => {
            console.error(error);
            this.dialog.close({data: false});
          }
        });
      });      
    }else{
      alert("Invalid Form");
      throw new Error("Invalid Form");
      
    }
  }

  private init(){
    this.buildForm();
    this.getCategories();
  }

  private buildForm(){
    this.addProductForm = this.formBuilder.group({
      title: ['', Validators.required],
      price: [0.00, Validators.required],
      idCategory: [null, Validators.required],
      description: ['', Validators.required],
      image: ['', Validators.required],
    });
  }

  private getCategories(){
    this.storeService.getCategories()
    .subscribe({
      next: (result) => {
        this.categories = result;
      },
      error: (error) => {
        console.error(error);
      }
    });
  }

  private saveImage(fileInput: any) : Observable<string>{
    let file = fileInput.files[0];
    const result = new ReplaySubject<string>(1);
    const reader = new FileReader();
    reader.readAsBinaryString(file);
    reader.onload = (event) => {
      if(event!=null && event.target!=null && event.target.result!=null){
        result.next(btoa(event.target.result.toString()))
      }
    };
    return result;
  }

}
