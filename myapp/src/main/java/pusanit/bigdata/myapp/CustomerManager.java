package pusanit.bigdata.myapp;

import java.util.Scanner;

public class CustomerManager {

	static final int MAX = 100;
	static String[] nameList = new String[MAX];
	static char[] genderList = new char[MAX];
	static String[] emailList = new String[MAX];
	static int[] birthList = new int[MAX];
	
	static int index = -1;
	static int count = 0;
	static Scanner sc = new Scanner(System.in);
	private static int[] birthYearList = new int[MAX];
	
	public static void main(String[] args) {
		System.out.println("고객관리 프로그램");
		
		while(true) {
			System.out.println("(I)nsert, (P)revious, (N)ext, (U)pdate, (D)elete, (Q)uit");
			System.out.println("메뉴 입력");
			String menu = sc.next();
			if (menu.contentEquals("Q")) {
				sc.close();
				System.out.println("프로그램 종료데스");
				System.exit(0);
				}
			else if (menu.contentEquals("I")) {
				System.out.println("정보 입력");
				if (count >= MAX)
					System.out.println("입력 불가능");
				else {
					insertCustomer();
					System.out.println("저장완료");
				}
					
			}
			else if (menu.contentEquals("P")) {
				if (index <= 0)
					System.out.println("이전 정보 없음");
				else {
					index--;
					printCustomer();
				}
			}
			else if (menu.contentEquals("N")) {
				if (index >= count - 1)
					System.out.println("다음 정보 없음");
				else {
					index++;
					printCustomer();
				}
			}
			else if (menu.contentEquals("U")) {
				if ((index >= 0) && (index < count)) {
					System.out.println(index + "번째 정보 수정");
					updateCustomer();
				}
				else
					System.out.println("수정할 정보 선택x");
			}
			else if (menu.contentEquals("D")){
				if ((index >= 0) && (index < count)) {
					System.out.println(index + "번째 정보 삭제");
					deleteCustomer();
				}
				else
					System.out.println("삭제할 정보 선택x");
			}
			else
				System.out.println("메뉴 선택 오류");
				break;
			}
							
			}
	
	
	

	public static void insertCustomer() {
		System.out.print("이름 : ");
		String name = sc.next();
		System.out.print("성별(M/F) : ");
		char gender = sc.next().charAt(0);
		System.out.print("이메일 : ");
		String email = sc.next();
		System.out.print("출생년도 : ");
		int birthYear = sc.nextInt();

		// 고객 객체를 배열에 저장
		// count 번째 배열에 객체 저장 후 count 값을 증가시켜야 함
		nameList[count] = name;
		genderList[count] = gender;
		emailList[count] = email;
		birthYearList[count] = birthYear;
		count++;
	}
	public static void updateCustomer() {
		System.out.println("---------UPDATE CUSTOMER INFO----------");
		System.out.print("이름(" + nameList[index] + ") :");
		nameList[index] = sc.next();

		System.out.print("성별(" + genderList[index] + ") :");
		genderList[index] = sc.next().charAt(0);

		System.out.print("이메일(" + emailList[index] + ") :");
		emailList[index] = sc.next();

		System.out.print("출생년도(" + birthYearList[index] + ") :");
		birthYearList[index] = sc.nextInt();
		}
	public static void deleteCustomer() {
		for (int i = index; i < count - 1; i++) {
			nameList[i] = nameList[i + 1];
			genderList[i] = genderList[i + 1];
			emailList[i] = emailList[i + 1];
			birthYearList[i] = birthYearList[i + 1];
		}
		count--;
	}
	public static void printCustomer() {
		System.out.println("==========CUSTOMER INFO================");
		System.out.println("이름 : " + nameList[index]);
		System.out.println("성별 : " + genderList[index]);
		System.out.println("이메일 : " + emailList[index]);
		System.out.println("출생년도 : " + birthYearList[index]);
		System.out.println("=======================================");
	}
	
}


