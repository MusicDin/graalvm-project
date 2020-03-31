## First partly successful execution of native-image

```
2020-03-31 10:55:29.459 INFO -- com.kumuluz.ee.configuration.sources.FileConfigurationSource -- Loading configuration from YAML file.
2020-03-31 10:55:29.459 INFO -- com.kumuluz.ee.configuration.sources.FileConfigurationSource -- Configuration successfully read.
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Initialized configuration source: EnvironmentConfigurationSource
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Initialized configuration source: SystemPropertyConfigurationSource
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Initialized configuration source: FileConfigurationSource
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Initializing KumuluzEE
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Checking for requirements
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- KumuluzEE running in an exploded class and dependency runtime.
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Checks passed
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Initialized main configuration
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Loading available EE components and extensions
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ServerLoader -- Loading the KumuluzEE server...
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ServerLoader -- Found Jetty
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ComponentLoader -- Loading available components
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ComponentLoader -- Loading for components complete
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Processing EE component dependencies
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ConfigExtensionLoader -- Loading available config extensions
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ConfigExtensionLoader -- Config extension loading complete
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Processing EE single extensions dependencies
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Processing EE extension dependencies
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ExtensionLoader -- Loading available extensions
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.loaders.ExtensionLoader -- Extension loading complete
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Processing EE extension dependencies
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- EE Components and extensions loaded
2020-03-31 10:55:29.460 INFO -- com.kumuluz.ee.EeApplication -- Initializing the KumuluzEE runtime
2020-03-31 10:55:29.461 INFO -- com.kumuluz.ee.EeApplication -- Initialized the KumuluzEE runtime
2020-03-31 10:55:29.461 INFO -- com.kumuluz.ee.EeApplication -- Initializing config extensions
2020-03-31 10:55:29.461 INFO -- com.kumuluz.ee.EeApplication -- Config extensions initialized
2020-03-31 10:55:29.461 INFO -- org.eclipse.jetty.util.log.Log -- Logging initialized @4ms to org.eclipse.jetty.util.log.JavaUtilLog
2020-03-31 10:55:29.462 INFO -- com.kumuluz.ee.jetty.JettyFactory -- Starting KumuluzEE on Jetty with 5 minimum and 100 maximum threads
2020-03-31 10:55:29.462 INFO -- com.kumuluz.ee.jetty.JettyFactory -- Starting KumuluzEE on port(s): 8080 [http/1.1]
2020-03-31 10:55:29.463 INFO -- com.kumuluz.ee.jetty.JettyServletServer -- Starting KumuluzEE with context root '/'
2020-03-31 10:55:29.464 INFO -- com.kumuluz.ee.EeApplication -- Initializing components
2020-03-31 10:55:29.464 INFO -- com.kumuluz.ee.EeApplication -- Found EE component JAX-RS implemented by Jersey
2020-03-31 10:55:29.464 INFO -- com.kumuluz.ee.jaxrs.JaxRsComponent -- Initiating Jersey
2020-03-31 10:55:29.464 INFO -- com.kumuluz.ee.EeApplication -- Components initialized
2020-03-31 10:55:29.464 INFO -- com.kumuluz.ee.EeApplication -- Initializing extensions
2020-03-31 10:55:29.464 INFO -- com.kumuluz.ee.EeApplication -- Extensions Initialized
2020-03-31 10:55:29.464 INFO -- org.eclipse.jetty.server.Server -- jetty-9.4.z-SNAPSHOT; built: 2019-02-15T16:53:49.381Z; git: eb70b240169fcf1abbd86af36482d1c49826fa0b; jvm 1.8.0_242
2020-03-31 10:55:29.468 WARNING -- org.eclipse.jetty.webapp.WebAppContext -- Failed startup of context o.e.j.w.WebAppContext@7483c5ae{/,file:///var/tmp/kumuluzee-tmp-webapp1245411615943489121/,UNAVAILABLE}
javax.naming.NoInitialContextException: Cannot instantiate class: org.eclipse.jetty.jndi.InitialContextFactory [Root exception is java.lang.ClassNotFoundException: org.eclipse.jetty.jndi.InitialContextFactory]
        at javax.naming.spi.NamingManager.getInitialContext(NamingManager.java:674)
        at javax.naming.InitialContext.getDefaultInitCtx(InitialContext.java:313)
        at javax.naming.InitialContext.init(InitialContext.java:244)
        at javax.naming.InitialContext.<init>(InitialContext.java:192)
        at org.eclipse.jetty.plus.webapp.EnvConfiguration.createEnvContext(EnvConfiguration.java:257)
        at org.eclipse.jetty.plus.webapp.EnvConfiguration.preConfigure(EnvConfiguration.java:67)
        at org.eclipse.jetty.webapp.WebAppContext.preConfigure(WebAppContext.java:506)
        at org.eclipse.jetty.webapp.WebAppContext.doStart(WebAppContext.java:544)
        at org.eclipse.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:68)
        at org.eclipse.jetty.util.component.ContainerLifeCycle.start(ContainerLifeCycle.java:138)
        at org.eclipse.jetty.server.Server.start(Server.java:415)
        at org.eclipse.jetty.util.component.ContainerLifeCycle.doStart(ContainerLifeCycle.java:108)
        at org.eclipse.jetty.server.handler.AbstractHandler.doStart(AbstractHandler.java:113)
        at org.eclipse.jetty.server.Server.doStart(Server.java:382)
        at org.eclipse.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:68)
        at com.kumuluz.ee.jetty.JettyServletServer.startServer(JettyServletServer.java:83)
        at com.kumuluz.ee.EeApplication.initialize(EeApplication.java:375)
        at com.kumuluz.ee.EeApplication.<init>(EeApplication.java:73)
        at com.kumuluz.ee.EeApplication.main(EeApplication.java:85)
Caused by: java.lang.ClassNotFoundException: org.eclipse.jetty.jndi.InitialContextFactory
        at com.oracle.svm.core.hub.ClassForNameSupport.forName(ClassForNameSupport.java:60)
        at java.lang.Class.forName(DynamicHub.java:1224)
        at com.sun.naming.internal.VersionHelper12.loadClass(VersionHelper12.java:91)
        at com.sun.naming.internal.VersionHelper12.loadClass(VersionHelper12.java:61)
        at javax.naming.spi.NamingManager.getInitialContext(NamingManager.java:672)
        ... 18 more

2020-03-31 10:55:29.469 INFO -- org.eclipse.jetty.server.AbstractConnector -- Started ServerConnector@4734eae2{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
2020-03-31 10:55:29.469 INFO -- org.eclipse.jetty.server.Server -- Started @12ms
2020-03-31 10:55:29.469 INFO -- com.kumuluz.ee.EeApplication -- KumuluzEE started successfully
2020-03-31 10:58:48.542 WARNING -- org.eclipse.jetty.io.ManagedSelector$Accept -- java.lang.ExceptionInInitializerError
2020-03-31 10:58:52.887 WARNING -- org.eclipse.jetty.io.ManagedSelector$Accept -- java.lang.NoClassDefFoundError: Could not initialize class org.eclipse.jetty.server.HttpOutput
2020-03-31 10:58:55.709 WARNING -- org.eclipse.jetty.io.ManagedSelector$Accept -- java.lang.NoClassDefFoundError: Could not initialize class org.eclipse.jetty.server.HttpOutput
```

## Second partly successful execution of native-image
Jrt and jar tags removed from native-image compilation command. (There is no warning messages at the end)

```
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.configuration.sources.FileConfigurationSource -- Loading configuration from YAML file.
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.configuration.sources.FileConfigurationSource -- Configuration successfully read.
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Initialized configuration source: EnvironmentConfigurationSource
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Initialized configuration source: SystemPropertyConfigurationSource
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Initialized configuration source: FileConfigurationSource
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Initializing KumuluzEE
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Checking for requirements
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- KumuluzEE running in an exploded class and dependency runtime.
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Checks passed
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Initialized main configuration
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.EeApplication -- Loading available EE components and extensions
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.loaders.ServerLoader -- Loading the KumuluzEE server...
2020-03-31 11:23:16.878 INFO -- com.kumuluz.ee.loaders.ServerLoader -- Found Jetty
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.loaders.ComponentLoader -- Loading available components
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.loaders.ComponentLoader -- Loading for components complete
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Processing EE component dependencies
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.loaders.ConfigExtensionLoader -- Loading available config extensions
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.loaders.ConfigExtensionLoader -- Config extension loading complete
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Processing EE single extensions dependencies
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Processing EE extension dependencies
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.loaders.ExtensionLoader -- Loading available extensions
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.loaders.ExtensionLoader -- Extension loading complete
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Processing EE extension dependencies
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- EE Components and extensions loaded
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Initializing the KumuluzEE runtime
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Initialized the KumuluzEE runtime
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Initializing config extensions
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.EeApplication -- Config extensions initialized
2020-03-31 11:23:16.879 INFO -- org.eclipse.jetty.util.log.Log -- Logging initialized @4ms to org.eclipse.jetty.util.log.JavaUtilLog
2020-03-31 11:23:16.879 INFO -- com.kumuluz.ee.jetty.JettyFactory -- Starting KumuluzEE on Jetty with 5 minimum and 100 maximum threads
2020-03-31 11:23:16.880 INFO -- com.kumuluz.ee.jetty.JettyFactory -- Starting KumuluzEE on port(s): 8080 [http/1.1]
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.jetty.JettyServletServer -- Starting KumuluzEE with context root '/'
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.EeApplication -- Initializing components
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.EeApplication -- Found EE component JAX-RS implemented by Jersey
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.jaxrs.JaxRsComponent -- Initiating Jersey
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.EeApplication -- Components initialized
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.EeApplication -- Initializing extensions
2020-03-31 11:23:16.881 INFO -- com.kumuluz.ee.EeApplication -- Extensions Initialized
2020-03-31 11:23:16.881 INFO -- org.eclipse.jetty.server.Server -- jetty-9.4.z-SNAPSHOT; built: 2019-02-15T16:53:49.381Z; git: eb70b240169fcf1abbd86af36482d1c49826fa0b; jvm 1.8.0_242
2020-03-31 11:23:16.884 WARNING -- org.eclipse.jetty.webapp.WebAppContext -- Failed startup of context o.e.j.w.WebAppContext@4febe051{/,file:///var/tmp/kumuluzee-tmp-webapp1766919979509003527/,UNAVAILABLE}
javax.naming.NoInitialContextException: Cannot instantiate class: org.eclipse.jetty.jndi.InitialContextFactory [Root exception is java.lang.ClassNotFoundException: org.eclipse.jetty.jndi.InitialContextFactory]
        at javax.naming.spi.NamingManager.getInitialContext(NamingManager.java:674)
        at javax.naming.InitialContext.getDefaultInitCtx(InitialContext.java:313)
        at javax.naming.InitialContext.init(InitialContext.java:244)
        at javax.naming.InitialContext.<init>(InitialContext.java:192)
        at org.eclipse.jetty.plus.webapp.EnvConfiguration.createEnvContext(EnvConfiguration.java:257)
        at org.eclipse.jetty.plus.webapp.EnvConfiguration.preConfigure(EnvConfiguration.java:67)
        at org.eclipse.jetty.webapp.WebAppContext.preConfigure(WebAppContext.java:506)
        at org.eclipse.jetty.webapp.WebAppContext.doStart(WebAppContext.java:544)
        at org.eclipse.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:68)
        at org.eclipse.jetty.util.component.ContainerLifeCycle.start(ContainerLifeCycle.java:138)
        at org.eclipse.jetty.server.Server.start(Server.java:415)
        at org.eclipse.jetty.util.component.ContainerLifeCycle.doStart(ContainerLifeCycle.java:108)
        at org.eclipse.jetty.server.handler.AbstractHandler.doStart(AbstractHandler.java:113)
        at org.eclipse.jetty.server.Server.doStart(Server.java:382)
        at org.eclipse.jetty.util.component.AbstractLifeCycle.start(AbstractLifeCycle.java:68)
        at com.kumuluz.ee.jetty.JettyServletServer.startServer(JettyServletServer.java:83)
        at com.kumuluz.ee.EeApplication.initialize(EeApplication.java:375)
        at com.kumuluz.ee.EeApplication.<init>(EeApplication.java:73)
        at com.kumuluz.ee.EeApplication.main(EeApplication.java:85)
Caused by: java.lang.ClassNotFoundException: org.eclipse.jetty.jndi.InitialContextFactory
        at com.oracle.svm.core.hub.ClassForNameSupport.forName(ClassForNameSupport.java:60)
        at java.lang.Class.forName(DynamicHub.java:1224)
        at com.sun.naming.internal.VersionHelper12.loadClass(VersionHelper12.java:91)
        at com.sun.naming.internal.VersionHelper12.loadClass(VersionHelper12.java:61)
        at javax.naming.spi.NamingManager.getInitialContext(NamingManager.java:672)
        ... 18 more

2020-03-31 11:23:16.885 INFO -- org.eclipse.jetty.server.AbstractConnector -- Started ServerConnector@57d034de{HTTP/1.1,[http/1.1]}{0.0.0.0:8080}
2020-03-31 11:23:16.885 INFO -- org.eclipse.jetty.server.Server -- Started @10ms
2020-03-31 11:23:16.885 INFO -- com.kumuluz.ee.EeApplication -- KumuluzEE started successfully
```