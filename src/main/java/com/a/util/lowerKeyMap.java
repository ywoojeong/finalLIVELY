package com.a.util;

import org.apache.commons.collections4.map.ListOrderedMap;
import org.apache.commons.lang3.StringUtils;


public class lowerKeyMap extends ListOrderedMap{ 
	
	private static final long serialVersionUID = 6723434363565852261L;
	
	public Object put(Object key, Object value) {
		
		return super.put(StringUtils.lowerCase((String) key), value); 
	}

}

