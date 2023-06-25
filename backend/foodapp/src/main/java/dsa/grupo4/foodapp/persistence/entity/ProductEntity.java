package dsa.grupo4.foodapp.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "product")
@Getter
@Setter
@NoArgsConstructor
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false)
    private Integer idProduct;
    @Column(nullable = false, length = 30, unique = true)
    private String name;
    @Column(nullable = false, length = 30, unique = true)
    private String category;
    @Column(nullable = false, columnDefinition = "Decimal(5,2)")
    private Double price;
    @Column(nullable = false, length = 255, unique = true)
    private String image;
    @Column(nullable = false)
    private Integer stock;

}
