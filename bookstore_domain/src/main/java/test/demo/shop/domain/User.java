package test.demo.shop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table
public class User implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String username;
    private String password;
    private Integer sex; //性别 ：
    private String email;
    private Integer role;
    private Date createDate;
    private Integer disabled; // 激活状态: 0 : 未激活, 1 : 已激活
    private String activeCode;
    private String name;
    @Transient
    private List<Address> addressList;
}
