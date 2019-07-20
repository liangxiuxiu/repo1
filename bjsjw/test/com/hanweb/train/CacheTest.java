package com.hanweb.train;

import java.util.List;

import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.hanweb.common.cache.Cache;
import com.hanweb.common.cache.CacheManager;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)  
public class CacheTest {
	private static Cache cache = null;

	static {
		// 设置默认缓存名称
		// CacheManager.setDefaultCacheName("cachename");
		// 创建、获取缓存时，设置缓存名称
		// cache = CacheManager.getInstance("cachename");
		// 使用默认缓存名称创建、获取缓存
		cache = CacheManager.getInstance();
	}

	@Test
	public void test1_add() {
		cache.put("a", "1");
		cache.put("b", "2");
		cache.put("c", "3");
	}

	@Test
	public void test2_get() {
		Assert.assertEquals("未获取到", "1", cache.get("a"));
	}

	@Test
	public void test3_remove() {
		cache.remove("a");
		Assert.assertEquals("不该获取到", null, cache.get("a"));
	}

	@Test
	public void test4_keys() {
		List<String> list = cache.keys();
		Assert.assertEquals("数目不对", 2, list.size());
	}
	
	@Test
	public void test5_clear() {
		cache.clear();
		List<String> list = cache.keys();
		Assert.assertEquals("数目不对", 0, list.size());
	}
}
