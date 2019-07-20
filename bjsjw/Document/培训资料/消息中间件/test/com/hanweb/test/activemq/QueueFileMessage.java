package com.hanweb.test.activemq;

import java.io.InputStream;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import org.apache.activemq.BlobMessage;

import org.junit.Before;
import org.junit.Test;

import com.hanweb.common.mq.BaseMessageListener;
import com.hanweb.common.mq.ConnectionManager;
import com.hanweb.common.mq.MessageCreator;
import com.hanweb.common.mq.MqOperator;
import com.hanweb.common.mq.ReceiveManager;

/**
 * 发送文件消息
 * 
 * @author 李杰
 * 
 */
public class QueueFileMessage {

	@Before
	public void initMq() {
		ConnectionManager
				.createConnection("1", "admin", "admin",
						"tcp://127.0.0.1:61616?jms.blobTransferPolicy.defaultUploadUrl=http://127.0.0.1:8161/fileserver/");
	}

	@Test
	public void test() throws Exception {
		try {

			MqOperator mqOperator = new MqOperator("1");
			mqOperator.sendQueue("complat.info.pub.queue", new MessageCreator() {
				@Override
				public Message createMessage(Session session) throws JMSException {
					Message msg = createFileMessage(session, "E:/hanweb-bslog.jar", "a.zip");
					msg.setJMSReplyTo(session.createQueue("complat.info.pub.return.queue"));
					return msg;
				}
			});
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test1() throws Exception {
		ReceiveManager.registerQueueListener("1", "complat.info.pub.queue",
				new BaseMessageListener() {
					@Override
					public String handleMessage(InputStream message, BlobMessage originalMessage,
							Session session) {
						System.out.println(message);
						System.out.println(originalMessage);
						System.out.println(session);
						this.removeFile(originalMessage);
						return "我收到消息了";
					}
				});
		Thread.sleep(10000000);
	}
}
