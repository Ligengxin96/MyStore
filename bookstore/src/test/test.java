package test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) {
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		//String s1 = timestamp.toLocalDateTime();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		System.out.println(fmt.format(timestamp));
	}
}
