# Container-security-monitoring

# Container Security Monitoring in Kubernetes using Falco, Prometheus & Grafana

This project implements **runtime container security monitoring in Kubernetes** using:
Falco, Falco Exporter, Prometheus, Alertmanager, and Grafana.

The solution detects suspicious container behavior such as:
- privilege escalation
- interactive shell access
- sensitive volume access
- unauthorized runtime activity

Falco alerts are exported to Prometheus and visualized in Grafana, enabling security
event monitoring and alerting across the Kubernetes cluster.

---

## 🧩 Technologies Used

- Kubernetes
- Falco (runtime security engine)
- Falco Exporter
- Helm
- Prometheus
- Alertmanager
- Grafana
- Elasticsearch / Kibana (optional integration)

---

## 🚀 Deployment Overview

- Falco is deployed via Helm in the `falco` namespace
- Custom Falco rules are added via ConfigMap
- Falco Exporter streams events to Prometheus
- Alerts are forwarded to Alertmanager
- Grafana visualizes Falco security metrics & alerts

---

## 📦 Deliverables

- `falco/values.yaml`  
  Custom Helm values with Falco configuration & exporters enabled

- `falco/falco_rules.local.yaml`  
  Custom Falco rules for detecting:
  - interactive shells in containers
  - suspicious runtime behavior

- `falco/alert-forwarding.yaml`  
  Configuration for forwarding Falco events to Prometheus / Alertmanager

- `dashboards/`  
  Grafana dashboards for:
  - Falco security events
  - Alertmanager activity
  - Prometheus scrape metrics

- `screenshots/`  
  Visual evidence of Falco monitoring, alerts, and dashboards

---

## 🖼️ Screenshot Captions

### 1️⃣ Falco Deployment Using Helm  
Falco deployed successfully in the `falco` namespace via Helm with Falco Exporter and Prometheus ServiceMonitor enabled.

### 2️⃣ Falco & Falco Exporter Pods Running  
Falco is actively monitoring runtime behavior and Falco Exporter is exposing metrics to Prometheus.

### 3️⃣ Falco Runtime Monitoring & Event Streaming  
Falco streams events via gRPC using eBPF probes, exposing alert metrics on port 9376.

### 4️⃣ Custom Falco Rules Loaded  
Falco loads rules from `falco_rules.local.yaml`, including the custom rule **Terminal shell in container**.

### 5️⃣ Runtime Security Event Triggered  
Launching an interactive shell in a test pod triggers the custom rule, proving runtime monitoring is active.

### 6️⃣ Interactive Shell Detection Rule  
Custom rule detects unauthorized shell access inside containers (bash/sh/zsh).

### 7️⃣ Custom Rules Deployed via ConfigMap  
Rules mounted into Falco DaemonSet — rollout successful with no disruption.

### 8️⃣ Alertmanager Dashboard in Grafana  
Falco → Prometheus → Alertmanager → Grafana pipeline validated.

### 9️⃣ Falco Events Visualized in Grafana  
Falco alerts exported via Falco Exporter and graphed in Grafana using `falco_events` metric.

### 🔟 Alertmanager Metrics in Grafana  
Alertmanager metrics scraped by Prometheus and visualized successfully.

### 1️⃣1️⃣ Prometheus Scrape Metrics  
Prometheus actively scrapes Falco Exporter & Alertmanager endpoints.

### 1️⃣2️⃣ Falco Exporter Target UP  
Prometheus confirms active Falco Exporter metric ingestion.

### 1️⃣3️⃣ Prometheus Targets Page  
Monitoring pipeline verified — ServiceMonitors functioning.

---

## 🏁 Outcome of the Task

This implementation successfully demonstrates:

- Falco deployed and running in Kubernetes
- Custom Falco runtime security rules in production
- Security alerts generated from real container activity
- Falco events exported to Prometheus via Falco Exporter
- Alertmanager scraping Falco alert metrics
- Grafana dashboards visualizing Falco events and alerts
- End-to-end monitoring pipeline:

**Falco → Falco Exporter → Prometheus → Alertmanager → Grafana**

This meets and exceeds the project requirements for
container runtime security monitoring and alert visualization.

---

## 📂 Repository Structure

(See folder tree above)

---

## 🧠 Author Notes

This project demonstrates practical implementation of **Kubernetes runtime security
monitoring and alerting**, suitable for production security workflows and DevSecOps environments.

