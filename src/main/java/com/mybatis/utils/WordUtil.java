package com.mybatis.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

public class WordUtil {
	public static void generateWord(Map<String, Object> param, String fileSrc, String fileDest) {
		XWPFDocument doc = null;
		OPCPackage pack = null;
		try {
			pack = POIXMLDocument.openPackage(fileSrc);
			doc = new XWPFDocument(pack);
			if (param != null && param.size() > 0) {
				// 处理段落
				List<XWPFParagraph> paragraphList = doc.getParagraphs();
				processParagraphs(paragraphList, param, doc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileOutputStream fopts = null;
		try {
			fopts = new FileOutputStream(fileDest);
			doc.write(fopts);
			pack.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			closeStream(fopts);
		}
	}

	public static void closeStream(FileOutputStream fopts) {
		try {
			fopts.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 处理段落,替换关键字
	 * 
	 * @param paragraphList
	 * @throws FileNotFoundException
	 * @throws InvalidFormatException
	 */
	public static void processParagraphs(List<XWPFParagraph> paragraphList, Map<String, Object> param, XWPFDocument doc) throws InvalidFormatException, FileNotFoundException {
		if (paragraphList != null && paragraphList.size() > 0) {
			// 遍历所有段落
			for (XWPFParagraph paragraph : paragraphList) {
				List<XWPFRun> runs = paragraph.getRuns();
				for (XWPFRun run : runs) {
					String text = run.getText(0);
					// System.out.println("text==" + text);
					if (text != null) {
						boolean isSetText = false;
						for (Entry<String, Object> entry : param.entrySet()) {
							String key = entry.getKey();
							if (text.indexOf(key) != -1) {// 在配置文件中有这个关键字对应的键
								isSetText = true;
								Object value = entry.getValue();
								if (value instanceof String) {// 文本替换
									// System.out.println("key==" + key);
									if (text.contains(key)) {
										text = text.replace(key, value.toString());
									}
								}
							}
						}
						if (isSetText) {
							run.setText(text, 0);
						}
					}
				}
			}
		}
	}
	
	
	
	/**
	 * 使用缓冲字节流实现文件复制
	 * src 准备复制的文件
	 * desc 复制到的文件
	 */
	public static  void copyFile(String src,String dest){
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			//1.提供读入、写出的文件
			File file1 = new File(src);
			File file2 = new File(dest);
			//2.想创建相应的节点流：FileInputStream、FileOutputStream
			FileInputStream fis = new FileInputStream(file1);
			FileOutputStream fos = new FileOutputStream(file2);
			//3.将创建的节点流的对象作为形参传递给缓冲流的构造器中
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(fos);
			//4.具体的实现文件复制的操作
			byte[] b = new byte[1024];
			int len;
			while((len = bis.read(b)) != -1){
				bos.write(b, 0, len);
				bos.flush();
			}
		}catch (IOException e) {		
			e.printStackTrace();
		}finally{
			//5.关闭相应的流
			if(bos != null){
				try {
					bos.close();
				} catch (IOException e) {				
					e.printStackTrace();
				}
				
			}
			if(bis != null){
				try {
					bis.close();
				} catch (IOException e) {				
					e.printStackTrace();
				}
				
			}
			
		}
	}
	
	


	/**
	 * 替换段落里面的变量
	 * 
	 * @param doc
	 *            要替换的文档
	 * @param params
	 *            参数
	 */
	public static void replaceInPara(XWPFDocument doc, Map<String, Object> params) {
		Iterator<XWPFParagraph> iterator = doc.getParagraphsIterator();
		XWPFParagraph para;
		while (iterator.hasNext()) {
			para = iterator.next();
			replaceInPara(para, params);
		}
	}

	/**
	 * 替换段落里面的变量
	 * 
	 * @param para
	 *            要替换的段落
	 * @param params
	 *            参数
	 */
	public static void replaceInPara(XWPFParagraph para, Map<String, Object> params) {
		List<XWPFRun> runs;
		Matcher matcher;
		if (matcher(para.getParagraphText()).find()) {
			runs = para.getRuns();
			for (int i = 0; i < runs.size(); i++) {
				XWPFRun run = runs.get(i);
				//run.setColor("FF0000");
				//run.setBold(true);
				String runText = run.toString();
				matcher = matcher(runText);
				if (matcher.find()) {
					while ((matcher = matcher(runText)).find()) {
						
						runText = matcher.replaceFirst(String.valueOf(params.get(matcher.group(1))));
						System.out.println(runText);
					
					}
					// 直接调用XWPFRun的setText()方法设置文本时，在底层会重新创建一个XWPFRun，把文本附加在当前文本后面，
					// 所以我们不能直接设值，需要先删除当前run,然后再自己手动插入一个新的run。
					para.removeRun(i);					
					para.insertNewRun(i).setText(runText);
				}
			}
		}
	}

	/**
	 * 替换表格里面的变量
	 * 
	 * @param doc
	 *            要替换的文档
	 * @param params
	 *            参数
	 */
	public static void replaceInTable(XWPFDocument doc, Map<String, Object> params) {
		Iterator<XWPFTable> iterator = doc.getTablesIterator();
		XWPFTable table;
		List<XWPFTableRow> rows;
		List<XWPFTableCell> cells;
		List<XWPFParagraph> paras;
		while (iterator.hasNext()) {
			table = iterator.next();
			rows = table.getRows();
			for (XWPFTableRow row : rows) {
				cells = row.getTableCells();
				for (XWPFTableCell cell : cells) {
					paras = cell.getParagraphs();
					for (XWPFParagraph para : paras) {
						
						replaceInPara(para, params);
					}
				}
			}
		}
	}

	/**
	 * 正则匹配字符串
	 * 
	 * @param str
	 * @return
	 */
	public static Matcher matcher(String str) {
		Pattern pattern = Pattern.compile("\\$\\{(.+?)\\}", Pattern.CASE_INSENSITIVE);
		Matcher matcher = pattern.matcher(str);
		return matcher;
	}

	/**
	 * 关闭输入流
	 * 
	 * @param is
	 */
	public static void close(InputStream is) {
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭输出流
	 * 
	 * @param os
	 */
	public static void close(OutputStream os) {
		if (os != null) {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}