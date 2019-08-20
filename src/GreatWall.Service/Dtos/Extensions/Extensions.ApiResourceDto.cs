using GreatWall.Data.Pos;
using GreatWall.Data.Pos.Models;
using GreatWall.Domain.Models;
using Util.Helpers;
using Util.Maps;

namespace GreatWall.Service.Dtos.Extensions {
    /// <summary>
    /// Api资源参数扩展
    /// </summary>
    public static partial class Extension {
        /// <summary>
        /// 转成Api资源参数
        /// </summary>
        public static ApiResourceDto ToApiResourceDto( this ResourcePo po ) {
            if( po == null )
                return null;
            var result = po.MapTo<ApiResourceDto>();
            var extend = Json.ToObject<ApiResourceExtend>( po.Extend );
            extend.MapTo( result );
            return result;
        }

        /// <summary>
        /// 转成Api资源
        /// </summary> 
        public static ApiResource ToEntity( this ApiResourceDto dto ) {
            return dto?.MapTo<ApiResource>();
        }
    }
}