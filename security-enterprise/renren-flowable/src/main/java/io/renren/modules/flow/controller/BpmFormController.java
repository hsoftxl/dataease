package io.renren.modules.flow.controller;

import io.renren.common.constant.Constant;
import io.renren.common.page.PageData;
import io.renren.common.utils.Result;
import io.renren.common.validator.AssertUtils;
import io.renren.common.validator.ValidatorUtils;
import io.renren.common.validator.group.AddGroup;
import io.renren.common.validator.group.DefaultGroup;
import io.renren.common.validator.group.UpdateGroup;
import io.renren.modules.flow.dto.BpmFormDTO;
import io.renren.modules.flow.service.BpmFormService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;


/**
 * 工作流表单
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("flow/bpmform")
@Api(tags = "工作流表单")
@AllArgsConstructor
public class BpmFormController {
    private final BpmFormService bpmFormService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    @RequiresPermissions("flow:bpmform:all")
    public Result<PageData<BpmFormDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<BpmFormDTO> page = bpmFormService.page(params);

        return new Result<PageData<BpmFormDTO>>().ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    @RequiresPermissions("flow:bpmform:all")
    public Result<BpmFormDTO> get(@PathVariable("id") Long id) {
        BpmFormDTO data = bpmFormService.get(id);

        return new Result<BpmFormDTO>().ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @RequiresPermissions("flow:bpmform:all")
    public Result save(@RequestBody BpmFormDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);

        bpmFormService.save(dto);

        return new Result();
    }

    @PutMapping
    @ApiOperation("修改")
    @RequiresPermissions("flow:bpmform:all")
    public Result update(@RequestBody BpmFormDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        bpmFormService.update(dto);

        return new Result();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @RequiresPermissions("flow:bpmform:all")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        bpmFormService.delete(ids);

        return new Result();
    }

}