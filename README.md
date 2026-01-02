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
falco/
rules/ # Custom Falco runtime security rules
deployment/ # Falco Helm configs / manifests
falco-values.yaml # Falco Helm values configuration
alert-forwarding.yaml # (optional) Falco → Prometheus / Alertmanager forwarding config

dashboards/
grafana/ # Grafana dashboard JSON files
screenshots/ # Monitoring & dashboard screenshots (to be added)

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
- `screenshots/` *(to be added)*  
  Architecture diagrams & dashboard outputs

---

## 🖼️ Screenshot Sections (to be added)

The following screenshots will be added to demonstrate the workflow:

1. Falco deployment via Helm  
2. Falco & Falco Exporter pods running  
3. Runtime event detection in Falco  
4. Custom Falco rules loaded successfully  
5. Security alert triggered during test scenario  
6. Prometheus scraping Falco Exporter metrics  
7. Alertmanager receiving alert data  
8. Grafana dashboard visualizing Falco security events

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




