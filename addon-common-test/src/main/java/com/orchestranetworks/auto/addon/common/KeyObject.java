package com.orchestranetworks.auto.addon.common;

import java.util.Iterator;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class KeyObject {

	private final JsonArray data;

	public KeyObject() {
		data = new JsonArray();
	}

	public KeyObject addPK(String key, String value) {
		JsonObject pk = new JsonObject();
		pk.addProperty(key, value);
		data.add(pk);
		return this;
	}

	public JsonArray getPK() {
		return data;
	}
	
	public boolean contains(JsonElement element) {
		return this.data.contains(element);
	}

	public int size() {
		return this.data.size();
	}
	
	

	@Override
	public String toString() {
		return this.data.toString();
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) {
			return true;
		}
		if (!(o instanceof KeyObject)) {
			return false;
		}
		
		KeyObject that = (KeyObject) o;

		if (this.size() != that.size()) {
			return false;
		}

		Iterator<JsonElement> iterator = this.getPK().iterator();

		while (iterator.hasNext()) {
			if (!that.contains(iterator.next())) {
				return false;
			}

		}

		return true;
	}
}
