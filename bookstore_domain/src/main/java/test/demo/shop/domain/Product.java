package test.demo.shop.domain;

import lombok.Data;
import lombok.ToString;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

@Data
@Table
@ToString
public class Product implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String title;
    private String author;
    private Double price;
    private Double discount;
    private String publisher;
    private Integer storage;
    private String image;
    private String description;
    private String categoryCode;
    private Date createDate;
    private Integer disabled; // 是否下架 0 : 下架, 1 : 上架
    @Transient
    private Double discountPrice;
    public Double getDiscountPrice() {
        return this.price * this.discount;
    }

}
