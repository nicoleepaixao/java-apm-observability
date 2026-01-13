package com.cliente.demo

import co.elastic.apm.api.CaptureSpan
import org.springframework.stereotype.Service

@Service
class OrderService {

    @CaptureSpan("process-order")
    fun process(name: String): String {
        Thread.sleep(100)
        return "processed:$name"
    }
}
