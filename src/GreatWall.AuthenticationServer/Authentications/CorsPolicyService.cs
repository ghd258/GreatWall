using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using IdentityServer4.Services;
using Util;
using Util.Logs.Extensions;

namespace GreatWall.Authentications {
    /// <summary>
    /// 跨域策略服务
    /// </summary>
    public class CorsPolicyService : ICorsPolicyService {
        /// <summary>
        /// 初始化跨域策略服务
        /// </summary>
        /// <param name="service">查询服务</param>
        public CorsPolicyService( IQueryApplicationService service ) {
            Service = service;
        }

        /// <summary>
        /// 查询服务
        /// </summary>
        public IQueryApplicationService Service { get; set; }

        /// <summary>
        /// 是否允许跨域访问
        /// </summary>
        /// <param name="origin">来源</param>
        public async Task<bool> IsOriginAllowedAsync( string origin ) {
            var result = await Service.IsOriginAllowedAsync( origin );
            Log( origin, result );
            return result;
        }

        /// <summary>
        /// 写日志
        /// </summary>
        private void Log( string origin, bool result ) {
            Util.Logs.Log.GetLog( this )
                .Caption( "认证中心跨域访问" )
                .Content( $"来源：{origin},是否允许访问:{result.Description()}" )
                .Debug();
        }
    }
}
