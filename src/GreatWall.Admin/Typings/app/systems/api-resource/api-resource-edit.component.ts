import { Component, Injector } from '@angular/core';
import { env } from '../../env';
import { DialogEditComponentBase } from '../../../util';
import { ApiResourceViewModel } from './model/api-resource-view-model';

/**
 * Api资源编辑页
 */
@Component({
    selector: 'api-resource-edit',
    templateUrl: !env.dev() ? './html/edit.component.html' : '/view/systems/ApiResource/edit'
})
export class ApiResourceEditComponent extends DialogEditComponentBase<ApiResourceViewModel> {
    /**
     * 初始化Api资源编辑页
     * @param injector 注入器
     */
    constructor(injector: Injector) {
        super(injector);
    }

    /**
     * 创建模型
     */
    createModel() {
        let result = new ApiResourceViewModel();
        result.enabled = true;
        return result;
    }

    /**
     * 获取基地址
     */
    protected getBaseUrl() {
        return "apiResource";
    }
}