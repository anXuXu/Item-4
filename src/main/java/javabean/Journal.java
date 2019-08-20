package javabean;

//import org.apache.commons.dbutils.QueryRunner;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;




public class Journal {
		private String affair;
		private String Journal_date;

	public void Journal() {

	}

	public Journal(String affair, String journal_date) {
		this.affair = affair;
		Journal_date = journal_date;
	}

	public String getAffair() {
		return affair;
	}

	public void setAffair(String affair) {
		this.affair = affair;
	}

	public String getJournal_date() {
		return Journal_date;
	}

	public void setJournal_date(String journal_date) {
		Journal_date = journal_date;
	}


		

}