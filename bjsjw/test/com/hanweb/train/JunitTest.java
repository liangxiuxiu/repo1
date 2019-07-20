package com.hanweb.train;

import java.util.List;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import com.hanweb.common.annotation.ColumnType;
import com.hanweb.common.test.BaseTest;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.complat.controller.group.GroupFormBean;
import com.hanweb.complat.entity.Group;
import com.hanweb.complat.entity.User;
import com.hanweb.complat.service.GroupService;
import com.hanweb.complat.service.UserService;
import com.hanweb.setup.service.UpgradeService;

public class JunitTest extends BaseTest{
	
	
	@BeforeClass
	public static void init() {
		initApp("E:/workspace/springmvc/.metadata/.plugins/org.eclipse.wst.server.core/tmp5/wtpwebapps/complat3.2", "complat3.2");
	}
	
	@Test
	public void findById() {
		UserService userService = SpringUtil.getBean(UserService.class);
		User user = userService.findByIid(1);
		LogWriter.debug(user.getLoginName());
	}
	
	@Test
	public void addGroup() {
		GroupFormBean bean = new GroupFormBean();
		bean.setName("测试机构");
		bean.setPid(12);
		bean.setCodeId(StringUtil.getUUIDString());
		GroupService groupService = SpringUtil.getBean(GroupService.class);
		Assert.assertTrue(groupService.add(bean));
	}
	
	@Test
	public void selectGroup() {
		GroupService groupService = SpringUtil.getBean(GroupService.class);
		List<Group> groups = groupService.findByName("测试机构");
		Assert.assertNotNull(groups);
		Assert.assertEquals(1, groups.size());
		Assert.assertEquals("测试机构", groups.get(0).getName());
	}
	
	@Test
	public void deleteGroup() {
		GroupService groupService = SpringUtil.getBean(GroupService.class);
		Assert.assertTrue(groupService.removeByIds("7"));
	}
	
	@Test
	public void addColumn() {
		UpgradeService upgradeService = SpringUtil.getBean(UpgradeService.class);
		upgradeService.getDataInitDAO().addColumn("usetest", "testcol", ColumnType.INT, "5", "10");
	}
	
	@Test
	public void renameColumn() {
		UpgradeService upgradeService = SpringUtil.getBean(UpgradeService.class);
		upgradeService.getDataInitDAO().renameColumn("usetest", "testcol", "coltest", ColumnType.INT, "5", "10");
	}
	
	@Test
	public void modifyColumn() {
		UpgradeService upgradeService = SpringUtil.getBean(UpgradeService.class);
		upgradeService.getDataInitDAO().updateColumn("usetest", "coltest", ColumnType.VARCHAR, "5", "10");
	}
}
