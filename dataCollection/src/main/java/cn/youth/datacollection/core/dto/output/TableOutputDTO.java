package cn.youth.datacollection.core.dto.output;


import lombok.Data;
import cn.youth.datacollection.core.dto.StepInterface;
import cn.youth.datacollection.core.dto.common.DatabaseMetaDTO;

@Data
public class TableOutputDTO implements StepInterface {

    //唯一ID
    private String id;

    //表输出
    private String name;

    //转换数据库列表
    private DatabaseMetaDTO databaseMeta;

    //输出表
    private String tableName;

    //提交记录数量
    private String commitSize;

    //裁剪表
    private boolean truncateTable;
}
