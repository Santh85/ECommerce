package com.dao;

import java.util.List;

import com.model.Product;

public interface ProductDao {

	List<Product> getAllProducts();

	Product getProductById(String productId);

	void addProduct(Product product);
	

	
}
