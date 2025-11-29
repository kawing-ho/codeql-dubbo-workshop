import java
import semmle.code.java.dataflow.FlowSources

class NotifyListener extends RefType {
  NotifyListener() {
    this.hasQualifiedName("org.apache.dubbo.registry", "NotifyListener")
  }
}

class ConfigurationListener extends RefType {
  ConfigurationListener() {
    this.hasQualifiedName("org.apache.dubbo.common.config.configcenter", "ConfigurationListener")
  }
}

class ConfigurationListenerProcessMethod extends Method {
  ConfigurationListenerProcessMethod() {
    this.getName() = "process" and
    this.getDeclaringType().getASupertype*() instanceof ConfigurationListener
  }
}

class NotifyListenerNotifyMethod extends Method {
  NotifyListenerNotifyMethod() {
    this.getName() = "notify" and
    this.getDeclaringType().getASupertype*() instanceof NotifyListener 
  }
}

from ...
where ...
select ...

