package test.demo.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table
public class Shopcar {
    private Integer buynum;
    @Id
    private Integer userId;
    @Id
    private Integer productId;
    @Transient
    private Product product;
}
