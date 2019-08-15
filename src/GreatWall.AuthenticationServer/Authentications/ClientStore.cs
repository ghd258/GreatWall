using System.Collections.Generic;
using System.Threading.Tasks;
using GreatWall.Service.Abstractions;
using IdentityServer4.Models;
using IdentityServer4.Stores;
using Util.Maps;

namespace GreatWall.Authentications {
    /// <summary>
    /// 客户端存储
    /// </summary>
    public class ClientStore : IClientStore {
        /// <summary>
        /// 初始化客户端存储
        /// </summary>
        /// <param name="service">查询服务</param>
        public ClientStore( IQueryApplicationService service ) {
            Service = service;
        }

        /// <summary>
        /// 查询服务
        /// </summary>
        public IQueryApplicationService Service { get; set; }

        /// <summary>
        /// 查找客户端
        /// </summary>
        /// <param name="clientId">客户端标识</param>
        public async Task<Client> FindClientByIdAsync( string clientId ) {
            var application = await Service.GetByCodeAsync( clientId );
            if ( application == null )
                return null;
            var result = application.MapTo<Client>();
            result.ClientId = application.Code;
            result.ClientName = application.Name;
            result.AllowedGrantTypes = GetGrantTypes( application.AllowedGrantType );
            result.RedirectUris.Add( application.RedirectUri );
            result.PostLogoutRedirectUris.Add( application.PostLogoutRedirectUri );
            return result;
        }

        /// <summary>
        /// 获取授权类型
        /// </summary>
        private ICollection<string> GetGrantTypes( GreatWall.Domain.Enums.GrantType type ) {
            switch ( type ) {
                case GreatWall.Domain.Enums.GrantType.Implicit:
                    return GrantTypes.Implicit;
                case GreatWall.Domain.Enums.GrantType.AuthorizationCode:
                    return GrantTypes.Code;
                case GreatWall.Domain.Enums.GrantType.ClientCredentials:
                    return GrantTypes.ClientCredentials;
                case GreatWall.Domain.Enums.GrantType.Hybrid:
                    return GrantTypes.Hybrid;
                case GreatWall.Domain.Enums.GrantType.ResourceOwnerPassword:
                    return GrantTypes.ResourceOwnerPassword;
                default:
                    return null;
            }
        }
    }
}
