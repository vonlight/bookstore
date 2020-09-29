package test.demo.shop.domain;

import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

@Data
@Table(name = "order_product")
public class OrderProduct implements Serializable {
    @Id
    private Integer orderId;
    @Id
    private Integer productId;
    private Integer orderNum;
    @Transient
    private Product product;
}
