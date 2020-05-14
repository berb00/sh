'use strict';
/**
 * 开发环境配置文件
 */
var config = {
    env: 'development', //环境名称
port: 4179,         //服务端口号
    verision: '4.2.36.9', //版本号
    simulation: false,  //是否模拟数据，默认为false
    eureka: {           //发现服务配置
        host: global.environment.eurhost || '192.168.10.240',
        // host: global.environment.eurhost || '192.168.10.240',
        // // host: global.environment.eurhost || '192.168.10.240',
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
    videoip:'http://192.168.8.165:8081',  //视频播放
    webconnect:{
        'hosturl_109':'192.168.8.115:4179', /**链接web端4109的服务地址*/
        'hosturl_110':'192.168.8.115:4180', /**链接web端4110的服务地址*/
        'hosturl_111':'192.168.8.115:4181', /**链接web端4111的服务地址*/
    }
};
module.exports = config;