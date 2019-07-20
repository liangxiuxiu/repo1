package com.hanweb.test.cache;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import net.oschina.j2cache.CacheChannel;

/**
 * 兼容j2cache,此类已经不推荐使用，新的缓存类请看CacheTest.java
 * 
 * @author 李杰
 *
 */
public class J2CacheTest {
	private static CacheChannel cacheChannel = CacheChannel.getInstance();

	@Test
	public void add() {
		cacheChannel.set("user", "a", "1");
		cacheChannel.set("user", "b", "1");
	}

	@Test
	public void get() {
		Assert.assertEquals("未获取到", cacheChannel.getValue("user", "a"), "1");
	}

	@Test
	public void remove() {
		cacheChannel.evict("a", "a");
		Assert.assertEquals("不改获取到", cacheChannel.getValue("user", "a"), null);
	}

	@Test
	public void clear() {
		cacheChannel.clear("user");
	}

	@Test
	public void keys() {
		List<String> list = cacheChannel.keys("user");
		System.out.println(list);
	}
}
