package test.demo.shop.domain;

import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Table
public class Category implements Serializable {
    @Id
    private String code;
    private String name;
    private String remark;
}
