using System;
using System.Threading.Tasks;
using GreatWall.Service.Dtos;
using Util.Applications;
using Util.Aspects;
using Util.Validations.Aspects;

namespace GreatWall.Service.Abstractions {
    /// <summary>
    /// 应用程序服务
    /// </summary>
    public interface IApplicationService : IService {
        /// <summary>
        /// 创建应用程序
        /// </summary>
        /// <param name="dto">应用程序参数</param>
        Task<Guid> CreateAsync( [NotNull] [Valid] ApplicationDto dto );
        /// <summary>
        /// 修改应用程序
        /// </summary>
        /// <param name="dto">应用程序参数</param>
        Task UpdateAsync( [NotNull] [Valid] ApplicationDto dto );
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ids">用逗号分隔的Id列表，范例："1,2"</param>
        Task DeleteAsync( string ids );
    }
}