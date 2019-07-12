using System.Collections.Generic;
using System.Linq;
using GreatWall.Service.Dtos.NgAlain;
using GreatWall.Service.Dtos.Responses;
using Xunit;

namespace GreatWall.Tests.NgAlain {
    /// <summary>
    /// 菜单结果测试
    /// </summary>
    public class MenuResultTest {
        /// <summary>
        /// 标识
        /// </summary>
        public const string Id = "1";
        /// <summary>
        /// 标识2
        /// </summary>
        public const string Id2 = "2";
        /// <summary>
        /// 标识3
        /// </summary>
        public const string Id3 = "3";
        /// <summary>
        /// 标识4
        /// </summary>
        public const string Id4 = "4";
        /// <summary>
        /// 标识5
        /// </summary>
        public const string Id5 = "5";
        /// <summary>
        /// 标题
        /// </summary>
        public const string Title = "a";
        /// <summary>
        /// 标题2
        /// </summary>
        public const string Title2 = "b";
        /// <summary>
        /// 标题3
        /// </summary>
        public const string Title3 = "c";
        /// <summary>
        /// 标题4
        /// </summary>
        public const string Title4 = "d";
        /// <summary>
        /// 标题5
        /// </summary>
        public const string Title5 = "e";

        /// <summary>
        /// 获取节点1
        /// </summary>
        private MenuResponse GetNode1() {
            return new MenuResponse {
                Id = Id,
                Name = Title,
                Level = 1,
                Enabled = false,
                Url = "/a/b"
            };
        }

        /// <summary>
        /// 获取节点2
        /// </summary>
        private MenuResponse GetNode2() {
            return new MenuResponse {
                Id = Id2,
                ParentId = Id,
                Name = Title2,
                Level = 2,
                Enabled = false
            };
        }

        /// <summary>
        /// 获取节点3
        /// </summary>
        private MenuResponse GetNode3() {
            return new MenuResponse {
                Id = Id3,
                Name = Title3,
                Icon = "a",
                Level = 1,
                Enabled = false,
                Url = "http://localhost/a/b",
                External = true
            };
        }

        /// <summary>
        /// 获取节点4
        /// </summary>
        private MenuResponse GetNode4() {
            return new MenuResponse {
                Id = Id4,
                ParentId = Id,
                Name = Title4,
                Level = 2,
                Enabled = false
            };
        }

        /// <summary>
        /// 获取节点5
        /// </summary>
        private MenuResponse GetNode5() {
            return new MenuResponse {
                Id = Id5,
                ParentId = Id4,
                Name = Title5
            };
        }

        /// <summary>
        /// 添加一个节点
        /// </summary>
        [Fact]
        public void TestGetResult_1() {
            var list = new List<MenuResponse> { GetNode1() };
            var result = new MenuResult( list ).GetResult();
            Assert.Single( result );
            var node = result.First();
            Assert.Equal( Id, node.Id );
            Assert.Equal( Title, node.Text );
            Assert.Equal( "/a/b", node.Link );
        }

        /// <summary>
        /// 添加一个子节点
        /// </summary>
        [Fact]
        public void TestGetResult_2() {
            var list = new List<MenuResponse> { GetNode1(), GetNode2() };
            var result = new MenuResult( list ).GetResult();

            //根节点
            Assert.Single( result );
            var root = result.First();
            Assert.Equal( Id, root.Id );
            Assert.Equal( Title, root.Text );

            //子节点
            Assert.Single( root.Children );
            var child = root.Children[0];
            Assert.Equal( Id2, child.Id );
            Assert.Equal( Title2, child.Text );
        }

        /// <summary>
        /// 添加2个根节点，其中一个有子节点
        /// </summary>
        [Fact]
        public void TestGetResult_3() {
            var list = new List<MenuResponse> { GetNode1(), GetNode2(), GetNode3() };
            var result = new MenuResult( list ).GetResult();

            //根节点1
            Assert.Equal( 2, result.Count );
            var root = result.First();
            Assert.Equal( Id, root.Id );
            Assert.Equal( Title, root.Text );

            //根节点2
            var root2 = result[1];
            Assert.Equal( Id3, root2.Id );
            Assert.Equal( Title3, root2.Text );
            Assert.Equal( "a", root2.Icon );
            Assert.Equal( "http://localhost/a/b", root2.ExternalLink );

            //子节点
            Assert.Single( root.Children );
            var child = root.Children[0];
            Assert.Equal( Id2, child.Id );
            Assert.Equal( Title2, child.Text );
        }

        /// <summary>
        /// 添加2个子节点
        /// </summary>
        [Fact]
        public void TestGetResult_4() {
            var list = new List<MenuResponse> { GetNode1(), GetNode2(), GetNode3(), GetNode4() };
            var result = new MenuResult( list ).GetResult();

            //根节点
            Assert.Equal( 2, result.Count );
            var root = result.First();
            Assert.Equal( Id, root.Id );

            //根节点2
            var root2 = result[1];
            Assert.Equal( Id3, root2.Id );

            //子节点
            Assert.Equal( 2, root.Children.Count );
            var child = root.Children[0];
            Assert.Equal( Id2, child.Id );

            //子节点2
            Assert.Equal( 2, root.Children.Count );
            var child2 = root.Children[1];
            Assert.Equal( Id4, child2.Id );
        }

        /// <summary>
        /// 添加3级节点
        /// </summary>
        [Fact]
        public void TestGetResult_5() {
            var list = new List<MenuResponse> { GetNode1(), GetNode2(), GetNode3(), GetNode4(), GetNode5() };
            var result = new MenuResult( list ).GetResult();

            //根节点
            Assert.Equal( 2, result.Count );
            var root = result.First();
            Assert.Equal( Id, root.Id );

            //根节点2
            var root2 = result[1];
            Assert.Equal( Id3, root2.Id );

            //子节点
            Assert.Equal( 2, root.Children.Count );
            var child = root.Children[0];
            Assert.Equal( Id2, child.Id );

            //子节点2
            Assert.Equal( 2, root.Children.Count );
            var child2 = root.Children[1];
            Assert.Equal( Id4, child2.Id );

            //孙节点
            Assert.Single( child2.Children );
            var child3 = child2.Children[0];
            Assert.Equal( Id5, child3.Id );
        }
    }
}
