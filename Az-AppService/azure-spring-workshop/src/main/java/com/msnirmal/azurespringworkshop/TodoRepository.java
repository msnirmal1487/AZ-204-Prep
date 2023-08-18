package com.msnirmal.azurespringworkshop;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class TodoRepository {

	List<Todo> todos = new ArrayList<>();
	public Todo save(Todo todo) {
		long nextId = todos.size() + 1;
		todo.setId(nextId);
		todos.add(todo);
		return todo;
	}

	public Iterable<Todo> findAll() {
		return todos;
	}

}
