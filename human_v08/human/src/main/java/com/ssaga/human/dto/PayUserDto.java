package com.ssaga.human.dto;

public class PayUserDto {

	private String COMCODE;
	private String PID;
	private String PWD;
	private String PNAME;
	private String PEMAIL;
	private String PPHONE;
	private String INDATE;
	private String OUTDATE;
	
	public String getCOMCODE() {
		return COMCODE;
	}
	public void setCOMCODE(String cOMCODE) {
		COMCODE = cOMCODE;
	}
	public String getPID() {
		return PID;
	}
	public void setPID(String pID) {
		PID = pID;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public String getPNAME() {
		return PNAME;
	}
	public void setPNAME(String pNAME) {
		PNAME = pNAME;
	}
	public String getPEMAIL() {
		return PEMAIL;
	}
	public void setPEMAIL(String pEMAIL) {
		PEMAIL = pEMAIL;
	}
	public String getPPHONE() {
		return PPHONE;
	}
	public void setPPHONE(String pPHONE) {
		PPHONE = pPHONE;
	}
	public String getINDATE() {
		return INDATE;
	}
	public void setINDATE(String iNDATE) {
		INDATE = iNDATE;
	}
	public String getOUTDATE() {
		return OUTDATE;
	}
	public void setOUTDATE(String oUTDATE) {
		OUTDATE = oUTDATE;
	}
	@Override
	public String toString() {
		return "PayUser [COMCODE=" + COMCODE + ", PID=" + PID + ", PWD=" + PWD + ", PNAME=" + PNAME + ", PEMAIL="
				+ PEMAIL + ", PPHONE=" + PPHONE + ", INDATE=" + INDATE + ", OUTDATE=" + OUTDATE + "]";
	}
	
}
