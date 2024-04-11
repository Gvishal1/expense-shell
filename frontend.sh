echo installing nginx
dnf install nginx -y >/tmp/expense.log

echo placing Expense Config File in Ngnix
cp expense.conf /etc/nginx/default.d/expense.conf >/tmp/expense.log

echo removing old Ngnix content
rm -rf /usr/share/nginx/html/* >/tmp/expense.log

echo Download Frontend Code
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >/tmp/expense.log

cd /usr/share/nginx/html

echo extracting frontend code
unzip /tmp/frontend.zip >/tmp/expense.log

echo starting ngnix service
systemctl enable nginx >/tmp/expense.log
systemctl restart nginx >/tmp/expense.log
