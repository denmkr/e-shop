package ru.dm.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.dm.shop.domain.UserDetail;
import ru.dm.shop.entity.Cart;
import ru.dm.shop.entity.CartProduct;
import ru.dm.shop.entity.Product;
import ru.dm.shop.entity.User;
import ru.dm.shop.repository.CartProductRepository;
import ru.dm.shop.service.CartProductService;
import ru.dm.shop.service.ProductService;
import ru.dm.shop.service.UserService;

import javax.annotation.Resource;

@Service
public class CartProductServiceImpl implements CartProductService {

    @Resource
    public CartProductRepository cartProductRepository;
    @Autowired
    public UserService userService;
    @Autowired
    public ProductService productService;

    @Override
    @Transactional
    public boolean addProduct(Product product) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        if (authentication != null) {
            UserDetail userDetail = (UserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user = (ru.dm.shop.entity.User) userDetail.getUser();
        }

        CartProduct cartProduct;
        cartProduct = cartProductRepository.findByUserIdAndProductId(userService.findByEmail(user.getEmail()).getId(), productService.findByCode(product.getCode()).getId());

        if (cartProduct != null) {
            Integer count = cartProduct.getCount();
            product = productService.findByCode(product.getCode());
            cartProductRepository.updateProductInCart(count + 1, userService.findByEmail(user.getEmail()).getId(), product);
        }
        else {
            cartProduct = new CartProduct();
            cartProduct.setProduct(productService.findByCode(product.getCode()));
            cartProduct.setUserId(userService.findByEmail(user.getEmail()).getId());
            cartProduct.setCount(1);
            cartProductRepository.saveAndFlush(cartProduct);
        }

        return true;

    }

    @Override
    public boolean setProductAmount(Product product, Integer amount) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        if (authentication != null) {
            UserDetail userDetail = (UserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user = (User) userDetail.getUser();
        }

        CartProduct cartProduct;
        cartProduct = cartProductRepository.findByUserIdAndProductId(userService.findByEmail(user.getEmail()).getId(), productService.findByCode(product.getCode()).getId());

        // Integer count = cartProduct.getCount();

        if (amount > 0) {
            product = productService.findByCode(product.getCode());
            cartProductRepository.updateProductInCart(amount, userService.findByEmail(user.getEmail()).getId(), product);
        }
        else cartProductRepository.delete(cartProduct);

        return true;
    }

    @Override
    @Transactional
    public Cart getCart() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        if (authentication != null) {
            UserDetail userDetail = (UserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user = (User) userDetail.getUser();
        }

        PageRequest pageRequest = new PageRequest(0, 100, Sort.Direction.ASC, "product");
        Page<CartProduct> cartProducts = null;

        if (authentication != null) cartProducts = cartProductRepository.findByUserId(userService.findByEmail(user.getEmail()).getId(), pageRequest);

        Cart cart = new Cart();

        if (cartProducts != null) cart.setProducts(cartProducts.getContent());

        return cart;
    }

    @Override
    @Transactional
    public boolean removeProduct(Product product) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        if (authentication != null) {
            UserDetail userDetail = (UserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user = (User) userDetail.getUser();
        }

        CartProduct cartProduct = cartProductRepository.findByUserIdAndProductId(userService.findByEmail(user.getEmail()).getId(), productService.findByCode(product.getCode()).getId());

        Integer count = cartProduct.getCount();
        if (count > 1) {
            product = productService.findByCode(product.getCode());
            cartProductRepository.updateProductInCart(count - 1, userService.findByEmail(user.getEmail()).getId(), product);
        }
        else cartProductRepository.delete(cartProduct);

        return true;
    }

    @Override
    public boolean removeProducts(Product product) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        if (authentication != null) {
            UserDetail userDetail = (UserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user = (User) userDetail.getUser();
        }

        CartProduct cartProduct = cartProductRepository.findByUserIdAndProductId(userService.findByEmail(user.getEmail()).getId(), productService.findByCode(product.getCode()).getId());

        cartProductRepository.delete(cartProduct);

        return true;
    }

    @Override
    public boolean removeAllProducts() {
        cartProductRepository.deleteAll();

        return true;
    }

    @Override
    public boolean removeCart(Cart cart) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = null;
        if (authentication != null) {
            UserDetail userDetail = (UserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            user = (User) userDetail.getUser();
        }

        cartProductRepository.deleteProductInCart(userService.findByEmail(user.getEmail()).getId());

        return true;
    }

}