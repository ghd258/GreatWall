using System.Collections.Generic;
using System.Threading.Tasks;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Util.Applications;

namespace GreatWall.Service.Abstractions {
    /// <summary>
    /// 身份资源查询服务
    /// </summary>
    public interface IQueryIdentityResourceService : IQueryService<IdentityResourceDto, ResourceQuery> {
        /// <summary>
        /// 获取资源列表
        /// </summary>
        /// <param name="uri">资源标识列表</param>
        Task<List<IdentityResourceDto>> GetResources( List<string> uri );
    }
}