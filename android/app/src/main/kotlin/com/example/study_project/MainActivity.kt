package com.example.study_project

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import java.nio.ByteBuffer
import java.nio.ByteOrder

const val binaryChannelName = "binary_channel";

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        var messenger = flutterEngine.dartExecutor.binaryMessenger

        testBinary(messenger)
    }

    fun testBinary(messenger: BinaryMessenger) {
        messenger.setMessageHandler(binaryChannelName) { message, reply ->
            message?.order(ByteOrder.nativeOrder())
            val x = message?.double ?: 0.0
            val y = message?.int ?: 0
            Log.d("ANDROID", "response x = $x, y = $y")

            val message = ByteBuffer.allocate( 100)
            message.putDouble(x)
            message.putInt(y)

           // reply.reply(message)

            sendBinary(messenger)
        }
    }

    fun sendBinary(messenger: BinaryMessenger){
        val message = ByteBuffer.allocate( 100)
        message.putDouble(10.5)
        message.putInt(20)

        messenger.send(binaryChannelName, message){
            Log.d("ANDROID", "Binary was sent")
        }

    }

}
