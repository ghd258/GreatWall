import { Component, Injector } from '@angular/core';
import { env } from '../../env';
import { TableEditComponentBase } from '../../../util';
import { ClaimQuery } from './model/claim-query';
import { ClaimViewModel } from './model/claim-view-model';

/**
 * 声明列表页
 */
@Component({
    selector: 'claim-list',
    templateUrl: !env.dev() ? './html/index.component.html' : '/view/systems/claim'
})
export class ClaimListComponent extends TableEditComponentBase<ClaimViewModel, ClaimQuery>  {
    /**
     * 初始化声明列表页
     * @param injector 注入器
     */
    constructor(injector: Injector) {
        super(injector);
    }

    /**
     * 创建参数
     */
    protected createModel() {
        let result = new ClaimViewModel();
        result.enabled = true;
        result.sortId = 0;
        return result;
    }
}