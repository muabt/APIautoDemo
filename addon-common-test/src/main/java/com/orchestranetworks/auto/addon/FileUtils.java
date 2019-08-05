package com.orchestranetworks.auto.addon;

import java.io.File;
import java.io.IOException;

public class FileUtils {

	public static File getLatestFilefromDir(String dirPath) {
		File dir = new File(dirPath);
		File[] files = dir.listFiles();
		if (files == null || files.length == 0) {
			return null;
		}

		File lastModifiedFile = files[0];
		for (int i = 1; i < files.length; i++) {
			if (lastModifiedFile.lastModified() < files[i].lastModified()) {
				lastModifiedFile = files[i];
			}
		}
		return lastModifiedFile;
	}

	public static void deleteFiles(File folder) throws IOException {
		File[] files = folder.listFiles();
		for (File file : files) {
			if (file.isFile()) {
				String fileName = file.getName();
				boolean del = file.delete();
				LogWork.info("File [" + fileName + "] got deleted ?: " + del);
			} else if (file.isDirectory()) {
				deleteFiles(file);
			}

		}
	}
}