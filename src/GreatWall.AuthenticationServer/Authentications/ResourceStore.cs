using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using GreatWall.Service.Dtos;
using IdentityServer4.Models;
using IdentityServer4.Stores;
using Util;
using Util.Maps;

namespace GreatWall.Authentications {
    /// <summary>
    /// 资源存储器
    /// </summary>
    public class ResourceStore : IResourceStore {
        /// <summary>
        /// 初始化资源存储器
        /// </summary>
        /// <param name="identityResourceService">身份资源查询服务</param>
        /// <param name="apiResourceService">Api资源查询服务</param>
        public ResourceStore( IQueryIdentityResourceService identityResourceService, IQueryApiResourceService apiResourceService ) {
            IdentityResourceService = identityResourceService;
            ApiResourceService = apiResourceService;
        }

        /// <summary>
        /// 身份资源查询服务
        /// </summary>
        public IQueryIdentityResourceService IdentityResourceService { get; set; }
        /// <summary>
        /// Api资源查询服务
        /// </summary>
        public IQueryApiResourceService ApiResourceService { get; set; }

        /// <summary>
        /// 查找身份资源列表
        /// </summary>
        /// <param name="names">资源标识列表</param>
        public async Task<IEnumerable<IdentityResource>> FindIdentityResourcesByScopeAsync( IEnumerable<string> names ) {
            var result = await IdentityResourceService.GetResources( names?.ToList() );
            return result.Where( t => t.Enabled == true ).Select( ToResource ).ToList();
        }

        /// <summary>
        /// 查找Api资源列表
        /// </summary>
        /// <param name="names">资源标识列表</param>
        public async Task<IEnumerable<ApiResource>> FindApiResourcesByScopeAsync( IEnumerable<string> names ) {
            var result = await ApiResourceService.GetResources( names?.ToList() );
            return result.Where( t => t.Enabled == true ).Select( ToResource ).ToList();
        }

        /// <summary>
        /// 查找Api资源
        /// </summary>
        /// <param name="name">资源标识</param>
        public async Task<ApiResource> FindApiResourceAsync( string name ) {
            var result = await ApiResourceService.GetResource( name );
            if( result.Enabled == true )
                return ToResource( result );
            return null;
        }

        /// <summary>
        /// 获取全部资源
        /// </summary>
        public async Task<Resources> GetAllResourcesAsync() {
            var identityResources = (await IdentityResourceService.GetAllAsync()).Where( t => t.Enabled == true ).Select( ToResource );
            var apiResources = (await ApiResourceService.GetAllAsync()).Where( t => t.Enabled == true ).Select( ToResource );
            return new Resources( identityResources, apiResources );
        }

        /// <summary>
        /// 转换为身份资源
        /// </summary>
        private IdentityResource ToResource( IdentityResourceDto dto ) {
            if( dto == null )
                return null;
            var result = dto.MapTo<IdentityResource>();
            result.Name = dto.Uri;
            result.DisplayName = dto.Name;
            result.Description = dto.Remark;
            if( dto.Claims != null && dto.Claims.Count > 0 )
                dto.Claims.ForEach( claim => result.UserClaims.Add( claim ) );
            return result;
        }

        /// <summary>
        /// 转换为Api资源
        /// </summary>
        private ApiResource ToResource( ApiResourceDto dto ) {
            if( dto == null )
                return null;
            var result = new ApiResource( dto.Uri, dto.Name ) {
                Description = dto.Remark,
                Enabled = dto.Enabled.SafeValue()
            };
            if( dto.Claims != null && dto.Claims.Count > 0 )
                dto.Claims.ForEach( claim => result.UserClaims.Add( claim ) );
            return result;
        }
    }
}
