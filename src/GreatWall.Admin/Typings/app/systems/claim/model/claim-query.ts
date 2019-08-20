import { QueryParameter } from '../../../../util';

/**
 * 声明查询参数
 */
export class ClaimQuery extends QueryParameter {
    /**
     * 声明标识
     */
    claimId;
    /**
     * 声明名称
     */
    name;
    /**
     * 启用
     */
    enabled;
    /**
     * 排序号
     */
    sortId;
    /**
     * 备注
     */
    remark;
    /**
     * 起始创建时间
     */
    beginCreationTime;
    /**
     * 结束创建时间
     */
    endCreationTime;
}