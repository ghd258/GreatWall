import { NgModule } from '@angular/core';
import { FrameworkModule } from '../framework.module';
import { SystemRoutingModule } from './system-routing.module';
import { ClaimListComponent } from './claim/claim-list.component';
import { ApplicationListComponent } from './application/application-list.component';
import { ApplicationEditComponent } from './application/application-edit.component';
import { ApplicationDetailComponent } from './application/application-detail.component';
import { ApplicationSelectComponent } from './application/application-select.component';
import { UserListComponent } from './user/user-list.component';
import { UserCreateComponent } from './user/user-create.component';
import { UserDetailComponent } from './user/user-detail.component';
import { RoleListComponent } from './role/role-list.component';
import { RoleEditComponent } from './role/role-edit.component';
import { RoleDetailComponent } from './role/role-detail.component';
import { RoleUserListComponent } from './role/role-user-list.component';
import { SelectUserListComponent } from './role/select-user-list.component';
import { PermissionComponent } from './role/permission.component';
import { ModuleListComponent } from './module/module-list.component';
import { ModuleEditComponent } from './module/module-edit.component';
import { ModuleDetailComponent } from './module/module-detail.component';
import { ModuleSelectComponent } from './module/module-select.component';
import { IdentityResourceListComponent } from './identity-resource/identity-resource-list.component';
import { IdentityResourceEditComponent } from './identity-resource/identity-resource-edit.component';
import { IdentityResourceDetailComponent } from './identity-resource/identity-resource-detail.component';
import { ApiResourceListComponent } from './api-resource/api-resource-list.component';
import { ApiResourceEditComponent } from './api-resource/api-resource-edit.component';
import { ApiResourceDetailComponent } from './api-resource/api-resource-detail.component';

/**
 * 系统模块
 */
@NgModule( {
    declarations: [
        ClaimListComponent,
        ApplicationListComponent, ApplicationEditComponent, ApplicationDetailComponent, ApplicationSelectComponent,
        UserListComponent, UserCreateComponent, UserDetailComponent,
        RoleListComponent, RoleEditComponent, RoleDetailComponent, RoleUserListComponent,
        SelectUserListComponent, PermissionComponent,
        ModuleListComponent, ModuleEditComponent, ModuleDetailComponent, ModuleSelectComponent,
        IdentityResourceListComponent, IdentityResourceEditComponent, IdentityResourceDetailComponent,
        ApiResourceListComponent, ApiResourceEditComponent, ApiResourceDetailComponent
    ],
    imports: [
        FrameworkModule, SystemRoutingModule
    ],
    entryComponents: [
        ApplicationEditComponent, ApplicationDetailComponent,
        UserCreateComponent, UserDetailComponent,
        RoleEditComponent, RoleDetailComponent, RoleUserListComponent,
        SelectUserListComponent, PermissionComponent,
        ModuleEditComponent, ModuleDetailComponent, ModuleSelectComponent,
        IdentityResourceEditComponent, IdentityResourceDetailComponent,
        ApiResourceEditComponent, ApiResourceDetailComponent
    ]
} )
export class SystemModule {
}