package dsa.grupo4.foodapp.persistence.repository;

import dsa.grupo4.foodapp.persistence.entity.ProductEntity;
import org.springframework.data.repository.ListCrudRepository;

import java.util.List;

public interface ProductRepository extends ListCrudRepository<ProductEntity,Integer> {
    List<ProductEntity> findAllByName(String name);
}
