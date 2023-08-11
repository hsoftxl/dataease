package io.renren.modules.flow.controller;

import io.renren.common.utils.Result;
import io.renren.modules.flow.service.FlowableUserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/flow/sys")
public class FlowableUserController {
    private final FlowableUserService flowableUserService;

    @PostMapping("user/list")
    public Result<List<String>> realNameList(@RequestBody List<Long> ids) {
        List<String> list = flowableUserService.getRealNameList(ids);

        return new Result<List<String>>().ok(list);
    }

    @PostMapping("role/list")
    public Result<List<String>> roleNameList(@RequestBody List<Long> ids) {
        List<String> list = flowableUserService.getRoleNameList(ids);

        return new Result<List<String>>().ok(list);
    }
}
