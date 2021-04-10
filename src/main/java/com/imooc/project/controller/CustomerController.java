package com.imooc.project.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.imooc.project.entity.Customer;
import com.imooc.project.service.CustomerService;
import com.imooc.project.utils.MyQuery;
import com.imooc.project.utils.QueryUtil;
import com.imooc.project.utils.ResultUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 客户表 前端控制器
 * </p>
 *
 * @author xiaochen
 * @since 2021-04-02
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    /**
     * 进入列表页
     * @return
     */
    @GetMapping("toList")
    public String toList(){
        return "customer/customerList";
    }

    /**
     * 查询方法
     * @param param
     //* @param phone
    // * @param page
    // * @param limit
     * @return
     */
    /*@GetMapping("list")
    @ResponseBody
    public R<Map<String,Object>> list(String realName,String phone,Long page,Long limit){
        LambdaQueryWrapper<Customer> wrapper = Wrappers.<Customer>lambdaQuery()
                .like(StringUtils.isNotBlank(realName), Customer::getRealName, realName)
                .like(StringUtils.isNotBlank(phone), Customer::getPhone, phone)
                .orderByDesc(Customer::getCustomerId);
        Page<Customer> myPage = customerService.page(new Page<>(page, limit), wrapper);*/

    @GetMapping("list")
    @ResponseBody
    public R<Map<String,Object>> list(@RequestParam Map<String,String> param){

        MyQuery<Customer> myQuery= QueryUtil.buildMyQuery(param);

        Page<Customer> myPage = customerService.page(myQuery.getPage()
                                ,myQuery.getWrapper().orderByDesc("customer_id"));

        /*
           //链式调用，就不用创建构造器了
        Page<Customer> page1 = customerService.lambdaQuery() .like(StringUtils.isNotBlank(realName), Customer::getRealName, realName)
                .like(StringUtils.isNotBlank(phone), Customer::getPhone, phone)
                .orderByDesc(Customer::getCustomerId).page(new Page<>(page,limit));
        return ResultUtil.bulidPageR((page1));*/


        return ResultUtil.buildPageR(myPage);

    }

    /**
     * 进入新增页
     * @return
     */
    @GetMapping("toAdd")
    public String toAdd(){
         return "customer/customerAdd";
    }

    /**
     * 新增客户
     * @param customer
     * @return
     */
    @PostMapping
    @ResponseBody
    public R<Object> add(@RequestBody Customer customer){
       // boolean success = customerService.save(customer);
       return ResultUtil.buildR(customerService.save(customer));

    }



    /**
     * 进入修改页
     * @return
     */
    @GetMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable Long id, Model model){
        Customer customer = customerService.getById(id);
        model.addAttribute("customer",customer);
        return "customer/customerUpdate";
    }

    /**
     * 修改客户
     * @param customer
     * @return
     */
    @PutMapping
    @ResponseBody
    public R<Object> update(@RequestBody Customer customer){
        // boolean success = customerService.save(customer);
        return ResultUtil.buildR(customerService.updateById(customer));

    }





    /**
     * 逻辑删除客户
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    @ResponseBody
    public R<Object> delete(@PathVariable Long id){

       // return ResultUtil.buildR(customerService.removeById(id));//逻辑删除客户

        Customer customer=new Customer();
        customer.setCustomerId(id);
        return ResultUtil.buildR(customerService.removeByIdWithFill(customer));//逻辑删除客户带自动填充功能

    }


    /**
     * 进入详情页
     * @return
     */
    @GetMapping("toDetail/{id}")
    public String toDetail(@PathVariable Long id, Model model){
        Customer customer = customerService.getById(id);
        model.addAttribute("customer",customer);
        return "customer/customerDetail";
    }




}
