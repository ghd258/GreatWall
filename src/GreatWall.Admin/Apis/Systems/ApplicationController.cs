using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Microsoft.AspNetCore.Mvc;
using Util.Webs.Controllers;

namespace GreatWall.Apis.Systems {
    /// <summary>
    /// 应用程序控制器
    /// </summary>
    public class ApplicationController : QueryControllerBase<ApplicationDto, ApplicationQuery> {
        /// <summary>
        /// 初始化应用程序控制器
        /// </summary>
        /// <param name="queryService">应用程序查询服务</param>
        /// <param name="service">应用程序服务</param>
        public ApplicationController( IQueryApplicationService queryService, IApplicationService service ) : base( queryService ) {
            QueryService = queryService;
            Service = service;
        }

        /// <summary>
        /// 应用程序查询服务
        /// </summary>
        public IQueryApplicationService QueryService { get; }
        /// <summary>
        /// 应用程序服务
        /// </summary>
        public IApplicationService Service { get; }

        /// <summary>
        /// 获取全部应用程序
        /// </summary>
        [HttpGet( "all" )]
        public async Task<IActionResult> GetAllAsync() {
            var result = await QueryService.GetAllAsync();
            return Success( result );
        }

        /// <summary>
        /// 获取作用域
        /// </summary>
        [HttpGet( "scopes" )]
        public async Task<IActionResult> GetScopes() {
            var result = await QueryService.GetScopes();
            return Success( result );
        }

        /// <summary>
        /// 创建
        /// </summary>
        /// <param name="request">创建参数</param>
        [HttpPost]
        public virtual async Task<IActionResult> CreateAsync( [FromBody] ApplicationDto request ) {
            var id = await Service.CreateAsync( request );
            return Success( id );
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="request">修改参数</param>
        [HttpPut]
        public virtual async Task<IActionResult> UpdateAsync( [FromBody] ApplicationDto request ) {
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