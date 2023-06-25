package dsa.grupo4.foodapp.service;

import dsa.grupo4.foodapp.persistence.entity.ProductEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {
    List<ProductEntity> getAll();
    ProductEntity getById(int id);
    List<ProductEntity> getByName(String name);
}
