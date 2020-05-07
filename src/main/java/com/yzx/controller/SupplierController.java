package com.yzx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzx.pojo.Supplier;
import com.yzx.service.SupplierService;

/**
 * @author YZX
 * @date 2020年5月3日
 * @time 上午7:24:39
 */
@Controller
public class SupplierController {
	@Autowired
	private SupplierService supplierServiceImpl;
	
	@RequestMapping("add_supplier_con")
	@ResponseBody()
	public int add_supplier_con(String name,String add,String dadd,String person,String tel,String remark){
		Supplier supplier = new Supplier();
		supplier.setSupname(name);
		supplier.setAddress(add);
		supplier.setDetailaddress(dadd);
		supplier.setContactperson(person);
		supplier.setTel(tel);
		supplier.setRemark(remark);
		return supplierServiceImpl.addSupplier(supplier);
	}
	
	
	@RequestMapping("detail_supplier")
	public String supplier(int id, HttpServletRequest req) {
		Supplier supplier = supplierServiceImpl.selById(id);
		req.setAttribute("supplier", supplier);
		return "detail_supplier";
	}
	
	@RequestMapping("delete_supplier")
	public String delete_product(int id, HttpServletRequest req) {
		supplierServiceImpl.delSupplier(id);
		return "search_supplier";
	}
	
	@RequestMapping("modify_supplier")
	@ResponseBody()
	public int modify_product(int id,String supname,String address,String detailaddress,String contactperson,String tel,String remark){
		Supplier supplier = new Supplier();
		supplier.setId(id);
		supplier.setSupname(supname);
		supplier.setAddress(address);
		supplier.setDetailaddress(detailaddress);
		supplier.setContactperson(contactperson);
		supplier.setTel(tel);
		supplier.setRemark(remark);
		return supplierServiceImpl.updSupplier(supplier);
	}
	
	@RequestMapping("supplierCount")
	@ResponseBody()
	public int supplierCount() {
		return supplierServiceImpl.selSupplierCount();
	}
	
	@RequestMapping("supplierContent")
	@ResponseBody()
	public List<Supplier> supplierContent(int pageNumber, int pageSize) {
		List<Supplier> list = supplierServiceImpl.selSupplier(pageNumber, pageSize);
		return list;
	}
	
}
