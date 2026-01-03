# Container-security-monitoring

# Container Security Monitoring in Kubernetes using Falco, Prometheus & Grafana

This project implements **runtime container security monitoring in Kubernetes** using  
Falco, Falco Exporter, Prometheus, Alertmanager, and Grafana.

The solution detects suspicious and malicious container runtime behavior such as:

- privilege escalation attempts
- interactive shell execution inside containers
- access to sensitive system directories
- unauthorized runtime activity and anomalies

Falco generates security events, exports them to Prometheus, and visualizes alerts in Grafana
to provide **centralized Kubernetes runtime security visibility**.

---

## 🧩 Technologies Used

- Kubernetes
- Falco (runtime security engine)
- Falco Exporter
- Helm
- Prometheus
- Alertmanager
- Grafana  
- (Optional) Elasticsearch / Kibana integration

---

## 📂 Project Structure
Container-security-monitoring/
├── falco/
│ ├── rules/ # Custom Falco runtime security rules
│ ├── deployment/ # Falco Helm configs & manifests
│ │ ├── falco-values.yaml # Falco Helm values configuration
│ │ └── alert-forwarding.yaml # (Optional) Falco → Prometheus / Alertmanager forwarding config
│
├── monitoring/
│ └── servicemonitoring.yaml # Prometheus ServiceMonitor for Falco metrics
│
├── dashboards/
│ └── grafana/ # Grafana dashboard JSON dashboards
│
├── screenshots/ # Monitoring & alert visualization screenshots
│
├── README.md
├── LICENSE
└── .gitignore
---

## 🚀 Deployment Overview

- Falco is deployed in the `falco` namespace using Helm  
- Custom Falco rules are mounted from `falco/rules/`
- Falco Exporter exposes Falco events as Prometheus metrics
- Prometheus scrapes Falco Exporter and Alertmanager endpoints
- Grafana visualizes Falco alerts and security metrics

---

## 📦 Key Deliverables

### ✔ Falco Runtime Security
- `falco/falco-values.yaml` – Falco Helm configuration  
- `falco/rules/` – custom Falco security detection rules

### ✔ Alert Forwarding (Optional)
- `falco/alert-forwarding.yaml`  
  Used for forwarding Falco alert metrics to Prometheus / Alertmanager

### ✔ Dashboards
- `dashboards/grafana/`  
  Grafana dashboards for:
  - Falco event monitoring
  - Alert status visibility
  - Security incident metrics

### ✔ Documentation & Evidence
- `screenshots/`
-  Screeshots/outputs

---

## 🖼️ Screenshot Sections

The following screenshots will be added to demonstrate the workflow:


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

---

## 🏁 Outcome

This project demonstrates:

- Falco deployed and running in Kubernetes
- Custom runtime security rules detecting real container activity
- Falco event export via Falco Exporter
- Prometheus & Alertmanager alert pipeline
- Grafana dashboard visualization of security alerts
- Custom Falco rules were deployed by creating a ConfigMap and patching the Falco DaemonSet to mount the rule file at:
  /etc/falco/falco_rules.local.yaml

The DaemonSet rollout completed successfully, confirming that Falco
loaded the custom rules without interrupting runtime monitoring.


**End-to-end monitoring flow:**
Falco → Falco Exporter → Prometheus → Alertmanager → Grafana
This implementation supports **DevSecOps security monitoring workflows** and provides
runtime visibility across Kubernetes workloads.

---

## 🧠 Author Notes

This project showcases a practical, real-world implementation of  
**Kubernetes container runtime security monitoring and alert visualization**, suitable for
learning, security research, and production-aligned environments.

**Author — Thanmai Krishna**



