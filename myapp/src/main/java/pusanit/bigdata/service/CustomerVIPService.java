package pusanit.bigdata.myapp.service;

import java.util.ArrayList;
import java.util.Scanner;

import pusanit.bigdata.myapp.dao.CustomerDeleteData;
import pusanit.bigdata.myapp.dao.CustomerInputData;
import pusanit.bigdata.myapp.dao.CustomerPrintData;
import pusanit.bigdata.myapp.dao.CustomerUpdateData;
import pusanit.bigdata.myapp.model.Customer;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CustomerVIPService implements ICustomerService {

	@Override
	public String run(String name) {
		//고객 정보를 저장할 자료구조 선언
		ArrayList<Customer> custList = new ArrayList<Customer>();

		//리스트 정보를 조회하기 위해 인덱스를 필요로 함
		int index = -1;

		int count = 0;//custList.size()

		//기본 입력장치로부터 데이터를 입력받기 위해 Scanner객체 생성
		Scanner scan = new Scanner(System.in);

		AbstractApplicationContext context = new GenericXmlApplicationContext("application-config.xml");
		CustomerInputData custInput = context.getBean(CustomerInputData.class);
		CustomerPrintData custPrint = context.getBean(CustomerPrintData.class);
		CustomerDeleteData custDelete = context.getBean(CustomerDeleteData.class);
		CustomerUpdateData custUpdate = context.getBean(CustomerUpdateData.class);

		while(true) {
			count = custList.size();
			System.out.printf("\n[INFO] 고객 수 : %d, 인덱스 : %d\n", count, index);
			System.out.println("메뉴를 입력하세요.");
			System.out.println("(I)nsert, (P)revious, (N)ext, " +
					"(C)urrent, (U)pdate, (D)elete, (Q)uit");
			System.out.print("메뉴 입력: ");
			String menu = scan.next();
			menu = menu.toLowerCase();	//입력한 문자열을 모두소문자로 변환
			switch(menu.charAt(0)) {
			case 'i':
				System.out.println("VIP 고객정보 입력을 시작합니다.");
				custList.add(custInput.insertCustomerData(scan));
				System.out.println("VIP 고객정보를 입력했습니다.");
				break;
			case 'p' :
				System.out.println("이전 데이터를 출력합니다.");
				if(index <= 0) {
					System.out.println("이전 데이터가 존재하지 않습니다.");
				}else {
					index--;
					custPrint.printCustomerData(custList.get(index));
				}
				break;
			case 'n' :
				System.out.println("다음 데이터를 출력합니다.");
				if(index >= count-1) {
					System.out.println("다음 데이터가 존재하지 않습니다.");
				}else {
					index++;
					custPrint.printCustomerData(custList.get(index));
				}
				break;
			case 'c' :
				System.out.println("현재 데이터를 출력합니다.");
				if( (index >= 0) && (index < count)) {
					custPrint.printCustomerData(custList.get(index));
				}else {
					System.out.println("출력할 데이터가 선택되지 않았습니다.");
				}
				break;			
			case 'u' :
				System.out.println("데이터를 수정합니다.");
				if( (index >= 0) && (index < count)) {
					System.out.println(index + "번째 데이터를 수정합니다.");
					custList.add(index, custUpdate.updateCustomerData(custList.get(index), scan));
				}else {
					System.out.println("수정할 데이터가 선택되지 않았습니다.");
				}
				break;
			case 'd' :
				System.out.println("데이터를 삭제합니다.");
				if( (index >= 0) && (index < count)) {
					System.out.println(index + "번째 데이터를 삭제합니다.");
					custList = custDelete.deleteCustomerData(custList, index);
				}else {
					System.out.println("삭제할 데이터가 선택되지 않았습니다.");
				}
				break;
			case 'q' :
				System.out.println("프로그램을 종료합니다.");
				context.close();
				scan.close();	//Scanner 객체를 닫아준다.
				System.exit(0);	//프로그램을 종료시킨다.
				break;	
			default : 
				System.out.println("메뉴를 잘 못 입력했습니다.");	
			}//end switch
		}//end while
	}
}