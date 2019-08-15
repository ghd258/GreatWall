import { Component, Injector } from '@angular/core';
import { env } from '../../env';
import { DialogEditComponentBase } from '../../../util';
import { IdentityResourceViewModel } from './model/identity-resource-view-model';

/**
 * 身份资源详情页
 */
@Component({
    selector: 'identity-resource-detail',
    templateUrl: !env.dev() ? './html/detail.component.html' : '/view/systems/identityResource/detail'
})
export class IdentityResourceDetailComponent extends DialogEditComponentBase<IdentityResourceViewModel> {
    /**
     * 初始化身份资源详情页
     * @param injector 注入器
     */
    constructor(injector: Injector) {
        super(injector);
    }

    /**
     * 获取基地址
     */
    protected getBaseUrl() {
        return "identityResource";
    }
    
    /**
     * 是否远程加载
     */
    isRequestLoad() {
        return false;
    }
}