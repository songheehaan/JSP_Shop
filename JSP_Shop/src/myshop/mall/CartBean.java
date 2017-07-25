package myshop.mall;

import java.util.Vector;

import myshop.ProductDTO;

public class CartBean {
	ProductList list;
	Vector<ProductDTO> cart;
	
	public CartBean(){
		cart = new Vector<ProductDTO>(5,3);
	}
	
	public void setList(ProductList list){
		this.list = list;
	}
	
	public void addProduct(String sqty, String select, String pnum){
		for(ProductDTO dto : cart){
			if (dto.getPnum().equals(pnum)){
				dto.setPqty(Integer.parseInt(sqty) + dto.getPqty());
				return;
			}
		}
		ProductDTO pdto = list.getProduct(select, pnum);
		pdto.setPqty(Integer.parseInt(sqty));
		cart.add(pdto);
	}
	public Vector<ProductDTO> list(){
		return cart;
	}
	public void deleteProduct(String pnum){
		for(ProductDTO dto : cart){
			if (dto.getPnum().equals(pnum)){
				cart.remove(dto);
				return;
			}
		}
	}
	public void editProduct(String pnum, String sqty){
		int qty = Integer.parseInt(sqty);
		if (qty == 0){
			deleteProduct(pnum);
		}else {
			for(ProductDTO dto : cart){
				if (dto.getPnum().equals(pnum)){
					dto.setPqty(qty);
					return;
				}
			}
		}
	}
}








