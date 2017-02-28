package com.gh.core.utils;

import java.util.UUID;


public class UploadUtils {
	
	public static String generateRandomDir(String uuidname) {
		int hashcode = uuidname.hashCode();
		
		int d1 = hashcode & 0xf;
		
		int d2 = (hashcode >> 4) & 0xf;
		return "/" + d1 + "/" + d2;
	}

	
	public static String generateUUIDName(String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));
		return UUID.randomUUID().toString() + ext;
	}

	
	public static String subFileName(String fileName) {
		
		int index = fileName.lastIndexOf("\\");
		if (index != -1) {
			
			return fileName.substring(index + 1);
		} else {
			return fileName;
		}
	}

	
	public static boolean checkImgType(String contentType) {
		if (contentType.startsWith("image/")) {
			return true;
		} else {
			return false;
		}
	}
}
