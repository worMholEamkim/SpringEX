package com.ssaga.human.service;

import java.io.File;
import java.io.FileInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssaga.human.dao.PayDao;
import com.ssaga.human.dto.EmployeeDto;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDao payDao;

	@Override
	public String payLogin(String comcode, String pid, String pwd, HttpSession session) {

		HashMap<String,String> hmForPayLogin = new HashMap<>();
		hmForPayLogin.put("comcode", comcode);
		hmForPayLogin.put("pid", pid);
		String dbPass = payDao.payLogin(hmForPayLogin);
		String view = null;

		if (dbPass == null) {
			view ="pages/login";
		}else { 
			if(dbPass.equals(pwd)) {
				//session.invalidate(); HttpServletRequest
				session.setAttribute("comcode", comcode);
				session.setAttribute("pid", pid);
				view ="pages/index";
			}else {
				view = "pages/login";
			}
		}
		return view;
	}

	@Override
	public List<EmployeeDto> empList() {
		return payDao.empList();
	}

	@Override
	public void empAdd(EmployeeDto employee) {
		payDao.empAdd(employee);
	}

	@Override
	public EmployeeDto viewEmp(String empno) {
		return payDao.viewEmp(empno);
	}

	@Override
	public EmployeeDto empforUpd(String empno, HttpSession session) {
		HashMap<String,String> hmForUpd = new HashMap<>();
		hmForUpd.put("comcode", (String) session.getAttribute("comcode"));
		hmForUpd.put("empno", empno);
		
		return payDao.empforupd(hmForUpd);
	}

	@Override
	public void updEmployee(EmployeeDto employee) {
		payDao.updEmployee(employee);
		
	}

	@Override
	public void updEmployee2(EmployeeDto employee) {
		payDao.updEmployee2(employee);
	}

	@Override
	public void empDel(EmployeeDto employee) {
		payDao.empDel(employee);
		
	}

	//Excel java Date
	private DateFormat dateFormatG = new SimpleDateFormat( "EEE MMM dd HH:mm:ss zzz yyyy", Locale.ROOT);
		
	@Resource(name="saveDir")
	private String saveDir;

	
	
	
	
	
	@Override
	public String addEmpFile(EmployeeDto employee, MultipartFile empFile, HttpSession session) {

		File savePath = new File(saveDir + session.getAttribute("comcode") + "/Employee");
		String fname =empFile.getOriginalFilename();

		if(!empFile.isEmpty()) {
			if(!savePath.exists()) {
				//해당 디렉토리가 없으면 생성한다.
				savePath.mkdirs();
			}
			//Save the file
			try {
				empFile.transferTo(new File(savePath + "/" + fname));
			}catch (Exception e) {};
		}
		
		//Excel File Batch Processing
		Workbook workbook = null;
		Sheet sheet = null;
		try{
			workbook = getWorkBook(new File(savePath + "/" + fname));
			sheet = workbook.getSheetAt(0);
			/*Read and process each Row*/
			Iterator<Row> rowIterator = sheet.iterator();
			int rcnt = 0;
			while(rowIterator.hasNext()){
				Row row = rowIterator.next();
				rcnt++;
				if (rcnt <= 2 ) continue; //Pass head part of Excel File.
				//Read and process each column in row
				int count=0;
				// Down Cast Object to String
				employee.setPID((String)session.getAttribute("pid"));
				employee.setCOMCODE((String)session.getAttribute("comcode"));
				while(count<row.getLastCellNum()){
					Object inputCellValue = getCellValueBasedOnCellType(row,count++);
					//count++ 후위 연산
					switch (count) {
				       case 1:
				    	   employee.setCOMCODE((String)inputCellValue); break;
				       case 2:
				    	   employee.setEMPNO((String)inputCellValue); break;
				       case 3:
				    	   employee.setEMPNAME((String)inputCellValue); break;
				       case 4:
				    	   employee.setLOCA((String)inputCellValue); break;
				       case 5:
				    	   employee.setTITLE((String)inputCellValue); break;
				       case 6:
				    	   employee.setDEPT((String)inputCellValue); break;
				       case 7:
				    	   //Excel GMT format  to String java Date
				    	   Date sdate = dateFormatG.parse((String)inputCellValue);
				    	   //Format sdate
				    	   DateFormat dateFormatS = new SimpleDateFormat("yyyy-MM-dd");
				    	   employee.setINDATE(dateFormatS.format(sdate)); break;
				       case 8:
				    	   employee.setRMK((String)inputCellValue);
				    	   break;
				       case 9:
				    	   if (inputCellValue =="") {
				    		   employee.setMSALARY((float) 0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   float fltValue = Float.parseFloat(strValue.toString());
				    		   employee.setMSALARY(fltValue); break;
				    	   }
				       case 10:
				    	   if (inputCellValue =="") {
				    		   employee.setBTIME(0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   strValue = (String)strValue.subSequence(0,strValue.indexOf("."));
				    		   employee.setBTIME(Integer.parseInt(strValue)); break;
				    	   }
				       case 11:
				    	   if (inputCellValue =="") {
				    		   employee.setETIME(0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   strValue = (String)strValue.subSequence(0,strValue.indexOf("."));
				    		   employee.setETIME(Integer.parseInt(strValue)); break;
				    	   }
				       case 12:
				    	   if (inputCellValue =="") {
				    		   employee.setATIME(0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   strValue = (String)strValue.subSequence(0,strValue.indexOf("."));
				    		   employee.setATIME(Integer.parseInt(strValue)); break;
				    	   }
				       case 13:
				    	   if (inputCellValue =="") {
				    		   employee.setMEAL((float) 0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   float fltValue = Float.parseFloat(strValue.toString());
				    		   employee.setMEAL(fltValue); break;
				    	   }
				       case 14:
				    	   if (inputCellValue =="") {
				    		   employee.setSELFCAR((float) 0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   float fltValue = Float.parseFloat(strValue.toString());
				    		   employee.setSELFCAR(fltValue); break;
				    	   }
				       case 15:
				    	   if (inputCellValue =="") {
				    		   employee.setBABY((float) 0); break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   float fltValue = Float.parseFloat(strValue.toString());
				    		   employee.setBABY(fltValue); break;
				    	   }
				       case 16:
				    	   employee.setADDR1((String)inputCellValue); break;
				       case 17:
				    	   employee.setADDR2((String)inputCellValue); break;
				       case 18:
				    	   employee.setEMAIL((String)inputCellValue); break;
				       case 19:
				    	   employee.setHTEL((String)inputCellValue); break;
				       case 20:
				    	   employee.setMTEL((String)inputCellValue); break;
				       case 21:
				    	   employee.setSEX((String)inputCellValue); break;
				       case 22:
				    	   employee.setREGNUM((String)inputCellValue); break;
				       case 23:
				    	   employee.setBANKNAME((String)inputCellValue); break;
				       case 24:
				    	   employee.setACCNUM((String)inputCellValue); break;
				       case 25:
				    	   employee.setMARRIAGE((String)inputCellValue);
				    	   break;
				       case 26:
				    	   if (inputCellValue =="") {
				    		   employee.setCHILDNO(0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   strValue = (String)strValue.subSequence(0,strValue.indexOf("."));
				    		   employee.setCHILDNO(Integer.parseInt(strValue)); break;
				    	   }
				       case 27:
				    	   if (inputCellValue =="") {
				    		   employee.setCHILD6NO(0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   strValue = (String)strValue.subSequence(0,strValue.indexOf("."));
				    		   employee.setCHILD6NO(Integer.parseInt(strValue)); break;
				    	   }
				       case 28:
				    	   if (inputCellValue =="") {
				    		   employee.setCAR(0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   strValue = (String)strValue.subSequence(0,strValue.indexOf("."));
				    		   employee.setCAR(Integer.parseInt(strValue)); break;
				    	   }
				       case 29:
				    	   if (inputCellValue =="") {
				    		   employee.setNPENSION((float) 0);break;
				    	   }else {
				    		   String strValue = (String)inputCellValue;
				    		   employee.setNPENSION(Float.parseFloat(strValue)); break;
				    	   }
				       case 30:
				    	   employee.setGUBUN((String)inputCellValue); break;
				       case 31:
				    	   employee.setGUBUN1((String)inputCellValue); break;
				       case 32:
				    	   employee.setEIEMP((String)inputCellValue); break;
					} //close switch
				} //close while for cell values
				//[월급]/([기본시간]+([고정연장]*1.5)+[고정할증])
				float mSal = employee.getMSALARY();
				float bTm = employee.getBTIME();
				float eTm = employee.getETIME();
				float aTm = employee.getATIME();
				float ySal = mSal * 12;
				float tSal = (float) (mSal / (bTm + (eTm * 1.5) + aTm));
				employee.setYSALARY((float)(int)ySal);
				employee.setTSALARY((float)(int)tSal);
				if (employee.getEMPNO() != null && employee.getEMPNO().length() > 1) {
					payDao.saveFileEmpInDB(employee);
				}
			 } //close while for row
			} //close try
			catch(Exception ex){
			ex.printStackTrace();
		}
		return "Success";
	}

	public static Workbook getWorkBook(File fileName){
		Workbook workbook = null;
		try {
		String myFileName=fileName.getName();
		String extension = myFileName.substring(myFileName.lastIndexOf("."));
		if(extension.equalsIgnoreCase(".xls")){
		workbook = new HSSFWorkbook(new FileInputStream(fileName));
		}
		else if(extension.equalsIgnoreCase(".xlsx")){
		workbook = new XSSFWorkbook(new FileInputStream(fileName));
		}
		}
		catch(Exception ex)
		{
		ex.printStackTrace();
		}
		return workbook;
	}
			 
	public static Object getCellValueBasedOnCellType(Row rowData,int columnPosition){
		Object cellValue=null;
		try {
			Cell cell = rowData.getCell(columnPosition);
			if (cell.getCellType() == CellType.STRING) {
				cellValue = cell.getStringCellValue();
			} else if (cell.getCellType() == CellType.NUMERIC) {
				if (DateUtil.isCellDateFormatted(cell)) {
					String dateString = cell.getDateCellValue().toString();
					cellValue = dateString;
				} else {
					Float floatVal = new Float(cell.getNumericCellValue());
					String strValue = Float.toString(floatVal.floatValue());
					cellValue = strValue;
				}
			} else if (cell.getCellType() == CellType.BOOLEAN) {
				cellValue = cell.getBooleanCellValue();
			} else if (cell.getCellType() == CellType.FORMULA) {
				cellValue = cell.getCellFormula();
				//cellValue = cell.getNumericCellValue();
			} else if (cell.getCellType() == CellType.BLANK) {
				cellValue = "";
			}
		}catch(Exception ex){
			return cellValue = "";
		}
		return cellValue;
	}

}
