package com.kuei.ecom.dto;

import com.kuei.ecom.entity.Address;
import com.kuei.ecom.entity.Customer;
import com.kuei.ecom.entity.Order;
import com.kuei.ecom.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Purchase {
    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;
}
