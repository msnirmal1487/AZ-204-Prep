package com.msnirmal.azurespringworkshop;

import org.springframework.http.HttpStatus;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class TodoController {

	@Autowired @Lazy
	private TodoRepository todoRepository;
	
	@Value("${app.environment}")
	private String env;
	
	private ArrayList<Todo> todos= new ArrayList<Todo>();
	
	@PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    public Todo createTodo(@RequestBody Todo todo) {
		System.out.println("env - "+ env);
		long len = todos.size();
		todo.setId(len);
		todos.add(todo);
		if (isUseLocal()) {
			return todo ; 
		} else {
			return todoRepository.save(todo);
		}
    }

    @GetMapping("/")
    public Iterable<Todo> getTodos() {
    	System.out.println("env - "+ env);
    	
    	if (isUseLocal()) {
    		return todos; 
		} else {
			return todoRepository.findAll();
		}
    }
    
    private boolean isUseLocal() {
    	if (env == null || (env != null && (env.equalsIgnoreCase("local") || env.equalsIgnoreCase("azure-local")))) {
    		return true;
    	}
    	return false;
    }
}
