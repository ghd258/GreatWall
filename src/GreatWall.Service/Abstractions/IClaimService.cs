using System.Collections.Generic;
using System.Threading.Tasks;
using GreatWall.Service.Dtos;
using GreatWall.Service.Queries;
using Util.Applications;

namespace GreatWall.Service.Abstractions {
    /// <summary>
    /// 声明服务
    /// </summary>
    public interface IClaimService : ICrudService<ClaimDto, ClaimQuery> {
        /// <summary>
        /// 获取已启用的声明列表
        /// </summary>
        Task<List<ClaimDto>> GetEnabledClaimsAsync();
    }
}