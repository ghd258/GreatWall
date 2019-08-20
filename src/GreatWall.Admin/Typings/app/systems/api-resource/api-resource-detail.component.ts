import { Component, Injector } from '@angular/core';
import { env } from '../../env';
import { DialogEditComponentBase } from '../../../util';
import { ApiResourceViewModel } from './model/api-resource-view-model';

/**
 * Api资源详情页
 */
@Component({
    selector: 'api-resource-detail',
    templateUrl: !env.dev() ? './html/detail.component.html' : '/view/systems/ApiResource/detail'
})
export class ApiResourceDetailComponent extends DialogEditComponentBase<ApiResourceViewModel> {
    /**
     * 初始化Api资源详情页
     * @param injector 注入器
     */
    constructor(injector: Injector) {
        super(injector);
    }

    /**
     * 获取基地址
     */
    protected getBaseUrl() {
        return "apiResource";
    }
    
    /**
     * 是否远程加载
     */
    isRequestLoad() {
        return false;
    }
}