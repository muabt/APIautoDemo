package com.orchestranetworks.auto.addon.utils;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.File;
import java.io.IOException;

public class FileUtils {
	public static String fseparator = File.separator;

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

	public static String getDataFolderPath() {
		String dataPath = System.getProperty("user.dir") + "/src/main/resources/data/";
		return dataPath.replaceAll("/", "\\"+fseparator);
	}

	public static void compareXMLFiles(String actualFile, String expectedFile) {
		File source = new File(getDataFolderPath() + expectedFile);
		File target = new File(actualFile);
		System.out.println("Source="+source);
		System.out.println("target="+target);
		assertThat(target).hasSameContentAs(source);
	}

}