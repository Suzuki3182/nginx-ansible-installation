#Install and configure Nginx using Ansible

Probably one of the easiest and most straight forward things we can do using Ansible is to install and configure a web server. Specifically Nginx. This is a straight to the point repository in order to have Nginx up and running using Ansible.

1. The Ansible Playbook to set up Nginx
examples/ansible/nginx.yml

---
- hosts: all
  tasks:
    - name: ensure nginx is at the latest version
      apt: name=nginx state=latest
      become: yes
    - name: start nginx
      service:
          name: nginx
          state: started
      become: yes
    - name: copy the nginx config file and restart nginx
      copy:
        src: /home/foo/static_site.cfg
        dest: /etc/nginx/sites-available/static_site.cfg
      become: yes
    - name: create symlink
      file:
        src: /etc/nginx/sites-available/static_site.cfg
        dest: /etc/nginx/sites-enabled/default
        state: link
      become: yes
    - name: copy the content of the web site
      copy:
        src: /home/foo/static-site-src/
        dest: /home/foo/static-site
    - name: restart nginx
      service:
        name: nginx
        state: restarted
      become: yes
      
2. Then run this command. Example:
     
ansible-playbook -i inventory.cfg  --limit 192.168.56.11 nginx.yml

3. Once everything is done go ahead and check. Example:

curl http://192.168.56.11

4. That should print the following:

<h1>Welcome to Ansible</h1>
<img src="/ansible-logo.jpg" />
