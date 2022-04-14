package com.ezen.samsikki.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate);
		
		return "home";
	}

	// about 페이지
	@RequestMapping(value = "/shop/about", method = RequestMethod.GET)
	public void about() throws Exception {
		
	}
	
	// agreement 페이지
	@RequestMapping(value = "/shop/agreement", method = RequestMethod.GET)
	public void agreement() throws Exception {
		
	}
	
	// policy 페이지
	@RequestMapping(value = "/shop/policy", method = RequestMethod.GET)
	public void policy() throws Exception {
		
	}
		
	// guide 페이지
	@RequestMapping(value = "/shop/guide", method = RequestMethod.GET)
	public void guide() throws Exception {
		
	}

} // end public class HomeController
