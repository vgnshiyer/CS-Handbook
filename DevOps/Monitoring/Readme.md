### Prometheus

- It is a monitoring tool.
- The endpoints need to expose a path /metrics.
- The data returned by the service must be in the format requested by prometheus.
- Prometheus provides different exporters for different languages to export metric data in the form supported by prometheus.
- Prometheus uses a pull-based system. In contrast to the push-based system used by AWS cloudwatch.
    - Applications push data to the monitoring system. This can overload the server, making your monitoring system as a bottleneck.
- Pull system allows you to check if a server is healthy or not.
- Prometheus allows push-gateway for exceptional cases like batch jobs.
- a config .yml file defines the targets for prometheus to pull metric data from services.
- Prometheus uses alert-manager to alert when rules in config are triggered.
- Prometheus stores metric data in time series database in a disk(HDD/SSD).
- It provides PromQL query language to get data.
- Can use prometheus UI to get status of services.
- Can use powerful data visualization tools like Grafana that uses PromQL under to hood to get the data.
