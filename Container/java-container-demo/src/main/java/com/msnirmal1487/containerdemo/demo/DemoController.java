package com.msnirmal1487.containerdemo.demo;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

	@GetMapping("/")
	public ResponseEntity<String> getHello() {
		return new ResponseEntity<String>("Welcom to the Container Demo application", HttpStatus.OK);
	}
}
