/*
 * Copyright Orchestra Networks 2000-2008. All rights reserved.
 */
package com.orchestranetworks.auto.addon.dmdv;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;


/**
 */
public class ConverterUtils
{

	public static <T> T parse(String json, Class<T> targetType)
	{
		ObjectMapper mapper = new ObjectMapper();
		T rs;
		try
		{
			rs = mapper.readValue(json, targetType);
		}
		catch (IOException ex)
		{
			throw new RuntimeException(ex);
		}
		return rs;
	}

	public static <T> String parse(T data)
	{
		ObjectMapper mapper = new ObjectMapper();
		try
		{
			return mapper.writeValueAsString(data);
		}
		catch (IOException ex)
		{
			throw new RuntimeException(ex);
		}
	}

}
