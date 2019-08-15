using System.Linq;
using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using Util.Webs.Controllers;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Microsoft.AspNetCore.Mvc;
using Util;

namespace GreatWall.Apis.Systems {
    /// <summary>
    /// 声明控制器
    /// </summary>
    public class ClaimController : CrudControllerBase<ClaimDto, ClaimQuery> {
        /// <summary>
        /// 初始化声明控制器
        /// </summary>
        /// <param name="service">声明服务</param>
        public ClaimController( IClaimService service ) : base( service ) {
            ClaimService = service;
        }
        
        /// <summary>
        /// 声明服务
        /// </summary>
        public IClaimService ClaimService { get; }

        /// <summary>
        /// 获取所有声明列表
        /// </summary>
        [HttpGet( "all" )]
        public virtual async Task<IActionResult> GetAllAsync() {
            var claims = await ClaimService.GetEnabledClaimsAsync();
            var result = claims.OrderBy( t => t.SortId ).Select( t => new Item( t.Name, t.Name ) ).ToList();
            return Success( result );
        }
    }
}