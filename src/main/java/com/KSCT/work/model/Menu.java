package com.KSCT.work.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Menu {
	private String Menu_Type;
	private String Menu_Name;
	private int Menu_Price;
	private int Menu_Stock;
}
