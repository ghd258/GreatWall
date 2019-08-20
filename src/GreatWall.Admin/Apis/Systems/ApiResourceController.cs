using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using Util.Webs.Controllers;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Microsoft.AspNetCore.Mvc;

namespace GreatWall.Apis.Systems {
    /// <summary>
    /// Api资源控制器
    /// </summary>
    public class ApiResourceController : QueryControllerBase<ApiResourceDto, ResourceQuery> {
        /// <summary>
        /// 初始化Api资源控制器
        /// </summary>
        /// <param name="queryService">Api资源查询服务</param>
        /// <param name="service">Api资源服务</param>
        public ApiResourceController( IQueryApiResourceService queryService, IApiResourceService service ) : base( queryService ) {
            QueryService = queryService;
            Service = service;
        }

        /// <summary>
        /// Api资源查询服务
        /// </summary>
        public IQueryApiResourceService QueryService { get; }

        /// <summary>
        /// Api资源服务
        /// </summary>
        public IApiResourceService Service { get; }

        /// <summary>
        /// 创建
        /// </summary>
        /// <param name="request">创建参数</param>
        [HttpPost]
        public virtual async Task<IActionResult> CreateAsync( [FromBody] ApiResourceDto request ) {
            var id = await Service.CreateAsync( request );
            return Success( id );
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="request">修改参数</param>
        [HttpPut]
        public virtual async Task<IActionResult> UpdateAsync( [FromBody] ApiResourceDto request ) {
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