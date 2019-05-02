/************************************************************
 * 시스템 명 : 
 * 업무명 :
 * 프로그램명(ID) :
 * 프로그램 설명 :
 * 
 * 작성일 : 2018. 7. 5.
 * 작성자 : "Baniota"
 *
 * 수정자     수정일자     수정내역
 * ------    ----------    ---------------------------------
 * "Baniota"    2018. 7. 5.    최초 생성
 *
 ************************************************************/
package pusanit.bigdata.myapp.dao;

import java.util.ArrayList;

import pusanit.bigdata.myapp.model.Customer;

/**
 * CustomerDeleteData.java
 * @author "Baniota"
 */
public class CustomerDeleteData {
	//index 위치의 고객정보를 삭제합니다.
	public ArrayList<Customer> deleteCustomerData(ArrayList<Customer> custList, int index) {
		custList.remove(index);
		return custList;
	}
}
