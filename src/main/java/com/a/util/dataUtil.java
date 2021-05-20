package com.a.util;

public class dataUtil {

	//문자를 2자로 1~9 >> 01~09
	public static String two(String number) {
		return number.trim().length()<2?"0"+number.trim():number.trim();
	}
	
	//20210327
	public static String yyyymmdd(int year, int month, int day) {
		String dates = (year+"")+two(month+"")+two(day+"");
		return dates;
	}
	
}
