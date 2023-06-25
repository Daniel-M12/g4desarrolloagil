package dsa.grupo4.foodapp.controller;

import dsa.grupo4.foodapp.persistence.entity.ProductEntity;
import dsa.grupo4.foodapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/products")
public class ProductController {
    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("")
    public ResponseEntity<List<ProductEntity>> getAll(){
        return ResponseEntity.ok(productService.getAll());
    }
    @GetMapping("/{id}")
    public ResponseEntity<ProductEntity> getProduct(@PathVariable int id){
        return ResponseEntity.ok(productService.getById(id));
    }
    @GetMapping("/buscar")
    public ResponseEntity<List<ProductEntity>> getProduct(@RequestParam String name){
        return ResponseEntity.ok(productService.getByName(name));
    }
}
