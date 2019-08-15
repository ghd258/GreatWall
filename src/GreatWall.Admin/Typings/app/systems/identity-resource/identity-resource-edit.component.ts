import { Component, Injector } from '@angular/core';
import { env } from '../../env';
import { DialogEditComponentBase } from '../../../util';
import { IdentityResourceViewModel } from './model/identity-resource-view-model';

/**
 * 身份资源编辑页
 */
@Component({
    selector: 'identity-resource-edit',
    templateUrl: !env.dev() ? './html/edit.component.html' : '/view/systems/identityResource/edit'
})
export class IdentityResourceEditComponent extends DialogEditComponentBase<IdentityResourceViewModel> {
    /**
     * 初始化身份资源编辑页
     * @param injector 注入器
     */
    constructor(injector: Injector) {
        super(injector);
    }

    /**
     * 创建模型
     */
    createModel() {
        let result = new IdentityResourceViewModel();
        result.enabled = true;
        return result;
    }

    /**
     * 获取基地址
     */
    protected getBaseUrl() {
        return "identityResource";
    }
}