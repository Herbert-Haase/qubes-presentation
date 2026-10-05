---
theme: seriph
title: Qubes Demo
class: text-center cover
colorSchema: light
transition: slide-left
layout: default
---
<!-- DOCTOC SKIP -->

<div class="title-slide-wrapper">
  <img src="/qubes-logo-icon.png" class="title-logo-overlay" />

  <div class="title-content">
    <h1>Qubes OS</h1>
    <p>Das sicherste Betriebssystem der Welt</p>
  </div>
</div>

---

# Homepage

<div class="iframe-wrapper">
  <iframe src="https://www.qubes-os.org/"></iframe>
</div>

---
layout: image-right
image: /r4.0-xfce-three-domains-at-work.webp
backgroundSize: contain
---

# AppQube

<div class="qube-frame qube-yellow" data-qube="work">
  <h3>App Qube (VM)</h3>
  <p>Dateien bleiben erhalten</p>
</div>

---

# TemplateVM

<div style="display: flex; gap: 10px; align-items: center; justify-content: center;">
<div class="qube-frame qube-black" data-qube="fedora-38">
  <h3>TemplateVM</h3>
  <p>Einstellungen und Programme für VM</p>
</div>
<div><h3>-></h3></div>
<div class="qube-frame qube-green" data-qube="personal">
  <h3>firefox, openoffice</h3>
  <p>Erstellten Programme</p>
</div>
</div>

![templates](/templates_screenshot.png)

---
layout: image-right
image: /disposablevm-example.webp
backgroundSize: contain
---

# Disposable Qube

<div class="qube-frame qube-red" data-qube="disp1234">
  <h3>Disposable Qube (dispVM)</h3>
  <p>Wegwerf-VM für unsichere Operationen: E-Mail-Anhänge, Dateivorschau, USB-Zugriff.</p>
</div>

<!-- ![dispVM](/disposablevm-example.webp) -->

---
layout: image-right
image: /Bildschirmfoto_dom0.png
backgroundSize: contain
---

# Dom0

<div class="qube-frame qubes-gray" data-qube="dom0">
  <h3>Dom0: Admin Qube</h3>
  <p>Isolierte Administration ohne Netzwerkzugriff. Steuert Xen Hypervisor & GUI-Virtualisierung.</p>
</div>

---
layout: image
image: /650px-Xen_Arch_Diagram_v2.png
backgroundSize: contain
---

<!-- # Xen Architecture -->

<!-- ![Xen Architecture](/650px-Xen_Arch_Diagram_v2.png) -->

---
layout: image
image: /qubes-trust-level-architecture.webp
backgroundSize: contain
---

<!-- # Architecture & Features -->

<!-- <div class="architecture-grid"> -->
<!--   <div class="qube-frame qube-green" data-qube="vault"> -->
<!--     <h4>Trust Levels</h4> -->
<!--     <p>Isolierung nach Vertrauensstufen</p> -->
<!--   </div> -->
<!--   <div class="qube-frame qube-blue" data-qube="sys-windows"> -->
<!--     <h4>Windows 10/11</h4> -->
<!--     <p>HVM Integration via Qubes Windows Tools</p> -->
<!--   </div> -->
<!--   <div class="qube-frame qube-purple" data-qube="sys-whonix"> -->
<!--     <h4>Tor Network</h4> -->
<!--     <p>Anonymisierung aller Verbindungen über sys-whonix</p> -->
<!--   </div> -->
<!-- </div> -->

---

# Demo / USB Security

<!-- Video or Live Screen Sharing -->
<video
  src="/recording_h264.mp4"
  controls
  muted
  class="w-full max-h-96 rounded-md"
/>

---
layout: image-right
image: /gaming.png
backgroundSize: contain
---

# Sonstiges

- **Gaming:** Discrete GPU Passthrough (VT-d), 2. GPU benötigt

---
layout: image-right
image: /qubes-cloud.png
backgroundSize: contain
---

# Sonstiges

- **Qubes-Air:** Vorgestellt in 22.01.2018, noch in Bearbeitung
