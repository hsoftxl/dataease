/**
 * Copyright (c) 2020 人人开源 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */
package io.renren.modules.flow.controller;

import io.renren.common.utils.Result;
import io.renren.modules.flow.service.FlowProcessService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;

/**
 * 流程管理
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("/flow/process")
@AllArgsConstructor
@Api(tags = "流程管理")
public class FlowProcessController {
    private final FlowProcessService flowProcessService;

    @PutMapping("active/{id}")
    @RequiresPermissions("sys:process:all")
    public Result active(@PathVariable("id") String id) {
        flowProcessService.active(id);

        return new Result();
    }

    @PutMapping("suspend/{id}")
    @ApiOperation("挂起流程")
    @RequiresPermissions("sys:process:all")
    public Result suspend(@PathVariable("id") String id) {
        flowProcessService.suspend(id);

        return new Result();
    }

    @DeleteMapping
    @ApiOperation("删除流程")
    @RequiresPermissions("sys:process:all")
    public Result delete(@RequestBody String[] deploymentIds) {
        for (String deploymentId : deploymentIds) {
            flowProcessService.deleteDeployment(deploymentId);
        }
        return new Result();
    }

}
