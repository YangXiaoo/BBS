package online.yangxiao.common;

import java.util.*;

public class AjaxReturn {
	public static Map<String, Object> ajaxReturn(String info, String url) {
		Map<String, Object> map = new HashMap<>();
		map.put("info", info);
		map.put("url", url);
		map.put("status", "1");

		return map;
	}

	public static Map<String, Object> ajaxReturnSuccess(String info, String url) {
		Map<String, Object> map = new HashMap<>();
		map.put("info", info);
		map.put("url", url);
		map.put("success", "1");

		return map;
	}

	public static Map<String, Object> ajaxReturnMarkdown(String info, String url) {
		Map<String, Object> map = new HashMap<>();
		map.put("url", url);
		map.put("message", info);
		map.put("success", 1);

		return map;
	}

	public static Map<String, Object> ajaxReturn(String info) {
		Map<String, Object> map = new HashMap<>();
		map.put("info", info);
		map.put("status", "0");

		return map;
	}
}