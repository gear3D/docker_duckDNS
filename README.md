# DuckDNS Updater (Alpine + Cron)

A lightweight Docker container that automatically updates your **DuckDNS** IP address twice daily using **Alpine Linux** and **cron**.

---

## Features

- Minimal **Alpine** base for a tiny footprint  
- Uses **`curl`** to update DuckDNS  
- Updates scheduled at **4:00 AM** and **4:00 PM** daily  
- Logs DuckDNS responses with timestamps directly to **Docker logs**  
- No growing log files — logs handled by Docker’s built-in logging  

---
