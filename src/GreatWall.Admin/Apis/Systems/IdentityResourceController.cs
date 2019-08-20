using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using Util.Webs.Controllers;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Microsoft.AspNetCore.Mvc;

namespace GreatWall.Apis.Systems {
    /// <summary>
    /// 身份资源控制器
    /// </summary>
    public class IdentityResourceController : QueryControllerBase<IdentityResourceDto, ResourceQuery> {
        /// <summary>
        /// 初始化身份资源控制器
        /// </summary>
        /// <param name="queryService">身份资源查询服务</param>
        /// <param name="service">身份资源服务</param>
        public IdentityResourceController( IQueryIdentityResourceService queryService, IIdentityResourceService service ) : base( queryService ) {
            QueryService = queryService;
            Service = service;
        }

        /// <summary>
        /// 身份资源查询服务
        /// </summary>
        public IQueryIdentityResourceService QueryService { get; }

        /// <summary>
        /// 身份资源服务
        /// </summary>
        public IIdentityResourceService Service { get; }

        /// <summary>
        /// 创建
        /// </summary>
        /// <param name="request">创建参数</param>
        [HttpPost]
        public virtual async Task<IActionResult> CreateAsync( [FromBody] IdentityResourceDto request ) {
            var id = await Service.CreateAsync( request );
            return Success( id );
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="request">修改参数</param>
        [HttpPut]
        public virtual async Task<IActionResult> UpdateAsync( [FromBody] IdentityResourceDto request ) {
            await Service.UpdateAsync( request );
            var result = await QueryService.GetByIdAsync( request.Id );
            return Success( result );
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids">标识列表，多个Id用逗号分隔，范例：1,2,3</param>
        [HttpPost( "delete" )]
        public virtual async Task<IActionResult> DeleteAsync( [FromBody] string ids ) {
            await Service.DeleteAsync( ids );
            return Success();
        }
    }
}