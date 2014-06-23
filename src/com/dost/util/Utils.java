package com.dost.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {

	public static String formatDate(Date date) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}
}
