package com.cliente.demo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController(
    private val orderService: OrderService
) {

    @GetMapping("/hello")
    fun hello(@RequestParam(defaultValue = "world") name: String): Map<String, Any> {
        val result = orderService.process(name)
        return mapOf(
            "ok" to true,
            "message" to "hello $name",
            "result" to result
        )
    }
}
