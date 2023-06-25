package dsa.grupo4.foodapp.service;

import dsa.grupo4.foodapp.persistence.entity.ProductEntity;
import dsa.grupo4.foodapp.persistence.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{
    private final ProductRepository productRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository repository) {
        this.productRepository = repository;
    }

    @Override
    public List<ProductEntity> getAll() {
        return this.productRepository.findAll();
    }

    @Override
    public ProductEntity getById(int id) {
        return this.productRepository.findById(id).orElse(null);
    }

    @Override
    public List<ProductEntity> getByName(String name) {
        return this.productRepository.findAllByName(name);
    }
}
