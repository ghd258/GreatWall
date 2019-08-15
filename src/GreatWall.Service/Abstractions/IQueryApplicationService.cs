using System.Collections.Generic;
using System.Threading.Tasks;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Util;
using Util.Applications;

namespace GreatWall.Service.Abstractions {
    /// <summary>
    /// 应用程序查询服务
    /// </summary>
    public interface IQueryApplicationService : IQueryService<ApplicationDto, ApplicationQuery> {
        /// <summary>
        /// 通过应用程序编码查找
        /// </summary>
        /// <param name="code">应用程序编码</param>
        Task<ApplicationDto> GetByCodeAsync( string code );
        /// <summary>
        /// 是否允许跨域访问
        /// </summary>
        /// <param name="origin">来源</param>
        Task<bool> IsOriginAllowedAsync( string origin );
        /// <summary>
        /// 获取作用域
        /// </summary>
        Task<List<Item>> GetScopes();
    }
}