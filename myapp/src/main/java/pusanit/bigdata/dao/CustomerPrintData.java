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

import pusanit.bigdata.myapp.model.Customer;
/**
 * CustomerPrintData.java
 * @author "Baniota"
 */
public class CustomerPrintData {
	//고객데이터 출력
	public void printCustomerData(Customer cust) {
		System.out.println("==========CUSTOMER INFO================");
		System.out.println("이름 : " + cust.getName());
		System.out.println("성별 : " + cust.getGender());
		System.out.println("이메일 : " + cust.getEmail());
		System.out.println("출생년도 : " + cust.getBirthYear());
		System.out.println("=======================================");
	}
}
