package com.kuei.ecom.controller;

import com.kuei.ecom.dto.Purchase;
import com.kuei.ecom.dto.PurchaseResponse;
import com.kuei.ecom.service.CheckoutService;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("http://localhost:4200")
@RestController
@RequestMapping("/api/checkout")
public class CheckoutController {
    private CheckoutService checkoutService;

    public CheckoutController(CheckoutService checkoutService){
        this.checkoutService=checkoutService;
    }


    @PostMapping("/purchase")
    public PurchaseResponse purchaseResponse(@RequestBody Purchase purchase){
        PurchaseResponse purchaseResponse = checkoutService.placeOrder(purchase);
        return purchaseResponse;
    }
}
