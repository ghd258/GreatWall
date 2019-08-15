import { Component, Injector } from '@angular/core';
import { env } from '../../env';
import { TableQueryComponentBase } from '../../../util';
import { ApiResourceQuery } from './model/api-resource-query';
import { ApiResourceViewModel } from './model/api-resource-view-model';
import { ApiResourceEditComponent } from './api-resource-edit.component';
import { ApiResourceDetailComponent } from './api-resource-detail.component';

/**
 * Api资源列表页
 */
@Component({
    selector: 'api-esource-list',
    templateUrl: !env.dev() ? './html/index.component.html' : '/view/systems/ApiResource'
})
export class ApiResourceListComponent extends TableQueryComponentBase<ApiResourceViewModel, ApiResourceQuery>  {
    /**
     * 初始化Api资源列表页
     * @param injector 注入器
     */
    constructor(injector: Injector) {
        super(injector);
    }
    
    /**
     * 获取创建弹出框组件
     */
    getCreateDialogComponent() {
        return ApiResourceEditComponent;
    }

    /**
     * 获取详情弹出框组件
     */
    getDetailDialogComponent() {
        return ApiResourceDetailComponent;
    }
}