/**
 * Copyright (c) 2018 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package io.renren.modules.flow.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * 用户
 *
 * @author Mark sunlightcs@gmail.com
 */
@Mapper
public interface FlowableUserDao {

    String getUserName(String userId);

    List<String> getRealNameList(List<Long> ids);

    List<String> getRoleNameList(List<Long> ids);

    List<Long> getUserIdListByRoleIdList(List<Long> ids);
}
