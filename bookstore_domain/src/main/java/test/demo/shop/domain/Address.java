package test.demo.shop.domain;

import lombok.Data;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Data
public class Address {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id ;
    private String name;
    private String phone;
    private Integer userId;
    private Integer disabled; // 是否默认 : 0 : 否 1 : 是
    private String province;
    private String city;
    private String district;
    private String detail;
}
