package test.demo.shop.domain;

import lombok.Data;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@Table(name = "tb_order")
public class Order implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String orderCode;
    private Date createDate;
    private Date sendDate;
    private Integer status; //发货状态 0 : 未发货, 1 : 发货
    private Double amount; //订单总金额
    private Integer userId;
    private Integer payStatus; //支付状态 0 : 未支付, 1 : 已支付
    private Integer receiveStatus; //收货状态 0 : 未收到 1 : 已收到
    @Transient
    //订单详情
    private OrderDetail orderDetail;
    @Transient
    //二维码图片地址
    private String imgUrl;
    @Transient
    private List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
}
