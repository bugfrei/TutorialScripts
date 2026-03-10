//@ui5-bundle tutui5/Component-preload.js
sap.ui.require.preload({
	"tutui5/Component.js":function(){
sap.ui.define(["sap/ui/core/UIComponent","sap/ui/Device","tutui5/model/models"],function(e,t,i){"use strict";return e.extend("tutui5.Component",{metadata:{manifest:"json"},init:function(){e.prototype.init.apply(this,arguments);this.getRouter().initialize();this.setModel(i.createDeviceModel(),"device")}})});
},
	"tutui5/controller/App.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/Controller"],function(n){"use strict";return n.extend("tutui5.controller.App",{onInit:function(){}})});
},
	"tutui5/controller/View1.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/Controller"],function(n){"use strict";return n.extend("tutui5.controller.View1",{onInit:function(){}})});
},
	"tutui5/i18n/i18n.properties":'# This is the resource bundle for tutui5\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=UI5 App for tutorial\n\n#YDES: Application description\nappDescription=An SAP Fiori application.\n#XTIT: Main view title\ntitle=UI5 App for tutorial',
	"tutui5/manifest.json":'{"_version":"1.65.0","sap.app":{"id":"tutui5","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:basic","version":"1.15.0","toolsId":"08de8773-ef94-467f-9e09-5c12fbfb6875"},"dataSources":{"mainService":{"uri":"odata/v4/catalog/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"tutui5-display":{"semanticObject":"tutui5","action":"display","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.145.0","libs":{"sap.m":{},"sap.ui.core":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"tutui5.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}}},"resources":{"css":[{"uri":"css/style.css"}]},"routing":{"config":{"routerClass":"sap.m.routing.Router","viewType":"XML","async":true,"viewPath":"tutui5.view","controlAggregation":"pages","controlId":"app","clearControlAggregation":false},"routes":[{"name":"RouteView1","pattern":":?query:","target":["TargetView1"]}],"targets":{"TargetView1":{"viewType":"XML","transition":"slide","clearControlAggregation":false,"viewId":"View1","viewName":"View1"}}},"rootView":{"viewName":"tutui5.view.App","type":"XML","async":true,"id":"App"}},"sap.cloud":{"public":true,"service":"tutorial.service"}}',
	"tutui5/model/models.js":function(){
sap.ui.define(["sap/ui/model/json/JSONModel","sap/ui/Device"],function(e,n){"use strict";return{createDeviceModel:function(){var i=new e(n);i.setDefaultBindingMode("OneWay");return i}}});
},
	"tutui5/view/App.view.xml":'<mvc:View controllerName="tutui5.controller.App"\n    xmlns:html="http://www.w3.org/1999/xhtml"\n    xmlns:mvc="sap.ui.core.mvc" displayBlock="true"\n    xmlns="sap.m"><App id="app"></App></mvc:View>\n',
	"tutui5/view/View1.view.xml":'<mvc:View controllerName="tutui5.controller.View1"\n    xmlns:mvc="sap.ui.core.mvc" displayBlock="true"\n    xmlns="sap.m"><Page id="page" title="{i18n>title}"><content ><Title text="UI5 App V2" /><List items="{/Books}"><ObjectListItem title="{title}" number="{stock}" numberUnit="Stock" /></List></content></Page></mvc:View>\n'
});
//# sourceMappingURL=Component-preload.js.map
