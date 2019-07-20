package com.hanweb.train;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import com.hanweb.common.util.log.LogWriter;
import com.hanweb.common.util.security.DualEncodeResult;
import com.hanweb.common.util.security.RSAKey;
import com.hanweb.common.util.security.SecurityUtil;

public class SecurityTest {
	
	private String sourceWords = "南京大汉网络hanweb";
	
	private String key = "www.hanweb.com";
	
	@BeforeClass
	public static void init() {
		SecurityUtil.init("E:/workspace/springmvc/.metadata/.plugins/org.eclipse.wst.server.core/tmp5/wtpwebapps/complat3.2");
	}
	
	@Test
	public void AES() {
		String encode = SecurityUtil.AESEncode(sourceWords, key);
		Assert.assertEquals(sourceWords, SecurityUtil.AESDecode(encode, key));
	}
	
	@Test
	public void DES() {
		String encode = SecurityUtil.DESEncode(sourceWords, key);
		Assert.assertEquals(sourceWords, SecurityUtil.DESDecode(encode, key));
	}
	
	@Test
	public void DESede() {
		// 获取key
		String key = SecurityUtil.DESedeGetKey();
		LogWriter.debug("key:" + key);
		String encode = SecurityUtil.DESedeEncode(sourceWords, key);
		Assert.assertEquals(sourceWords, SecurityUtil.DESedeDecode(encode, key));
	}
	
	@Test
	public void DualDES() {
		// 获取key
		DualEncodeResult dualEncodeResult = SecurityUtil.DualEncode(sourceWords);
		LogWriter.debug("skey:" + dualEncodeResult.getSkey());
		LogWriter.debug("pubkey:" + dualEncodeResult.getPubKey());
		LogWriter.debug("result:" + dualEncodeResult.getResult());
		Assert.assertEquals(sourceWords, SecurityUtil.DualDecode(dualEncodeResult.getResult(), dualEncodeResult.getSkey()));
	}
	
	/**
	 * 使用系统的公私钥做rsa加解密
	 */
	@Test
	public void Rsa() {
		String encode = SecurityUtil.RSAEncode(sourceWords, SecurityUtil.getPublicKey());
		Assert.assertEquals(sourceWords, SecurityUtil.RSADecode(encode));
	}
	
	/**
	 * 产生公私钥做rsa加解密
	 */
	@Test
	public void RsaCustom() {
		// 获取key
		RSAKey rsaKey = SecurityUtil.createKey();
		LogWriter.debug("publicKey:" + rsaKey.getPublicKey());
		LogWriter.debug("privateKey:" + rsaKey.getPrivateKey());
		String encode = SecurityUtil.RSAEncode(sourceWords, rsaKey.getPublicKey());
		Assert.assertEquals(sourceWords, SecurityUtil.RSADecode(encode, rsaKey.getPrivateKey()));
	}
}
