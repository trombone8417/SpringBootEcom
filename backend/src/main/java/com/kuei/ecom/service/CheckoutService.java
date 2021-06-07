package com.kuei.ecom.service;

import com.kuei.ecom.dto.Purchase;
import com.kuei.ecom.dto.PurchaseResponse;

public interface CheckoutService {
    PurchaseResponse placeOrder(Purchase purchase);
}
