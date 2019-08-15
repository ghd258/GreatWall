import { QueryParameter } from '../../../../util';

/**
 * Api资源查询参数
 */
export class ApiResourceQuery extends QueryParameter {
    /**
     * 资源标识
     */
    uri;
    /**
     * 显示名称
     */
    name;
    /**
     * 描述
     */
    remark;
    /**
     * 启用
     */
    enabled;
    /**
     * 起始创建时间
     */
    beginCreationTime;
    /**
     * 结束创建时间
     */
    endCreationTime;
}