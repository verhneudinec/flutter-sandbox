package com.example.study_project

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StringCodec
import java.nio.ByteBuffer
import java.nio.ByteOrder

const val messageChannelName = "message_channel";

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        var messenger = flutterEngine.dartExecutor.binaryMessenger

        testMessange(messenger)
    }

    fun testMessange(messenger: BinaryMessenger) {
        val channel = BasicMessageChannel<String>(messenger, messageChannelName,StringCodec.INSTANCE)

        channel.setMessageHandler { message, reply ->
            Log.d("ANDROID", "$message")
            reply.reply("Hello, Flutter")
            sendBinary(messenger)
        }
    }

    fun sendBinary(messenger: BinaryMessenger){
        val channel = BasicMessageChannel<String>(messenger, messageChannelName,StringCodec.INSTANCE)
        channel.send("Hello, Flutter! Once again:)")

    }

}
