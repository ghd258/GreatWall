using System;
using System.Threading.Tasks;
using GreatWall.Service.Dtos;
using Util.Applications;
using Util.Aspects;
using Util.Validations.Aspects;

namespace GreatWall.Service.Abstractions {
    /// <summary>
    /// 身份资源服务
    /// </summary>
    public interface IIdentityResourceService : IService {
        /// <summary>
        /// 创建身份资源
        /// </summary>
        /// <param name="dto">身份资源参数</param>
        Task<Guid> CreateAsync( [NotNull] [Valid] IdentityResourceDto dto );
        /// <summary>
        /// 修改身份资源
        /// </summary>
        /// <param name="dto">身份资源参数</param>
        Task UpdateAsync( [NotNull] [Valid] IdentityResourceDto dto );
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids">用逗号分隔的Id列表，范例："1,2"</param>
        Task DeleteAsync( string ids );
    }
}