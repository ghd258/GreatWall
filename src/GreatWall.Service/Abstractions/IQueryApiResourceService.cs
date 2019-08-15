using System.Collections.Generic;
using System.Threading.Tasks;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Util.Applications;

namespace GreatWall.Service.Abstractions {
    /// <summary>
    /// Api资源查询服务
    /// </summary>
    public interface IQueryApiResourceService : IQueryService<ApiResourceDto, ResourceQuery> {
        /// <summary>
        /// 获取资源列表
        /// </summary>
        /// <param name="uri">资源标识列表</param>
        Task<List<ApiResourceDto>> GetResources( List<string> uri );
        /// <summary>
        /// 获取资源
        /// </summary>
        /// <param name="uri">资源标识</param>
        Task<ApiResourceDto> GetResource( string uri );
    }
}