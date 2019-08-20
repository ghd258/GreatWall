import { OidcAuthorizeConfig } from '../util';
import { env } from '../app/env';
import { Config as DevConfig } from "../config/config.dev";
import { Config as ProdConfig } from "../config/config.prod";

/**
 * 获取授权配置
 */
export function getAuthorizeConfig() {
    let result = new OidcAuthorizeConfig();
    result.authority = getAuthority(),
    result.clientId = "greatwall-admin";
    result.scope = "openid profile greatwall-api";
    return result;
}

/**
 * 获取认证服务器地址
 */
function getAuthority() {
    if ( env.prod() )
        return ProdConfig.authorizeServerUrl;
    return DevConfig.authorizeServerUrl;
}