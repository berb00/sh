'use strict';
/**
 * 开发环境配置文件
 */
var config = {
    env: 'development', //环境名称
port: 4190,         //服务端口号
    verision: '4.0.4.2', //版本号
    simulation: false,  //是否模拟数据，默认为false
    eureka: {           //发现服务配置
        host: global.environment.eurhost || '192.168.10.85', //测试集成环境
        // host: global.environment.eurhost || '192.168.10.240', //测试集成环境
        port: 3100,
        servicePath: '/eureka/apps',
    },
    instance: {        //当前服务器信息
        host: '192.168.8.95',
        name: 'PC95.lyzh.com',
        port: 3002,   //web提供的发现服务的端口号
        AppId: 'COM-LYZH-MSA-GW', //链接上服务的appid
    },
    zipkin: {
        endpoint: 'http://192.168.30.153:9411/api/v1/spans',
    },
    mysql_config: {
        //mysql数据库配置
    },
    mongodb_config: {
        //mongodb数据库配置
    },
    redis_config: {
        //redis数据库配置
    },
    domain: '.lyzhyun.com',
    sendmobile: '13989866460',    //接收验证码手机
    mapkey: 'xBn5HPIkUrXlh0G9cbjjBSxWm6Sd6uoN',
    videoip: 'http://192.168.8.165:8081',  //视频播放
    thirdequws:{
        username:'126502',//执法仪管理账号
        password:'12345',//执法仪管理密码
        strSrvUrl: "ws://116.62.59.204:10004",//金华执法仪服务地址
        strGpsSrvUrl: "ws://116.62.59.204:10005",//执法仪定位相关服务地址
        strNsUrl: "ws://116.62.59.204:10007",//执法仪服务
    }

};
module.exports = config;