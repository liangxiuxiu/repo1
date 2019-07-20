package com.hanweb.test.activemq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.junit.Before;
import org.junit.Test;

import com.hanweb.common.mq.BaseMessageListener;
import com.hanweb.common.mq.ConnectionManager;
import com.hanweb.common.mq.MessageCreator;
import com.hanweb.common.mq.MqOperator;
import com.hanweb.common.mq.ReceiveManager;

public class TopicTest {

	@Before
	public void initMq() {
		ConnectionManager.createConnection("1", "admin", "admin", "tcp://127.0.0.1:61616");
	}

	@Test
	public void test() throws Exception {
		MqOperator mqOperator = new MqOperator("1");
		mqOperator.sendTopic("complat.info.pub.topic", new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				Message msg = session.createTextMessage("第一条消息");
				msg.setJMSReplyTo(session.createQueue("complat.info.pub.return.queue"));
				return msg;
			}
		});
	}

	@Test
	public void test1() throws Exception {
		ReceiveManager.registerTopicListener("1", "complat.info.pub.topic",
				new BaseMessageListener() {
					@Override
					public String handleMessage(String message, TextMessage originalMessage,
							Session session) {
						System.out.println(message);
						return null;
					}
				});
		Thread.sleep(100000);
	}

	@Test
	public void test2() throws Exception {
		ReceiveManager.registerTopicListener("1", "complat.info.pub.topic", "lj",
				new BaseMessageListener() {
					@Override
					public String handleMessage(String message, TextMessage originalMessage,
							Session session) {
						System.out.println(message);
						return null;
					}
				});
		Thread.sleep(100000);
	}
}
